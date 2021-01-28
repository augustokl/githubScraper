import { injectable, inject } from 'tsyringe';

import IUsersRepository from '../repositories/IUsersRepository';

@injectable()
class GetLastUserIdService {
  constructor(
    @inject('UsersRepository')
    private usersRepository: IUsersRepository,
  ) {}

  public async execute(): Promise<number | undefined> {
    const id = await this.usersRepository.getLastId();

    return id;
  }
}

export default GetLastUserIdService;
