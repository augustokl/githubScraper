import FakeRepositoriesRepository from '@modules/repositories/repositories/fakes/FakeRepositoriesRepository';
import CreateRepositoryService from '@modules/repositories/services/CreateRepositoryService';

import FakeUsersRepository from '../../repositories/fakes/FakeUsersRepository';
import CreateUserService from '../CreateUserService';
import FindUserRepositoriesService from '../FindUserRepositoriesService';

let fakeRepositoriesRepository: FakeRepositoriesRepository;
let fakeUsersRepository: FakeUsersRepository;

let createUserService: CreateUserService;
let findUserRepositoriesService: FindUserRepositoriesService;
let createRepositoryService: CreateRepositoryService;

describe('FindUserRepositories', () => {
  beforeEach(async () => {
    fakeUsersRepository = new FakeUsersRepository();
    fakeRepositoriesRepository = new FakeRepositoriesRepository();

    findUserRepositoriesService = new FindUserRepositoriesService(
      fakeRepositoriesRepository,
    );
    createUserService = new CreateUserService(fakeUsersRepository);

    createRepositoryService = new CreateRepositoryService(
      fakeRepositoriesRepository,
    );

    for (let i = 1; i <= 3; i++) {
      await createUserService.execute({
        id: i,
        login: 'johndoe',
        url: 'github.com/johndoe',
        events_url: 'github.com/johndoe',
        gists_url: 'github.com/johndoe',
        avatar_url: 'gravatar',
        name: 'John Doe',
        email: 'johndoe@teste.com',
        hireable: 'null',
        company: 'Tesorio',
        location: 'Brazil',
        blog: 'null',
        bio: 'Crazy guy',
        public_repos: i,
        public_gists: i,
        followers: i,
        following: i,
        created_at: new Date(),
        updated_at: new Date(),
      });
    }

    for (let i = 1; i <= 150; i++) {
      await createRepositoryService.execute({
        id: i,
        name: 'test',
        user_id: 1,
        html_url: 'github.com/JohnDoe/test',
        subscription_url: 'github.com/JohnDoe/test',
        clone_url: 'github.com/JohnDoe/test',
        description: 'Test repository',
        visibility: 'true',
        size: 1,
        language: 'Typescript',
        forks: i,
        open_issues: i,
        stargazers: i,
        watchers: i,
        network_count: i,
        subscribers_count: i,
        created_at: new Date(),
        updated_at: new Date(),
        pushed_at: new Date(),
      });
    }
  });
  it('should be able to find only after starting_after', async () => {
    const repositories = await findUserRepositoriesService.execute({
      id: 1,
      limit: 5,
      starting_after: 1,
      order: 'ASC',
    });

    expect(repositories).toHaveLength(5);
    expect(repositories).toEqual(
      expect.arrayContaining([expect.not.objectContaining({ id: 1 })]),
    );
  });

  it('should be able to find repositories default parameters', async () => {
    const repositories = await findUserRepositoriesService.execute({
      id: 1,
      limit: 0,
      starting_after: 0,
      order: 'ASC',
    });

    expect(repositories).toHaveLength(10);
    expect(repositories).toEqual(
      expect.arrayContaining([expect.objectContaining({ id: 1 })]),
    );
  });

  it('should be able to find repositories in DESC order', async () => {
    const repositories = await findUserRepositoriesService.execute({
      id: 1,
      limit: 0,
      starting_after: 0,
      order: 'DESC',
    });

    expect(repositories).toHaveLength(10);
    expect(repositories).toEqual(
      expect.arrayContaining([expect.objectContaining({ id: 149 })]),
    );
  });

  it('should not be able to find user with wrong id', async () => {
    await expect(
      findUserRepositoriesService.execute({
        id: 10,
        limit: 10,
        starting_after: 0,
        order: 'ASC',
      }),
    ).toMatchObject({});
  });

  it('should not be able to find more than 100 repositories', async () => {
    const repositories = await findUserRepositoriesService.execute({
      id: 1,
      limit: 150,
      starting_after: 0,
      order: 'ASC',
    });

    expect(repositories).toHaveLength(100);
    expect(repositories).toEqual(
      expect.arrayContaining([expect.objectContaining({ id: 1 })]),
    );
  });

  it('should not be able to find less than 1 repository', async () => {
    const repositories = await findUserRepositoriesService.execute({
      id: 1,
      limit: -10,
      starting_after: 0,
      order: 'ASC',
    });

    expect(repositories).toHaveLength(10);
    expect(repositories).toEqual(
      expect.arrayContaining([expect.objectContaining({ id: 1 })]),
    );
  });

  it('should not be able to accept starting_after negative', async () => {
    const repositories = await findUserRepositoriesService.execute({
      id: 1,
      limit: 5,
      starting_after: -1,
      order: 'ASC',
    });

    expect(repositories).toHaveLength(5);
    expect(repositories).toEqual(
      expect.arrayContaining([expect.objectContaining({ id: 1 })]),
    );
  });
});
