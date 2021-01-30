import { Request, Response } from 'express';
import { container } from 'tsyringe';
import { classToClass } from 'class-transformer';

import ICreateRepositoryDTO from '@modules/repositories/dtos/ICreateRepositoryDTO';

import CreateRepositoryService from '@modules/repositories/services/CreateRepositoryService';
import FindAllRepositoriesService from '@modules/repositories/services/FindAllRepositoriesService';
import FindRepositoryService from '@modules/repositories/services/FindRepositoryService';

class RepositoriesController {
  public async index(request: Request, response: Response): Promise<Response> {
    const { limit, starting_after } = request.query;

    const findAllRepositoriesService = container.resolve(
      FindAllRepositoriesService,
    );

    const repositories = await findAllRepositoriesService.execute({
      limit: Number(limit),
      starting_after: Number(starting_after),
    });

    return response.json(classToClass(repositories));
  }

  public async find(request: Request, response: Response): Promise<Response> {
    const { id } = request.params;

    const findRepositoryService = container.resolve(FindRepositoryService);

    const repository = await findRepositoryService.execute(Number(id));

    return response.json(classToClass(repository));
  }

  public async create(data: ICreateRepositoryDTO): Promise<void> {
    const createRepositoryService = container.resolve(CreateRepositoryService);

    await createRepositoryService.execute(data);
  }
}

export default RepositoriesController;
