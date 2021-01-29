import { Request, Response } from 'express';
import { container } from 'tsyringe';
import { classToClass } from 'class-transformer';

import ISaveUserDTO from '@modules/users/dtos/ISaveUserDTO';

import SaveUserService from '@modules/users/services/SaveUserService';
import GetLastUserIdService from '@modules/users/services/GetLastUserIdService';
import FindAllService from '@modules/users/services/FindAllService';
import FindUserByIdService from '@modules/users/services/FindUserByIdService';
import FindRepositoriesByUserService from '@modules/users/services/FindRepositoriesByUserService';

class UsersController {
  public async index(request: Request, response: Response): Promise<Response> {
    const { limit, starting_after } = request.query;

    const findAllService = container.resolve(FindAllService);

    const users = await findAllService.execute({
      limit: Number(limit || 10),
      starting_after: Number(starting_after || 0),
    });

    return response.json(users);
  }

  public async find(request: Request, response: Response): Promise<Response> {
    const { id } = request.params;

    const findUserByIdService = container.resolve(FindUserByIdService);

    const user = await findUserByIdService.execute(Number(id));

    return response.json(user);
  }

  public async findRepositories(
    request: Request,
    response: Response,
  ): Promise<Response> {
    const { id } = request.params;

    const findRepositoriesByUserService = container.resolve(
      FindRepositoriesByUserService,
    );

    const repositories = await findRepositoriesByUserService.execute(
      Number(id),
    );

    return response.json(classToClass(repositories));
  }

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
