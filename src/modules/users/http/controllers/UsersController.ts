import { Request, Response } from 'express';
import { container } from 'tsyringe';

import ISaveUserDTO from '@modules/users/dtos/ISaveUserDTO';

import SaveUserService from '@modules/users/services/SaveUserService';
import GetLastUserIdService from '@modules/users/services/GetLastUserIdService';

class UsersController {
  public async create(data: ISaveUserDTO): Promise<void> {
    const saveUserService = container.resolve(SaveUserService);

    await saveUserService.execute(data);
  }

  public async lastId(): Promise<number | undefined> {
    const getLastUserIdService = container.resolve(GetLastUserIdService);

    const response = await getLastUserIdService.execute();

    return response;
  }
}

export default UsersController;
