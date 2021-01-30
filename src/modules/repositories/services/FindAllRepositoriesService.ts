import { injectable, inject } from 'tsyringe';

import IFindAllRepositoriesDTO from '../dtos/IFindAllRepositoriesDTO';
import Repository from '../infra/typeorm/entities/Repository';
import IRepositoriesRepository from '../repositories/IRepositoriesRepository';

@injectable()
class FindAllRepositoriesService {
  constructor(
    @inject('RepositoriesRepository')
    private repositoriesRepository: IRepositoriesRepository,
  ) {}

  public async execute({
    limit,
    starting_after,
  }: IFindAllRepositoriesDTO): Promise<Repository[]> {
    let checkLimit = limit || 10;
    let checkStartingAfter = starting_after || 0;

    if (checkLimit > 100) {
      checkLimit = 100;
    }

    if (checkLimit < 1) {
      checkLimit = 10;
    }

    if (checkStartingAfter < 0) {
      checkStartingAfter = 0;
    }

    const respositories = this.repositoriesRepository.findAll({
      limit: checkLimit,
      starting_after: checkStartingAfter,
    });

    return respositories;
  }
}

export default FindAllRepositoriesService;
