import { injectable, inject } from 'tsyringe';

import ISaveRepository from '../dtos/ISaveRepositoryDTO';
import IRepositoriesRepository from '../repositories/IRepositoriesRepository';

@injectable()
class SaveRepositoryService {
  constructor(
    @inject('RepositoriesRepository')
    private repositoriesRepository: IRepositoriesRepository,
  ) {}

  public async execute(data: ISaveRepository): Promise<void> {
    await this.repositoriesRepository.save(data);
  }
}

export default SaveRepositoryService;
