import FakeUsersRepository from '../../repositories/fakes/FakeUsersRepository';
import CreateUserService from '../CreateUserService';

let createUserService: CreateUserService;
let fakeUsersRepository: FakeUsersRepository;

describe('CreateUser', () => {
  beforeEach(() => {
    fakeUsersRepository = new FakeUsersRepository();

    createUserService = new CreateUserService(fakeUsersRepository);
  });
  it('should be able to create a new user', async () => {
    const user = await createUserService.execute({
      id: 1,
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
      public_repos: 1,
      public_gists: 1,
      followers: 1,
      following: 1,
      created_at: new Date(),
      updated_at: new Date(),
    });

    expect(user).toHaveProperty('id');
    expect(user.id).toBe(1);
  });
});
