import { injectable, inject } from 'tsyringe';

import Repository from '../infra/typeorm/entities/Repository';

import ICreateRepositoryDTO from '../dtos/ICreateRepositoryDTO';
import IRepositoriesRepository from '../repositories/IRepositoriesRepository';

@injectable()
class SaveRepositoryService {
  constructor(
    @inject('RepositoriesRepository')
    private repositoriesRepository: IRepositoriesRepository,
  ) {}

  public async execute(data: ICreateRepositoryDTO): Promise<Repository> {
    const repository = await this.repositoriesRepository.create(data);

    return repository;
  }
}

export default SaveRepositoryService;
