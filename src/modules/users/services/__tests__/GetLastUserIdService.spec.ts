import FakeUsersRepository from '../../repositories/fakes/FakeUsersRepository';
import CreateUserService from '../CreateUserService';
import GetLastUserIdService from '../GetLastUserIdService';

let fakeUsersRepository: FakeUsersRepository;
let createUserService: CreateUserService;
let getLastUserIdService: GetLastUserIdService;

describe('GetLastUser', () => {
  beforeEach(() => {
    fakeUsersRepository = new FakeUsersRepository();

    createUserService = new CreateUserService(fakeUsersRepository);
    getLastUserIdService = new GetLastUserIdService(fakeUsersRepository);
  });
  it('should be able to find last user id', async () => {
    for (let i = 1; i <= 15; i++) {
      await createUserService.execute({
        id: i,
        login: 'johndoe',
        url: 'github.com/johndoe',
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

    const id = await getLastUserIdService.execute();

    expect(id).toBe(15);
  });

  it('should not be able to find if not have any user', async () => {
    const id = await getLastUserIdService.execute();

    expect(id).toBe(undefined);
  });
});
