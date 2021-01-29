import Repository from '@modules/repositories/infra/typeorm/entities/Repository';
import { getRepository, Repository as OrmRepository, MoreThan } from 'typeorm';

import IFindRepositoryFromUserDTO from '@modules/repositories/dtos/IFindRepositoryFromUserDTO';
import ISaveRepositoryDTO from '@modules/repositories/dtos/ISaveRepositoryDTO';
import IRepositoriesRepository from '@modules/repositories/repositories/IRepositoriesRepository';
import IFindAllRepositoriesDTO from '@modules/repositories/dtos/IFindAllRepositoriesDTO';

class RepositoriesRepository implements IRepositoriesRepository {
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
  }: IFindRepositoryFromUserDTO): Promise<Repository[]> {
    const findRepositories = await this.ormRepository.find({
      where: {
        user_id,
      },
      relations: ['owner'],
      order: {
        id: 'ASC',
      },
    });

    return findRepositories;
  }

  public async findAll({
    from,
    per_page,
  }: IFindAllRepositoriesDTO): Promise<Repository[]> {
    const findRepositories = await this.ormRepository.find({
      where: {
        id: MoreThan(from),
      },
      relations: ['owner'],
      take: per_page,
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
