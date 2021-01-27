import Repository from '@modules/repositories/infra/typeorm/entities/Repository';
import IFindRepositoryFromUser from '../dtos/IFindRepositoryFromUser';
import ISaveRepository from '../dtos/ISaveRepositoryDTO';

export default interface IRepositoriesRepository {
  save(data: ISaveRepository): Promise<void>;
  findByUser(data: IFindRepositoryFromUser): Promise<Repository[]>;
  findAll(): Promise<Repository[]>;
}
