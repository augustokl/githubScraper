import FakeRepositoriesRepository from '../../repositories/fakes/FakeRepositoriesRepository';
import CreateRepositoryService from '../CreateRepositoryService';
import FindAllRepositoriesService from '../FindAllRepositoriesService';

let createRepositoryService: CreateRepositoryService;
let findAllRepositoriesService: FindAllRepositoriesService;
let fakeRepositoriesRepository: FakeRepositoriesRepository;

describe('FindAllRepositories', () => {
  beforeEach(async () => {
    fakeRepositoriesRepository = new FakeRepositoriesRepository();

    createRepositoryService = new CreateRepositoryService(
      fakeRepositoriesRepository,
    );
    findAllRepositoriesService = new FindAllRepositoriesService(
      fakeRepositoriesRepository,
    );

    for (let i = 0; i < 150; i++) {
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
  it('should be able to find repositories default parameters', async () => {
    const repositories = await findAllRepositoriesService.execute({
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
    const repositories = await findAllRepositoriesService.execute({
      limit: 0,
      starting_after: 0,
      order: 'DESC',
    });

    expect(repositories).toHaveLength(10);
    expect(repositories).toEqual(
      expect.arrayContaining([expect.objectContaining({ id: 149 })]),
    );
  });

  it('should not be able to find more than 100 repositories', async () => {
    const repositories = await findAllRepositoriesService.execute({
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
    const repositories = await findAllRepositoriesService.execute({
      limit: -10,
      starting_after: 0,
      order: 'ASC',
    });

    expect(repositories).toHaveLength(10);
    expect(repositories).toEqual(
      expect.arrayContaining([expect.objectContaining({ id: 1 })]),
    );
  });

  it('should be able to find only after starting_after', async () => {
    for (let i = 0; i < 7; i++) {
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

    const repositories = await findAllRepositoriesService.execute({
      limit: 5,
      starting_after: 1,
      order: 'ASC',
    });

    expect(repositories).toHaveLength(5);
    expect(repositories).toEqual(
      expect.arrayContaining([expect.not.objectContaining({ id: 1 })]),
    );
  });

  it('should not be able to accept starting_after negative', async () => {
    const repositories = await findAllRepositoriesService.execute({
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
