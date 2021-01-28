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

  public async execute(data: IFindAllRepositoriesDTO): Promise<Repository[]> {
    const respositories = this.repositoriesRepository.findAll(data);

    return respositories;
  }
}

export default FindAllRepositoriesService;
