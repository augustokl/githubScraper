import Queue from 'bull';
import redisConfig from '@shared/infra/redis';

import Scraper from '@shared/infra/jobs/Scraper';

const scraperQueue = new Queue(Scraper.key, redisConfig);

export default scraperQueue;
