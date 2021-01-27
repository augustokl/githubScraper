import { MigrationInterface, QueryRunner, Table } from 'typeorm';

export default class CreateUsers1611716188975 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.createTable(
      new Table({
        name: 'users',
        columns: [
          {
            name: 'id',
            type: 'int',
            isPrimary: true,
          },
          {
            name: 'login',
            type: 'varchar',
          },
          {
            name: 'avatar_url',
            type: 'varchar',
          },
          {
            name: 'name',
            type: 'varchar',
          },
          {
            name: 'company',
            type: 'varchar',
          },
          {
            name: 'location',
            type: 'varchar',
          },
          {
            name: 'blog',
            type: 'varchar',
          },
          {
            name: 'bio',
            type: 'varchar',
          },
          {
            name: 'public_repos',
            type: 'int',
          },
          {
            name: 'public_gists',
            type: 'int',
          },
          {
            name: 'followers',
            type: 'int',
          },
          {
            name: 'following',
            type: 'int',
          },
          {
            name: 'created_at',
            type: 'timestamp',
          },
          {
            name: 'updated_at',
            type: 'timestamp',
          },
        ],
      }),
    );
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.dropTable('users');
  }
}
