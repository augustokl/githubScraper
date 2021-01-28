import 'dotenv/config';
import 'reflect-metadata';

import '@shared/infra/typeorm';
import '@shared/container';

import Queue from '@config/lib/queue';
import Scraper from '../jobs/Scraper';

(async () => {
  await Queue.add({}, { repeat: { cron: '*/5 * * * *' } });
})();

Queue.process(Scraper.handle);
