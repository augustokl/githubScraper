import { injectable, inject } from 'tsyringe';

import ICreateUserDTO from '../dtos/ICreateUserDTO';
import IUsersRepository from '../repositories/IUsersRepository';
import User from '../infra/typeorm/entities/User';

@injectable()
class SaveUserService {
  constructor(
    @inject('UsersRepository')
    private usersRepository: IUsersRepository,
  ) {}

  public async execute(data: ICreateUserDTO): Promise<User> {
    const user = await this.usersRepository.create(data);

    return user;
  }
}

export default SaveUserService;
