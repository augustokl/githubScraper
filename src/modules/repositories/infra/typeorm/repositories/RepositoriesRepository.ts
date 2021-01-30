import Repository from '@modules/repositories/infra/typeorm/entities/Repository';
import { getRepository, Repository as OrmRepository, MoreThan } from 'typeorm';

import IFindRepositoryFromUserDTO from '@modules/repositories/dtos/IFindRepositoryFromUserDTO';
import ICreateRepositoryDTO from '@modules/repositories/dtos/ICreateRepositoryDTO';
import IRepositoriesRepository from '@modules/repositories/repositories/IRepositoriesRepository';
import IFindAllRepositoriesDTO from '@modules/repositories/dtos/IFindAllRepositoriesDTO';

class RepositoriesRepository implements IRepositoriesRepository {
  private ormRepository: OrmRepository<Repository>;

  constructor() {
    this.ormRepository = getRepository(Repository);
  }

  public async create(data: ICreateRepositoryDTO): Promise<Repository> {
    const repository = this.ormRepository.create(data);

    const newRepository = await this.ormRepository.save(repository);

    return newRepository;
  }

  public async findByUser({
    id,
    limit,
    starting_after,
  }: IFindRepositoryFromUserDTO): Promise<Repository[]> {
    const findRepositories = await this.ormRepository.find({
      where: {
        user_id: id,
        id: MoreThan(starting_after),
      },
      take: limit,
      relations: ['owner'],
      order: {
        id: 'ASC',
      },
    });

    return findRepositories;
  }

  public async findAll({
    starting_after,
    limit,
  }: IFindAllRepositoriesDTO): Promise<Repository[]> {
    const findRepositories = await this.ormRepository.find({
      where: {
        id: MoreThan(starting_after),
      },
      relations: ['owner'],
      take: limit,
      order: {
        id: 'ASC',
      },
    });

    return findRepositories;
  }

  public async findRepository(id: number): Promise<Repository | undefined> {
    const findRepository = await this.ormRepository.findOne({
      where: { id },
      relations: ['owner'],
    });

    return findRepository;
  }
}

export default RepositoriesRepository;
