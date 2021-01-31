import { Router } from 'express';
import { celebrate, Segments, Joi } from 'celebrate';

import UsersController from '../controllers/UsersController';

const usersRouter = Router();
const usersController = new UsersController();

usersRouter.get(
  '/',
  celebrate({
    [Segments.QUERY]: {
      order: Joi.string().uppercase().valid('ASC', 'DESC').failover('ASC'),
    },
  }),
  usersController.index,
);
usersRouter.get(
  '/:id',
  celebrate({
    [Segments.PARAMS]: {
      id: Joi.number().integer().max(2147483647).messages({
        'number.base': 'Id given is not an integer',
        'number.max': 'Id is bigger than 2,147,483,647.',
      }),
    },
  }),
  usersController.find,
);
usersRouter.get(
  '/:id/repositories',
  celebrate({
    [Segments.PARAMS]: {
      id: Joi.number().integer().max(2147483647).messages({
        'number.base': 'Id given is not an integer',
        'number.max': 'Id is bigger than 2,147,483,647.',
      }),
    },
    [Segments.QUERY]: {
      order: Joi.string().uppercase().valid('ASC', 'DESC').failover('ASC'),
    },
  }),
  usersController.findRepositories,
);

export default usersRouter;
