import FakeRepositoriesRepository from '../../repositories/fakes/FakeRepositoriesRepository';
import CreateRepositoryService from '../CreateRepositoryService';
import FindRepositoryService from '../FindRepositoryService';

let createRepositoryService: CreateRepositoryService;
let findRepositoryService: FindRepositoryService;
let fakeRepositoriesRepository: FakeRepositoriesRepository;

describe('FindRepository', () => {
  beforeEach(async () => {
    fakeRepositoriesRepository = new FakeRepositoriesRepository();

    createRepositoryService = new CreateRepositoryService(
      fakeRepositoriesRepository,
    );
    findRepositoryService = new FindRepositoryService(
      fakeRepositoriesRepository,
    );
    for (let i = 0; i < 3; i++) {
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
  it('should be able to find one repository', async () => {
    const repository = await findRepositoryService.execute(1);

    expect(repository).toHaveProperty('id');
    await expect(repository?.id).toBe(1);
  });

  it('should not be able to find repository with wrong id', async () => {
    const repository = await findRepositoryService.execute(10);

    expect(repository).toMatchObject({});
  });
});
