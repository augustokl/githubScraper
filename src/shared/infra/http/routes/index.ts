/* eslint-disable no-await-in-loop */
import axios from 'axios';
import { Router, Request, Response } from 'express';

const routes = Router();

routes.get(
  '/',
  async (request: Request, response: Response): Promise<Response> => {
    const api = axios.create({
      baseURL: 'https://api.github.com',
      auth: { username: 'augustokl', password: '' },
      headers: { Accept: 'application/vnd.github.v3+json' },
    });
    const { data } = await api.get('/users');
    const returnRepos = [];

    // eslint-disable-next-line no-restricted-syntax
    for (const row of data) {
      const { data: userRepos } = await api.get(`/users/${row.login}/repos`);
      returnRepos.push(userRepos);
    }

    return response.json('Olá mundo');
  },
);

export default routes;
