import IUsersRepository from '@modules/users/repositories/IUsersRepository';
import ICreateUserDTO from '@modules/users/dtos/ICreateUserDTO';
import IFindAllUsersDTO from '@modules/users/dtos/IFIndAllUsersDTO';

import User from '../../infra/typeorm/entities/User';

class UsersRepository implements IUsersRepository {
  private users: User[] = [];

  public async create(data: ICreateUserDTO): Promise<User> {
    const user = new User();

    Object.assign(user, data);

    this.users.push(user);

    return user;
  }

  public async findUserById(id: number): Promise<User | undefined> {
    const user = this.users.find(currentUser => currentUser.id === id);

    return user;
  }

  public async findAll({
    starting_after,
    limit,
    order,
  }: IFindAllUsersDTO): Promise<User[]> {
    if (order === 'ASC') {
      const users = this.users
        .filter(currentUser => currentUser.id > starting_after)
        .slice(0, limit);

      return users;
    }

    const users = this.users
      .reverse()
      .filter(currentUser =>
        currentUser.id < starting_after ? starting_after : this.users.length,
      )
      .slice(0, limit);

    return users;
  }

  public async getLastId(): Promise<number | undefined> {
    const user = this.users.pop();

    if (!user) {
      return undefined;
    }

    return user.id;
  }
}

export default UsersRepository;
