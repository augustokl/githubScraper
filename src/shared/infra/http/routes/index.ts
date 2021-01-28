import { Router } from 'express';

import repositoriesRouter from '@modules/repositories/http/routes/repositories.routes';

const routes = Router();

routes.use('/repositories', repositoriesRouter);

export default routes;
