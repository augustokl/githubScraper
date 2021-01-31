import FakeUsersRepository from '../../repositories/fakes/FakeUsersRepository';
import CreateUserService from '../CreateUserService';
import FindAllUsersService from '../FindAllUsersService';

let createUserService: CreateUserService;
let findAllUsersService: FindAllUsersService;
let fakeUsersRepository: FakeUsersRepository;

describe('FindAllUsers', () => {
  beforeEach(async () => {
    fakeUsersRepository = new FakeUsersRepository();

    createUserService = new CreateUserService(fakeUsersRepository);
    findAllUsersService = new FindAllUsersService(fakeUsersRepository);

    for (let i = 0; i < 150; i++) {
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
  });
  it('should be able to find users default parameters', async () => {
    const users = await findAllUsersService.execute({
      limit: 0,
      starting_after: 0,
      order: 'ASC',
    });

    expect(users).toHaveLength(10);
    expect(users).toEqual(
      expect.arrayContaining([expect.objectContaining({ id: 1 })]),
    );
  });

  it('should be able to find users in DESC order', async () => {
    const repositories = await findAllUsersService.execute({
      limit: 0,
      starting_after: 0,
      order: 'DESC',
    });

    expect(repositories).toHaveLength(10);
    expect(repositories).toEqual(
      expect.arrayContaining([expect.objectContaining({ id: 149 })]),
    );
  });

  it('should not be able to find more than 100 users', async () => {
    const users = await findAllUsersService.execute({
      limit: 150,
      starting_after: 0,
      order: 'ASC',
    });

    expect(users).toHaveLength(100);
    expect(users).toEqual(
      expect.arrayContaining([expect.objectContaining({ id: 1 })]),
    );
  });

  it('should not be able to find less than 1 user', async () => {
    const users = await findAllUsersService.execute({
      limit: -10,
      starting_after: 0,
      order: 'ASC',
    });

    expect(users).toHaveLength(10);
    expect(users).toEqual(
      expect.arrayContaining([expect.objectContaining({ id: 1 })]),
    );
  });

  it('should be able to find a user only after starting_after', async () => {
    const users = await findAllUsersService.execute({
      limit: 5,
      starting_after: 1,
      order: 'ASC',
    });

    expect(users).toHaveLength(5);
    expect(users).toEqual(
      expect.arrayContaining([expect.not.objectContaining({ id: 1 })]),
    );
  });

  it('should not be able to accept starting_after negative', async () => {
    const users = await findAllUsersService.execute({
      limit: 5,
      starting_after: -1,
      order: 'ASC',
    });

    expect(users).toHaveLength(5);
    expect(users).toEqual(
      expect.arrayContaining([expect.objectContaining({ id: 1 })]),
    );
  });
});
