import { getRepository, Repository } from 'typeorm';
import IUsersRepository from '@modules/users/repositories/IUsersRepository';
import IFindUserDTO from '@modules/users/dtos/IFindUserDTO';
import ISaveUserDTO from '@modules/users/dtos/ISaveUserDTO';
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

  public async findUserById({ id }: IFindUserDTO): Promise<User | undefined> {
    const findUser = this.ormRepository.findOne({
      where: {
        id,
      },
    });

    return findUser;
  }

  findAll(): Promise<User[]> {
    const findUsers = this.ormRepository.find();

    return findUsers;
  }
}

export default UsersRepository;
