import {
  Entity,
  Column,
  PrimaryColumn,
  CreateDateColumn,
  UpdateDateColumn,
} from 'typeorm';

@Entity('users')
class User {
  @PrimaryColumn()
  id: number;

  @Column()
  login: string;

  @Column()
  url: string;

  @Column()
  avatar_url: string;

  @Column()
  gists_url: string;

  @Column()
  events_url: string;

  @Column()
  name: string;

  @Column()
  email: string;

  @Column()
  hireable: string;

  @Column()
  company: string;

  @Column()
  location: string;

  @Column()
  blog: string;

  @Column()
  bio: string;

  @Column()
  public_repos: number;

  @Column()
  public_gists: number;

  @Column()
  followers: number;

  @Column()
  following: number;

  @CreateDateColumn()
  created_at: Date;

  @UpdateDateColumn()
  updated_at: Date;
}

export default User;
