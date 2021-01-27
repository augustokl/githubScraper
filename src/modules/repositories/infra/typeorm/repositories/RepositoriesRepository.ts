import Repository from '@modules/repositories/infra/typeorm/entities/Repository';
import { getRepository, Repository as OrmRepository, Raw } from 'typeorm';

import IFindRepositoryFromUser from '@modules/repositories/dtos/IFindRepositoryFromUser';
import ISaveRepositoryDTO from '@modules/repositories/dtos/ISaveRepositoryDTO';
import IRepositoriesRepository from '@modules/repositories/repositories/IRepositoriesRepository';

class RepositoryRepositories implements IRepositoriesRepository {
  private ormRepository: OrmRepository<Repository>;

  constructor() {
    this.ormRepository = getRepository(Repository);
  }

  public async save(data: ISaveRepositoryDTO): Promise<void> {
    const repository = this.ormRepository.create(data);

    await this.ormRepository.save(repository);
  }

  public async findByUser({
    user_id,
  }: IFindRepositoryFromUser): Promise<Repository[]> {
    const findRepositories = await this.ormRepository.find({
      where: {
        user_id,
      },
      relations: ['user'],
      order: {
        id: 'ASC',
      },
    });

    return findRepositories;
  }

  public async findAll(): Promise<Repository[]> {
    const findRepositories = await this.ormRepository.find();
    return findRepositories;
  }
}

export default RepositoryRepositories;
