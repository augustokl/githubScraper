export default interface ICreateUserDTO {
  id: number;
  login: string;
  url: string;
  avatar_url: string;
  gists_url: string;
  events_url: string;
  name: string;
  email: string;
  hireable: string;
  company: string;
  location: string;
  blog: string;
  bio: string;
  public_repos: number;
  public_gists: number;
  followers: number;
  following: number;
  created_at: Date;
  updated_at: Date;
}
