import ISaveUserDTO from '../dtos/ISaveUserDTO';

class UserUtils {
  public extractData(data: any): ISaveUserDTO {
    const {
      id,
      login,
      url,
      avatar_url,
      name,
      email,
      hireable,
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
      url,
      avatar_url,
      name,
      email,
      hireable,
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
