/* eslint-disable no-await-in-loop */
import axios from 'axios';
import { Router, Request, Response } from 'express';

const routes = Router();

routes.get(
  '/',
  async (request: Request, response: Response): Promise<Response> => {
    return response.json('Olá mundo');
  },
);

export default routes;
