import AppError from '@shared/errors/AppError';
import FakeUsersRepository from '../../repositories/fakes/FakeUsersRepository';
import CreateUserService from '../CreateUserService';
import FindUserByIdService from '../FindUserByIdService';

let createUserService: CreateUserService;
let findUserByIdService: FindUserByIdService;
let fakeUsersRepository: FakeUsersRepository;

describe('FindUser', () => {
  beforeEach(async () => {
    fakeUsersRepository = new FakeUsersRepository();

    createUserService = new CreateUserService(fakeUsersRepository);
    findUserByIdService = new FindUserByIdService(fakeUsersRepository);

    for (let i = 0; i < 3; i++) {
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
  });
  it('should be able to find one user', async () => {
    const user = await findUserByIdService.execute(1);

    expect(user).toHaveProperty('id');
    await expect(user?.id).toBe(1);
  });

  it('should not be able to find user with wrong id', async () => {
    const user = await findUserByIdService.execute(10);

    expect(user).toMatchObject({});
  });
  it('should not be able to find a user with a malformed id', async () => {
    await expect(findUserByIdService.execute(1.1)).rejects.toBeInstanceOf(
      AppError,
    );
  });

  it('should not be able to find a user with a id greater than 2147483647.', async () => {
    await expect(
      findUserByIdService.execute(2147483648),
    ).rejects.toBeInstanceOf(AppError);
  });
});
