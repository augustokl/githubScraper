import ISaveUserDTO from '../dtos/ISaveUserDTO';

class UserUtils {
  public extractData(data: any): ISaveUserDTO {
    const {
      id,
      login,
      avatar_url,
      name,
      company,
      location,
      blog,
      bio,
      public_repos,
      public_gists,
      followers,
      following,
      created_at,
      updated_at,
    } = data;

    return {
      id,
      login,
      avatar_url,
      name,
      company,
      location,
      blog,
      bio,
      public_repos,
      public_gists,
      followers,
      following,
      created_at,
      updated_at,
    };
  }
}

export default UserUtils;
