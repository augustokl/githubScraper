import IFindAllUsersDTO from '../dtos/IFIndAllUsersDTO';
import ISaveUserDTO from '../dtos/ISaveUserDTO';
import User from '../infra/typeorm/entities/User';

export default interface IUsersRepository {
  save(data: ISaveUserDTO): Promise<void>;
  findUserById(id: number): Promise<User | undefined>;
  findAll(data: IFindAllUsersDTO): Promise<User[]>;
  getLastId(): Promise<number | undefined>;
}
