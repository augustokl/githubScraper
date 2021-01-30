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
    user_id,
  }: IFindRepositoryFromUserDTO): Promise<Repository[]> {
    const repositories = this.repositories.filter(
      repository => repository.user_id === user_id,
    );

    return repositories;
  }

  public async findAll({
    starting_after,
    limit,
  }: IFindAllRepositoriesDTO): Promise<Repository[]> {
    const repositories = this.repositories
      .filter(repository => repository.id > starting_after)
      .splice(0, limit);

    return repositories;
  }

  public async findRepository(id: number): Promise<Repository | undefined> {
    const repository = this.repositories.find(repos => repos.id === id);

    return repository;
  }
}

export default RepositoriesRepository;
