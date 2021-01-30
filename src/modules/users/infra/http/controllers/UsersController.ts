import { Request, Response } from 'express';
import { container } from 'tsyringe';
import { classToClass } from 'class-transformer';

import ICreateUserDTO from '@modules/users/dtos/ICreateUserDTO';

import CreateUserService from '@modules/users/services/CreateUserService';
import GetLastUserIdService from '@modules/users/services/GetLastUserIdService';
import FindAllUsersService from '@modules/users/services/FindAllUsersService';
import FindUserByIdService from '@modules/users/services/FindUserByIdService';
import FindUserRepositoriesService from '@modules/users/services/FindUserRepositoriesService';

class UsersController {
  public async index(request: Request, response: Response): Promise<Response> {
    const { limit, starting_after } = request.query;

    const findAllUsersService = container.resolve(FindAllUsersService);

    const users = await findAllUsersService.execute({
      limit: Number(limit),
      starting_after: Number(starting_after),
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
    const { limit, starting_after } = request.query;

    const findUserRepositoriesService = container.resolve(
      FindUserRepositoriesService,
    );

    const repositories = await findUserRepositoriesService.execute({
      id: Number(id),
      limit: Number(limit),
      starting_after: Number(starting_after),
    });

    return response.json(classToClass(repositories));
  }

  public async create(data: ICreateUserDTO): Promise<void> {
    const createUserService = container.resolve(CreateUserService);

    await createUserService.execute(data);
  }

  public async lastId(): Promise<number | undefined> {
    const getLastUserIdService = container.resolve(GetLastUserIdService);

    const response = await getLastUserIdService.execute();

    return response;
  }
}

export default UsersController;
