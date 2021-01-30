import IFindAllUsersDTO from '../dtos/IFIndAllUsersDTO';
import ICreateUserDTO from '../dtos/ICreateUserDTO';
import User from '../infra/typeorm/entities/User';

export default interface IUsersRepository {
  create(data: ICreateUserDTO): Promise<User>;
  findUserById(id: number): Promise<User | undefined>;
  findAll(data: IFindAllUsersDTO): Promise<User[]>;
  getLastId(): Promise<number | undefined>;
}
