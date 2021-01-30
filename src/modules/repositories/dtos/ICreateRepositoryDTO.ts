export default interface ICreateRepositoryDTO {
  id: number;
  name: string;
  user_id: number;
  html_url: string;
  description: string;
  language: string;
  forks: number;
  open_issues: number;
  stargazers: number;
  watchers: number;
  created_at: Date;
  updated_at: Date;
  pushed_at: Date;
}
