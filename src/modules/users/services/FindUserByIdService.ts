import { injectable, inject } from 'tsyringe';

import User from '../infra/typeorm/entities/User';

import IUsersRepository from '../repositories/IUsersRepository';

@injectable()
class FindUserByIdService {
  constructor(
    @inject('UsersRepository')
    private usersRepository: IUsersRepository,
  ) {}

  public async execute(id: number): Promise<User | Partial<User>> {
    const user = await this.usersRepository.findUserById(id);

    return user || {};
  }
}

export default FindUserByIdService;
