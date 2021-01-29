/* eslint-disable no-console */
import Queue from 'bull';
import redisConfig from '@shared/infra/redis';
import { format } from 'date-fns';

import Scraper from '@shared/infra/jobs/Scraper';

const scraperQueue = new Queue(Scraper.key, redisConfig);

scraperQueue.on('failed', (job, err) => {
  console.log('Job failed', job.name, job.data);
  console.log(err);
});

scraperQueue.on('active', () => {
  const time = format(new Date(), 'MM/dd/yyyy HH:mm');
  console.log('Job Start at ', time);
});

scraperQueue.on('progress', (_, progress) => {
  console.log('Progress job: ', `${progress} %`);
});

scraperQueue.on('completed', () => {
  const time = format(new Date(), 'MM/dd/yyyy HH:mm');
  console.log('Job finish at ', time);
});

export default scraperQueue;
