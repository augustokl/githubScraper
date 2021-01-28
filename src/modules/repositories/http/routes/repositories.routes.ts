import { Router } from 'express';

import RepositoriesController from '../controllers/RepositoriesController';

const repositoriesRouter = Router();
const repositoriesController = new RepositoriesController();

repositoriesRouter.get('/', repositoriesController.index);

export default repositoriesRouter;
