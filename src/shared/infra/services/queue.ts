import 'dotenv/config';
import 'reflect-metadata';

import '@shared/infra/typeorm';
import '@shared/container';

import Queue from '@config/lib/queue';
import Scraper from '../jobs/Scraper';

(async () => {
  const schedule = process.env.CRON_SCHEDULE || '*/5 * * * *';

  await Queue.add({}, { repeat: { cron: schedule } });
})();

Queue.process(Scraper.handle);
