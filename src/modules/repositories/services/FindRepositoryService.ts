import { injectable, inject } from 'tsyringe';

import Repository from '../infra/typeorm/entities/Repository';
import IRepositoriesRepository from '../repositories/IRepositoriesRepository';

@injectable()
class FindRepositoryService {
  constructor(
    @inject('RepositoriesRepository')
    private repositoriesRepository: IRepositoriesRepository,
  ) {}

  public async execute(id: number): Promise<Repository | Partial<Repository>> {
    const repository = await this.repositoriesRepository.findRepository(id);

    return repository || {};
  }
}

export default FindRepositoryService;
