import { injectable, inject } from 'tsyringe';
import validationPagination from '@shared/utils/sharedValidation';

import IFindAllRepositoriesDTO from '../dtos/IFindAllRepositoriesDTO';
import IRepositoriesRepository from '../repositories/IRepositoriesRepository';

import Repository from '../infra/typeorm/entities/Repository';

@injectable()
class FindAllRepositoriesService {
  constructor(
    @inject('RepositoriesRepository')
    private repositoriesRepository: IRepositoriesRepository,
  ) {}

  public async execute({
    limit,
    starting_after,
    order,
  }: IFindAllRepositoriesDTO): Promise<Repository[]> {
    const { checkLimit, checkStartingAfter } = validationPagination(
      limit,
      starting_after,
    );

    const respositories = this.repositoriesRepository.findAll({
      limit: checkLimit,
      starting_after: checkStartingAfter,
      order,
    });

    return respositories;
  }
}

export default FindAllRepositoriesService;
