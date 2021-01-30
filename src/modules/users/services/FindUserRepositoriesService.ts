import { injectable, inject } from 'tsyringe';

import validationPagination from '@shared/utils/sharedValidation';

import IRepositoriesRepository from '@modules/repositories/repositories/IRepositoriesRepository';
import Repository from '@modules/repositories/infra/typeorm/entities/Repository';
import IFIndUserRepositoriesDTO from '../dtos/IFIndUserRepositoriesDTO copy';

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
  }: IFIndUserRepositoriesDTO): Promise<Repository[]> {
    const { checkLimit, checkStartingAfter } = validationPagination(
      limit,
      starting_after,
    );

    const repositories = await this.repositoriesRepository.findByUser({
      id,
      limit: checkLimit,
      starting_after: checkStartingAfter,
    });

    return repositories;
  }
}

export default FindRepositoriesByUserService;
