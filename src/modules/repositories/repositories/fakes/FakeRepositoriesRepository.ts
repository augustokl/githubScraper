import IRepositoriesRepository from '../IRepositoriesRepository';
import ICreateRepositoryDTO from '../../dtos/ICreateRepositoryDTO';
import IFindAllRepositoriesDTO from '../../dtos/IFindAllRepositoriesDTO';
import IFindRepositoryFromUserDTO from '../../dtos/IFindRepositoryFromUserDTO';

import Repository from '../../infra/typeorm/entities/Repository';

class RepositoriesRepository implements IRepositoriesRepository {
  private repositories: Repository[] = [];

  public async create(data: ICreateRepositoryDTO): Promise<Repository> {
    const repository = new Repository();

    Object.assign(repository, data);

    this.repositories.push(repository);

    return repository;
  }

  public async findByUser({
    id,
    limit,
    starting_after,
    order,
  }: IFindRepositoryFromUserDTO): Promise<Repository[]> {
    if (order === 'ASC') {
      const repositories = this.repositories
        .filter(repository => repository.user_id === id)
        .filter(repository => repository.id > starting_after)
        .splice(0, limit);
      return repositories;
    }

    const repositories = this.repositories
      .filter(repository => repository.user_id === id)
      .reverse()
      .filter(repository =>
        repository.id < starting_after
          ? starting_after
          : this.repositories.length,
      )
      .splice(0, limit);

    return repositories;
  }

  public async findAll({
    starting_after,
    limit,
    order,
  }: IFindAllRepositoriesDTO): Promise<Repository[]> {
    if (order === 'ASC') {
      const repositories = this.repositories
        .filter(repository => repository.id > starting_after)
        .splice(0, limit);

      return repositories;
    }

    const repositories = this.repositories
      .reverse()
      .filter(repository =>
        repository.id < starting_after
          ? starting_after
          : this.repositories.length,
      )
      .splice(0, limit);

    return repositories;
  }

  public async findRepository(id: number): Promise<Repository | undefined> {
    const repository = this.repositories.find(repos => repos.id === id);

    return repository;
  }
}

export default RepositoriesRepository;
