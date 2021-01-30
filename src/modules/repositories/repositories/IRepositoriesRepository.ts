import Repository from '@modules/repositories/infra/typeorm/entities/Repository';
import IFindAllRepositoriesDTO from '../dtos/IFindAllRepositoriesDTO';
import IFindRepositoryFromUserDTO from '../dtos/IFindRepositoryFromUserDTO';
import ICreateRepositoryDTO from '../dtos/ICreateRepositoryDTO';

export default interface IRepositoriesRepository {
  create(data: ICreateRepositoryDTO): Promise<Repository>;
  findByUser(data: IFindRepositoryFromUserDTO): Promise<Repository[]>;
  findAll(data: IFindAllRepositoriesDTO): Promise<Repository[]>;
  findRepository(id: number): Promise<Repository | undefined>;
}
