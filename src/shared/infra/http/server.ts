import 'dotenv/config';
import 'reflect-metadata';

import express from 'express';

import { errors } from 'celebrate';
import routes from './routes';
import rateLimiter from './middlewares/RateLimiter';

import '@shared/infra/typeorm';
import '@shared/container';

const app = express();

app.use(rateLimiter);
app.use(express.json());
app.use(routes);

app.use(errors());

app.listen(3333, () => {
  console.log(`💥 Server Start! ${process.env.APP_API_URL}`);
});
