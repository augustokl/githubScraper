import { container } from 'tsyringe';

import IRepositoriesRepository from '@modules/repositories/repositories/IRepositoriesRepository';
import RepositoryRepositories from '@modules/repositories/infra/typeorm/repositories/RepositoriesRepository';

import IUsersRepository from '@modules/users/repositories/IUsersRepository';
import UsersRepository from '@modules/users/infra/typeorm/repositories/UsersRepository';

container.registerSingleton<IRepositoriesRepository>(
  'RepositoriesRepository',
  RepositoryRepositories,
);

container.registerSingleton<IUsersRepository>(
  'UsersRepository',
  UsersRepository,
);
