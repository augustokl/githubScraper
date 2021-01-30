import { Router } from 'express';
import { celebrate, Joi, Segments } from 'celebrate';

import RepositoriesController from '../controllers/RepositoriesController';

const repositoriesRouter = Router();
const repositoriesController = new RepositoriesController();

repositoriesRouter.get('/', repositoriesController.index);
repositoriesRouter.get(
  '/:id',
  celebrate({
    [Segments.PARAMS]: {
      id: Joi.number().integer().max(2147483647).messages({
        'number.base': 'Id given is not an integer',
        'number.max': 'Id is bigger than 2,147,483,647.',
      }),
    },
  }),
  repositoriesController.find,
);

export default repositoriesRouter;
