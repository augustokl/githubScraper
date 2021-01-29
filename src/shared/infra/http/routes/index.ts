import { Router } from 'express';

import repositoriesRouter from '@modules/repositories/infra/http/routes/repositories.routes';

const routes = Router();

routes.use('/repositories', repositoriesRouter);

export default routes;
