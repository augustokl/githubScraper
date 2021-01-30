import { injectable, inject } from 'tsyringe';

import { checkId } from '@shared/utils/sharedValidation';
import User from '../infra/typeorm/entities/User';

import IUsersRepository from '../repositories/IUsersRepository';

@injectable()
class FindUserByIdService {
  constructor(
    @inject('UsersRepository')
    private usersRepository: IUsersRepository,
  ) {}

  public async execute(id: number): Promise<User | Partial<User>> {
    checkId(id);

    const user = await this.usersRepository.findUserById(id);

    return user || {};
  }
}

export default FindUserByIdService;
