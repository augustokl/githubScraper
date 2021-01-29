import { Router } from 'express';

import repositoriesRouter from '@modules/repositories/infra/http/routes/repositories.routes';
import usersRouter from '@modules/users/infra/http/routes/users.routes';

const routes = Router();

routes.use('/repositories', repositoriesRouter);
routes.use('/users', usersRouter);

export default routes;
