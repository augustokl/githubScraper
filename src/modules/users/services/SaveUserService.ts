import { injectable, inject } from 'tsyringe';

import ISaveUserDTO from '../dtos/ISaveUserDTO';
import IUsersRepository from '../repositories/IUsersRepository';

@injectable()
class SaveUserService {
  constructor(
    @inject('UsersRepository')
    private usersRepository: IUsersRepository,
  ) {}

  public async execute(data: ISaveUserDTO): Promise<void> {
    await this.usersRepository.save(data);
  }
}

export default SaveUserService;
