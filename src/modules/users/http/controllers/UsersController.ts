import { Request, Response } from 'express';
import { container } from 'tsyringe';

import ISaveUserDTO from '@modules/users/dtos/ISaveUserDTO';
import SaveUserService from '@modules/users/services/SaveUserService';

class UsersController {
  public async create(data: ISaveUserDTO): Promise<void> {
    const saveUserService = container.resolve(SaveUserService);

    await saveUserService.execute(data);
  }
}

export default UsersController;
