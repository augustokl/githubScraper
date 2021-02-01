import api from '@config/lib/api';

import RepositoriesController from '@modules/repositories/infra/http/controllers/RepositoriesController';
import RepositoryUtils from '@modules/repositories/utils/RepositoryUtils';
import UsersController from '@modules/users/infra/http/controllers/UsersController';
import UserUtils from '@modules/users/utils/UserUtils';
import { DoneCallback, Job } from 'bull';

interface IScraper {
  key: string;
  handle(job: Job, done: DoneCallback): Promise<void>;
}

export default {
  key: 'Scraper',
  async handle(job: Job, done: DoneCallback): Promise<void> {
    try {
      const userUtils = new UserUtils();
      const repositoryUtils = new RepositoryUtils();

      const userController = new UsersController();
      const repositoriesController = new RepositoriesController();

      const id = await userController.lastId();

      let apiRequest = '/users?per_page=20';

      if (id) {
        apiRequest += `&since=${id}`;
      }

      const { data } = await api.get(apiRequest);
      const listUserLength = data.length;

      let rowCount = 0;

      for (const row of data) {
        const progress = (100 * rowCount) / listUserLength;
        job.progress(progress);

        const { data: userRaw } = await api.get(`/users/${row.login}`);
        const { data: userReposRaw } = await api.get(
          `/users/${row.login}/repos`,
        );

        const user = userUtils.extractData(userRaw);
        await userController.create(user);

        for (const repositoryRaw of userReposRaw) {
          const repository = repositoryUtils.extractData(repositoryRaw);
          await repositoriesController.create(repository);
        }
        rowCount++;
      }
      job.progress(100);
      done();
    } catch (error) {
      done(error.message);
    }
  },
} as IScraper;
