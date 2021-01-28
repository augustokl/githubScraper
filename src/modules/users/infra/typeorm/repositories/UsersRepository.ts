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
    const findUser = await this.ormRepository.findOne({
      where: {
        id,
      },
    });

    return findUser;
  }

  public async findAll(): Promise<User[]> {
    const findUsers = await this.ormRepository.find();

    return findUsers;
  }

  public async getLastId(): Promise<number | undefined> {
    const [user] = await this.ormRepository.find({
      take: 1,
      order: { id: 'DESC' },
    });

    if (!user) {
      return 0;
    }

    return user.id;
  }
}

export default UsersRepository;
