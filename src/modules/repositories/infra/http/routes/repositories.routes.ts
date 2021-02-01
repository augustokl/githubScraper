import { Router } from 'express';
import { celebrate, Joi, Segments } from 'celebrate';

import RepositoriesController from '../controllers/RepositoriesController';

const repositoriesRouter = Router();
const repositoriesController = new RepositoriesController();

repositoriesRouter.get(
  '/',
  celebrate({
    [Segments.QUERY]: {
      order: Joi.string()
        .uppercase()
        .valid('ASC', 'DESC')
        .failover('ASC')
        .default('ASC'),
      limit: Joi.number().integer().failover(10).default(10),
      starting_after: Joi.number().integer().failover(0).default(0),
    },
  }),
  repositoriesController.index,
);
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
