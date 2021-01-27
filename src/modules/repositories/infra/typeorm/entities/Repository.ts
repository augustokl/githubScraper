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

@Entity('repositories')
class Appointment {
  @PrimaryColumn()
  id: number;

  @Column()
  name: string;

  @ManyToOne(() => User)
  @JoinColumn({ name: 'user_id' })
  owner: User;

  @Column()
  user_id: number;

  @Column()
  html_url: string;

  @Column()
  description: string;

  @Column()
  language: string;

  @Column()
  forks: number;

  @Column()
  open_issues: number;

  @Column()
  stargazers: number;

  @Column()
  watchers: number;

  @CreateDateColumn()
  created_at: Date;

  @UpdateDateColumn()
  updated_at: Date;

  @Column('timestamp with time zone')
  pushed_at: Date;
}

export default Appointment;
