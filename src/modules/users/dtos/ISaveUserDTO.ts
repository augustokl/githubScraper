export default interface ISaveUserDTO {
  id: number;
  login: string;
  avatar_url: string;
  name: string;
  avatar: string;
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
