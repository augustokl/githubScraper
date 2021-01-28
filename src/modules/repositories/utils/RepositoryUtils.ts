import ISaveRepositoryDTO from '../dtos/ISaveRepositoryDTO';

class RepositoryUtils {
  public extractData(data: any): ISaveRepositoryDTO {
    const {
      id,
      name,
      owner,
      html_url,
      description,
      language,
      forks,
      open_issues,
      stargazers,
      watchers,
      created_at,
      updated_at,
      pushed_at,
    } = data;

    console.log(
      'DATA',
      id,
      name,
      owner,
      html_url,
      description,
      language,
      forks,
      open_issues,
      stargazers,
      watchers,
      created_at,
      updated_at,
      pushed_at,
    );

    const user_id = owner.id;

    return {
      id,
      name,
      user_id,
      html_url,
      description,
      language,
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
