import AppError from '@shared/errors/AppError';
import FakeRepositoriesRepository from '../../repositories/fakes/FakeRepositoriesRepository';
import CreateRepositoryService from '../CreateRepositoryService';
import FindRepositoryService from '../FindRepositoryService';

let createRepositoryService: CreateRepositoryService;
let findRepositoryService: FindRepositoryService;
let fakeRepositoriesRepository: FakeRepositoriesRepository;

describe('FindRepository', () => {
  beforeEach(() => {
    fakeRepositoriesRepository = new FakeRepositoriesRepository();

    createRepositoryService = new CreateRepositoryService(
      fakeRepositoriesRepository,
    );
    findRepositoryService = new FindRepositoryService(
      fakeRepositoriesRepository,
    );
  });
  it('should be able to find one repository', async () => {
    for (let i = 0; i < 3; i++) {
      await createRepositoryService.execute({
        id: i,
        name: 'test',
        user_id: i,
        html_url: 'github.com/JohnDoe/test',
        description: 'Test repository',
        language: 'Typescript',
        forks: i,
        open_issues: i,
        stargazers: i,
        watchers: i,
        created_at: new Date(),
        updated_at: new Date(),
        pushed_at: new Date(),
      });
    }

    const repository = await findRepositoryService.execute(1);

    expect(repository).toHaveProperty('id');
    await expect(repository?.id).toBe(1);
  });

  it('should not be able to find repository with wrong id', async () => {
    for (let i = 0; i < 3; i++) {
      await createRepositoryService.execute({
        id: i,
        name: 'test',
        user_id: i,
        html_url: 'github.com/JohnDoe/test',
        description: 'Test repository',
        language: 'Typescript',
        forks: i,
        open_issues: i,
        stargazers: i,
        watchers: i,
        created_at: new Date(),
        updated_at: new Date(),
        pushed_at: new Date(),
      });
    }

    const repository = await findRepositoryService.execute(10);

    expect(repository).toMatchObject({});
  });
  it('should not be able to find a repository with a malformed id', async () => {
    for (let i = 0; i < 3; i++) {
      await createRepositoryService.execute({
        id: i,
        name: 'test',
        user_id: i,
        html_url: 'github.com/JohnDoe/test',
        description: 'Test repository',
        language: 'Typescript',
        forks: i,
        open_issues: i,
        stargazers: i,
        watchers: i,
        created_at: new Date(),
        updated_at: new Date(),
        pushed_at: new Date(),
      });
    }

    await expect(findRepositoryService.execute(1.1)).rejects.toBeInstanceOf(
      AppError,
    );
  });

  it('should not be able to find a repository with a id greater than 2147483647.', async () => {
    for (let i = 0; i < 3; i++) {
      await createRepositoryService.execute({
        id: i,
        name: 'test',
        user_id: i,
        html_url: 'github.com/JohnDoe/test',
        description: 'Test repository',
        language: 'Typescript',
        forks: i,
        open_issues: i,
        stargazers: i,
        watchers: i,
        created_at: new Date(),
        updated_at: new Date(),
        pushed_at: new Date(),
      });
    }

    await expect(
      findRepositoryService.execute(2147483648),
    ).rejects.toBeInstanceOf(AppError);
  });
});
