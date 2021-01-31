import ISaveRepositoryDTO from '../dtos/ISaveRepositoryDTO';

class RepositoryUtils {
  public extractData(data: any): ISaveRepositoryDTO {
    const {
      id,
      name,
      owner,
      html_url,
      subscription_url,
      clone_url,
      description,
      language,
      size,
      forks,
      open_issues,
      stargazers,
      watchers,
      created_at,
      updated_at,
      pushed_at,
    } = data;

    const user_id = owner.id;

    return {
      id,
      name,
      user_id,
      html_url,
      subscription_url,
      clone_url,
      description,
      language,
      size,
      forks,
      open_issues,
      stargazers,
      watchers,
      created_at,
      updated_at,
      pushed_at,
    };
  }
}

export default RepositoryUtils;
