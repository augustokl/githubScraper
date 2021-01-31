import { injectable, inject } from 'tsyringe';

import validatePagination from '@shared/utils/sharedValidation';

import IRepositoriesRepository from '@modules/repositories/repositories/IRepositoriesRepository';
import Repository from '@modules/repositories/infra/typeorm/entities/Repository';
import IFIndUserRepositoriesDTO from '../dtos/IFIndUserRepositoriesDTO';

@injectable()
class FindRepositoriesByUserService {
  constructor(
    @inject('RepositoriesRepository')
    private repositoriesRepository: IRepositoriesRepository,
  ) {}

  public async execute({
    id,
    limit,
    starting_after,
    order,
  }: IFIndUserRepositoriesDTO): Promise<Repository[]> {
    const { checkLimit, checkStartingAfter } = validatePagination(
      limit,
      starting_after,
    );

    const repositories = await this.repositoriesRepository.findByUser({
      id,
      limit: checkLimit,
      starting_after: checkStartingAfter,
      order,
    });

    return repositories;
  }
}

export default FindRepositoriesByUserService;
