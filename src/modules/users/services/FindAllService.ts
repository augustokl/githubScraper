import { injectable, inject } from 'tsyringe';
import IFindAllUsersDTO from '../dtos/IFIndAllUsersDTO';
import User from '../infra/typeorm/entities/User';

import IUsersRepository from '../repositories/IUsersRepository';

@injectable()
class FindAllService {
  constructor(
    @inject('UsersRepository')
    private usersRepository: IUsersRepository,
  ) {}

  public async execute({
    starting_after,
    limit,
  }: IFindAllUsersDTO): Promise<User[]> {
    const users = await this.usersRepository.findAll({ starting_after, limit });

    return users;
  }
}

export default FindAllService;
