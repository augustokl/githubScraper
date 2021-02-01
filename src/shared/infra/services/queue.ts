import 'dotenv/config';
import 'reflect-metadata';

import '@shared/infra/typeorm';
import '@shared/container';

import Queue from '@config/lib/queue';
import Scraper from '../jobs/Scraper';

const schedule = process.env.CRON_SCHEDULE || '*/5 * * * *';

Queue.process(Scraper.handle);

Queue.add({}, { repeat: { cron: schedule } });
