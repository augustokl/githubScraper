import api from '@config/lib/api';

import RepositoriesController from '@modules/repositories/http/controllers/RepositoriesController';
import RepositoryUtils from '@modules/repositories/utils/RepositoryUtils';
import UsersController from '@modules/users/http/controllers/UsersController';
import UserUtils from '@modules/users/utils/UserUtils';

interface IScraper {
  key: string;
  handle(): Promise<void>;
}

export default {
  key: 'Scraper',
  async handle(): Promise<void> {
    const userUtils = new UserUtils();
    const repositoryUtils = new RepositoryUtils();

    const userController = new UsersController();
    const repositoriesController = new RepositoriesController();

    const id = await userController.lastId();

    let apiRequest = '/users?limit=20';

    if (id) {
      apiRequest += `&since=${id}`;
    }

    const { data } = await api.get(apiRequest);

    for (const row of data) {
      const { data: userRaw } = await api.get(`/users/${row.login}`);
      const { data: userReposRaw } = await api.get(`/users/${row.login}/repos`);

      const user = userUtils.extractData(userRaw);
      await userController.create(user);

      for (const repositoryRaw of userReposRaw) {
        const repository = repositoryUtils.extractData(repositoryRaw);
        await repositoriesController.create(repository);
      }
    }
  },
} as IScraper;
