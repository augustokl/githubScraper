export default interface ICreateRepositoryDTO {
  id: number;
  name: string;
  user_id: number;
  html_url: string;
  subscription_url: string;
  clone_url: string;
  description: string;
  language: string;
  visibility: string;
  size: number;
  forks: number;
  open_issues: number;
  stargazers: number;
  watchers: number;
  subscribers_count: number;
  network_count: number;
  created_at: Date;
  updated_at: Date;
  pushed_at: Date;
}
