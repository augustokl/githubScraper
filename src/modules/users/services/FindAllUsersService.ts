import { injectable, inject } from 'tsyringe';

import validationPagination from '@shared/utils/sharedValidation';
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
    order,
  }: IFindAllUsersDTO): Promise<User[]> {
    const { checkLimit, checkStartingAfter } = validationPagination(
      limit,
      starting_after,
    );

    const users = await this.usersRepository.findAll({
      starting_after: checkStartingAfter,
      limit: checkLimit,
      order,
    });

    return users;
  }
}

export default FindAllService;
