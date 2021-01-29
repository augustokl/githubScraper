import { getRepository, LessThan, MoreThan, Repository } from 'typeorm';
import IUsersRepository from '@modules/users/repositories/IUsersRepository';
import ISaveUserDTO from '@modules/users/dtos/ISaveUserDTO';
import IFindAllUsersDTO from '@modules/users/dtos/IFIndAllUsersDTO';
import User from '../entities/User';

class UsersRepository implements IUsersRepository {
  private ormRepository: Repository<User>;

  constructor() {
    this.ormRepository = getRepository(User);
  }

  public async save(data: ISaveUserDTO): Promise<void> {
    const user = this.ormRepository.create(data);

    await this.ormRepository.save(user);
  }

  public async findUserById(id: number): Promise<User | undefined> {
    const findUser = await this.ormRepository.findOne({
      where: {
        id,
      },
    });

    return findUser;
  }

  public async findAll({
    starting_after,
    limit,
  }: IFindAllUsersDTO): Promise<User[]> {
    const findUsers = await this.ormRepository.find({
      where: {
        id: MoreThan(starting_after),
      },
      take: limit,
      order: {
        id: 'ASC',
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
