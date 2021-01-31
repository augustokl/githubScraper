import FakeRepositoriesRepository from '../../repositories/fakes/FakeRepositoriesRepository';
import CreateRepositoryService from '../CreateRepositoryService';

let createRepositoryService: CreateRepositoryService;
let fakeRepositoriesRepository: FakeRepositoriesRepository;

describe('CreateRepository', () => {
  beforeEach(() => {
    fakeRepositoriesRepository = new FakeRepositoriesRepository();

    createRepositoryService = new CreateRepositoryService(
      fakeRepositoriesRepository,
    );
  });
  it('should be able to create a new repository', async () => {
    const repository = await createRepositoryService.execute({
      id: 1,
      name: 'test',
      user_id: 1,
      html_url: 'github.com/JohnDoe/test',
      subscription_url: 'github.com/JohnDoe/test',
      clone_url: 'github.com/JohnDoe/test',
      description: 'Test repository',
      visibility: 'true',
      size: 1,
      language: 'Typescript',
      forks: 1,
      open_issues: 1,
      stargazers: 1,
      watchers: 1,
      network_count: 1,
      subscribers_count: 1,
      created_at: new Date(),
      updated_at: new Date(),
      pushed_at: new Date(),
    });

    expect(repository).toHaveProperty('id');
    expect(repository.id).toBe(1);
  });
});
