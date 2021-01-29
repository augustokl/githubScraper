import Repository from '@modules/repositories/infra/typeorm/entities/Repository';
import IFindAllRepositoriesDTO from '../dtos/IFindAllRepositoriesDTO';
import IFindRepositoryFromUserDTO from '../dtos/IFindRepositoryFromUserDTO';
import ISaveRepository from '../dtos/ISaveRepositoryDTO';

export default interface IRepositoriesRepository {
  save(data: ISaveRepository): Promise<void>;
  findByUser(data: IFindRepositoryFromUserDTO): Promise<Repository[]>;
  findAll(data: IFindAllRepositoriesDTO): Promise<Repository[]>;
  findRepository(id: number): Promise<Repository | undefined>;
}
