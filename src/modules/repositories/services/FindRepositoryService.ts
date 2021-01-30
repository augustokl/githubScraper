import { injectable, inject } from 'tsyringe';
import AppError from '@shared/errors/AppError';

import Repository from '../infra/typeorm/entities/Repository';
import IRepositoriesRepository from '../repositories/IRepositoriesRepository';

@injectable()
class FindRepositoryService {
  constructor(
    @inject('RepositoriesRepository')
    private repositoriesRepository: IRepositoriesRepository,
  ) {}

  public async execute(id: number): Promise<Repository | Partial<Repository>> {
    if (!Number.isInteger(id)) {
      throw new AppError('Id given is not an integer.', 400);
    }

    if (id > 2147483647) {
      throw new AppError('Id is bigger than 2,147,483,647.', 400);
    }

    const repository = await this.repositoriesRepository.findRepository(id);

    return repository || {};
  }
}

export default FindRepositoryService;
