import { getRepository, LessThan, MoreThan, Repository } from 'typeorm';

import IUsersRepository from '@modules/users/repositories/IUsersRepository';
import ICreateUserDTO from '@modules/users/dtos/ICreateUserDTO';
import IFindAllUsersDTO from '@modules/users/dtos/IFIndAllUsersDTO';

import User from '../entities/User';

class UsersRepository implements IUsersRepository {
  private ormRepository: Repository<User>;

  constructor() {
    this.ormRepository = getRepository(User);
  }

  public async create(data: ICreateUserDTO): Promise<User> {
    const user = this.ormRepository.create(data);

    const newUser = await this.ormRepository.save(user);

    return newUser;
  }

  public async findUserById(id: number): Promise<User | undefined> {
    const findUser = await this.ormRepository.findOne({
      where: {
        id,
      },
      cache: {
        id: `user:find:${id}`,
        milliseconds: 10000,
      },
    });

    return findUser;
  }

  public async findAll({
    starting_after,
    limit,
    order,
  }: IFindAllUsersDTO): Promise<User[]> {
    const moreOrLess =
      order === 'DESC' ? LessThan(starting_after) : MoreThan(starting_after);
    const hasOrder = starting_after ? { id: moreOrLess } : {};

    const findUsers = await this.ormRepository.find({
      select: ['id', 'name', 'login', 'url', 'bio', 'location', 'company'],
      where: hasOrder,
      take: limit,
      order: {
        id: order,
      },
      cache: {
        id: `user:find:${limit}-${starting_after}-${order}`,
        milliseconds: 5000,
      },
    });

    return findUsers;
  }

  public async getLastId(): Promise<number | undefined> {
    const user = await this.ormRepository.findOne({
      order: { id: 'DESC' },
    });

    if (!user) {
      return 0;
    }

    return user.id;
  }
}

export default UsersRepository;
