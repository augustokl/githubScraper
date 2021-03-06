import {
  Entity,
  Column,
  PrimaryColumn,
  CreateDateColumn,
  UpdateDateColumn,
  ManyToOne,
  JoinColumn,
} from 'typeorm';

import User from '@modules/users/infra/typeorm/entities/User';

import { Exclude, Type, Transform } from 'class-transformer';

@Entity('repositories')
class Repository {
  @PrimaryColumn()
  id: number;

  @Column()
  name: string;

  @Column()
  @Exclude()
  user_id: number;

  @ManyToOne(() => User)
  @JoinColumn({ name: 'user_id' })
  @Type(() => User)
  @Transform(
    ({ value }) => ({
      id: value.id,
      login: value.login,
      name: value.name,
      avatar_url: value.avatar_url,
      url: value.url,
      api_url: `${process.env.APP_API_URL}:${process.env.APP_API_PORT}/users/${value.id}`,
    }),
    { toClassOnly: true },
  )
  owner: User;

  @Column()
  html_url: string;

  @Column()
  subscription_url: string;

  @Column()
  clone_url: string;

  @Column()
  description: string;

  @Column()
  language: string;

  @Column()
  size: number;

  @Column()
  forks: number;

  @Column()
  open_issues: number;

  @Column()
  stargazers_count: number;

  @Column()
  watchers: number;

  @CreateDateColumn()
  created_at: Date;

  @UpdateDateColumn()
  updated_at: Date;

  @Column('timestamp with time zone')
  pushed_at: Date;
}

export default Repository;
