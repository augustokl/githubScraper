import IFindUserDTO from '../dtos/IFindUserDTO';
import ISaveUserDTO from '../dtos/ISaveUserDTO';
import User from '../infra/typeorm/entities/User';

export default interface IUsersRepository {
  save(data: ISaveUserDTO): Promise<void>;
  findUserById(data: IFindUserDTO): Promise<User | undefined>;
  findAll(): Promise<User[]>;
  getLastId(): Promise<number | undefined>;
}
