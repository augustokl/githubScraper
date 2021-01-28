import { Request, Response } from 'express';
import { container } from 'tsyringe';

import ISaveRepositoryDTO from '@modules/repositories/dtos/ISaveRepositoryDTO';
import SaveRepositoryService from '@modules/repositories/services/SaveRepositoryService';

class RepositoriesController {
  public async create(data: ISaveRepositoryDTO): Promise<void> {
    const saveRepositoryService = container.resolve(SaveRepositoryService);

    await saveRepositoryService.execute(data);
  }
}

export default RepositoriesController;
