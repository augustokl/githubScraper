import express, { Request, Response, NextFunction } from 'express';

import routes from './routes';

import '@shared/infra/typeorm';
import 'dotenv/config';
import 'reflect-metadata';

const app = express();

app.use(express.json());
app.use(routes);

app.listen(3333, () => {
  console.log('💥 Server Start!');
});
