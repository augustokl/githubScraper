import { Request, Response } from 'express';
import { container } from 'tsyringe';
import { classToClass } from 'class-transformer';

import ISaveRepositoryDTO from '@modules/repositories/dtos/ISaveRepositoryDTO';

import SaveRepositoryService from '@modules/repositories/services/SaveRepositoryService';
import FindAllRepositoriesService from '@modules/repositories/services/FindAllRepositoriesService';
import FindRepositoryService from '@modules/repositories/services/FindRepositoryService';

class RepositoriesController {
  public async index(request: Request, response: Response): Promise<Response> {
    const { per_page, from } = request.query;

    const findAllRepositoriesService = container.resolve(
      FindAllRepositoriesService,
    );

    const repositories = await findAllRepositoriesService.execute({
      per_page: Number(per_page),
      from: Number(from || 0),
    });

    return response.json(classToClass(repositories));
  }

  public async find(request: Request, response: Response): Promise<Response> {
    const { id } = request.params;

    const findRepositoryService = container.resolve(FindRepositoryService);

    const repository = await findRepositoryService.execute(Number(id));

    return response.json(classToClass(repository));
  }

  public async create(data: ISaveRepositoryDTO): Promise<void> {
    const saveRepositoryService = container.resolve(SaveRepositoryService);

    await saveRepositoryService.execute(data);
  }
}

export default RepositoriesController;
