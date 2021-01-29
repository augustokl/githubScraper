import { injectable, inject } from 'tsyringe';

import IRepositoriesRepository from '@modules/repositories/repositories/IRepositoriesRepository';
import Repository from '@modules/repositories/infra/typeorm/entities/Repository';

@injectable()
class FindRepositoriesByUserService {
  constructor(
    @inject('RepositoriesRepository')
    private repositoriesRepository: IRepositoriesRepository,
  ) {}

  public async execute(user_id: number): Promise<Repository[]> {
    const repositories = await this.repositoriesRepository.findByUser({
      user_id,
    });

    return repositories;
  }
}

export default FindRepositoriesByUserService;
