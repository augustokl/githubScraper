import Repository from '@modules/repositories/infra/typeorm/entities/Repository';
import {
  getRepository,
  Repository as OrmRepository,
  MoreThan,
  LessThan,
} from 'typeorm';

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
    order,
  }: IFindRepositoryFromUserDTO): Promise<Repository[]> {
    const moreOrLess =
      order === 'DESC' ? LessThan(starting_after) : MoreThan(starting_after);
    const hasOrder = starting_after
      ? { user_id: id, id: moreOrLess }
      : { user_id: id };

    const findRepositories = await this.ormRepository.find({
      where: hasOrder,
      take: limit,
      order: {
        id: order,
      },
      cache: {
        id: `repository:find:${id}-${limit}-${starting_after}-${order}`,
        milliseconds: 5000,
      },
    });

    return findRepositories;
  }

  public async findAll({
    starting_after,
    limit,
    order,
  }: IFindAllRepositoriesDTO): Promise<Repository[]> {
    const moreOrLess =
      order === 'DESC' ? LessThan(starting_after) : MoreThan(starting_after);
    const hasOrder = starting_after ? { id: moreOrLess } : {};

    const findRepositories = await this.ormRepository.find({
      select: [
        'id',
        'name',
        'html_url',
        'description',
        'language',
        'clone_url',
      ],
      where: hasOrder,
      relations: ['owner'],
      take: limit,
      order: {
        id: order,
      },
      cache: {
        id: `repository:find:${limit}-${starting_after}-${order}`,
        milliseconds: 5000,
      },
    });

    return findRepositories;
  }

  public async findRepository(id: number): Promise<Repository | undefined> {
    const findRepository = await this.ormRepository.findOne({
      where: { id },
      relations: ['owner'],
      cache: {
        id: `repository:find:${id}`,
        milliseconds: 5000,
      },
    });

    return findRepository;
  }
}

export default RepositoriesRepository;
