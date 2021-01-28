import Queue from 'bull';
import redisConfig from '@shared/infra/redis';

import Scraper from '@shared/infra/jobs/Scraper';

const scraperQueue = new Queue(Scraper.key, redisConfig);

scraperQueue.on('failed', (job, err) => {
  console.log('Job failed', job.name, job.data);
  console.log(err);
});

export default scraperQueue;
