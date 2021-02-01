<br />
<p align="center">
  <h1 align="center">GitHubScraper</h1>

  <p align="center">
    Scrapes User and Repository from GitHub's API and provides RESTful API which could return these datasets!
    <br />
    <br />
  </p>
</p>

<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
        <li><a href="#how-it-works">How It Works</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li>
      <a href="#rest-api">Rest Api</a>
      <ul>
        <li>
          <a href="#user">User</a>
            <ul>
              <li><a href="#request-get-users">Get Users</a></li>
              <li><a href="#request-get-a-user">Get a User</a></li>
              <li><a href="#request-get-a-user-repositories">Get a User Repositories</a></li>
            </ul>
        </li>
        <li>
          <a href="#repository">Repository</a>
            <ul>
              <li><a href="#request-get-repositories">Get Repositories</a></li>
              <li><a href="#request-get-a-repository">Get a Repository</a></li>
            </ul>
        </li>
      </ul>
    </li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->

## About The Project

It's a small service that's scrape data User and Repository from GitHub API's and save it in a persistent store and provides RESTFUL API's for you can consult the data. Using background jobs to schedule scrapes and get more data.

### Built With

- [Node.js](https://nodejs.org/en/)
- [TypeScript](https://www.typescriptlang.org/)
- [Express](https://expressjs.com/)
- [Docker](https://www.docker.com/)
- [PostgreSQL](https://www.postgresql.org/)
- [Redis](https://redislabs.com/)
- [Bull](https://github.com/OptimalBits/bull)

### How It Works

- Data from GitHub's API is scrape using `Bull` for cron schedule and `Redis` queue then the data is persisted in `PostgreSQL`,
- <b>`GitHubScraper`</b> use the same `GitHub` ids for `Repository` and `User`.
- <b>`GitHubScraper`</b> available data through `Node.js` and `Express`.
- Queries are cached in `Redis` for 5 seconds for better performace.

<!-- GETTING STARTED -->

## Getting Started

Instructions on setting up your project locally.
To get a local copy up and running follow these simple example steps.

### Prerequisites

- Docker and docker-compose you can get at [https://docs.docker.com/get-docker/](https://docs.docker.com/get-docker/)
- Node and npm through package-manager you can get at [https://nodejs.org/en/download/package-manager/](https://nodejs.org/en/download/package-manager/)
- Certify you get installed docker-compose and npm for next steps.

### Setup environment variables

- Check if you have a `.env` else rename `.env.example` to `.env`
- Check the `.env` file and modify the variables with your `docker-compose` configurations for `Redis` and `PostgreSQL`
- For `API_GITHUB_KEY` you should acess [https://github.com/settings/tokens](https://github.com/settings/tokens) and generate `Personal access token` so that you can do more request for GitHub API's
- For `CRON_SCHEDULE` you can use [cron expression generator](https://crontab.cronhub.io/) and generate you own schedule 😁
- `APP_API_URL` is usaged for create some links in API ensure you write correctly.

### Installation

1. Clone the repo

   ```sh
   git clone https://github.com/augustokl/githubScraper.git
   ```

   or

   ```sh
   git clone git@github.com:augustokl/githubScraper.git
   ```

2. Install NPM packages

   ```sh
   npm install
   ```

### Run

1. Tests

   ```sh
   npm run test
   ```

2. Up your docker containers

   ```sh
   docker-compose up -d
   ```

3. Check containers are running.

   ```sh
   docker ps
   ```

4. Restore database.

   ```sh
   cat dump_githubscraper:31-01-2021_15_20_58.sql | docker exec -i githubscraper-db psql -U postgres
   ```

   or using migrations and getting a clean database

   ```sh
   npm run typeorm migration:run
   ```

5. Server

   ```sh
   npm run dev:server
   ```

6. Queue
   ```sh
   npm run dev:queue
   ```

<!-- USAGE EXAMPLES -->

# Rest Api

Examples how to use `API`

## User

How to get data for user.

### Request Get Users

`GET /users`

<b>Parameters</b>
| Name | Type | In | Default | Description |
|-------|-------|-----|--------------|--------------|
| limit | integer | query | 10 | Results per page (max 100)
| starting_after | integer | query | - | A user ID. Only return users with an ID greater than this ID.
| order | string | query | asc | Can be one of `asc` or `desc`.
<br>

```bash
 curl http://localhost:3333/users
```

### Response Get Users

```json
[
  {
    "id": 1,
    "login": "mojombo",
    "url": "https://api.github.com/users/mojombo",
    "name": "Tom Preston-Werner",
    "company": "@chatterbugapp, @redwoodjs, @preston-werner-ventures ",
    "location": "San Francisco",
    "bio": null
  },
  {
    "id": 2,
    "login": "defunkt",
    "url": "https://api.github.com/users/defunkt",
    "name": "Chris Wanstrath",
    "company": null,
    "location": null,
    "bio": "🍔"
  }
]
```

### Request Get a User

`GET /users/:id`

<b>Parameters</b>
| Name | Type | In | Default | Description |
|-------|-------|-----|--------------|--------------|
| id | integer | path | - |A user ID.
<br>

```bash
 curl http://localhost:3333/users/1
```

### Response Get a User

```json
{
  "id": 1,
  "login": "mojombo",
  "url": "https://api.github.com/users/mojombo",
  "avatar_url": "https://avatars.githubusercontent.com/u/1?v=4",
  "gists_url": "https://api.github.com/users/mojombo/gists{/gist_id}",
  "events_url": "https://api.github.com/users/mojombo/events{/privacy}",
  "name": "Tom Preston-Werner",
  "email": "tom@mojombo.com",
  "hireable": null,
  "company": "@chatterbugapp, @redwoodjs, @preston-werner-ventures ",
  "location": "San Francisco",
  "blog": "http://tom.preston-werner.com",
  "bio": null,
  "public_repos": 62,
  "public_gists": 62,
  "followers": 22323,
  "following": 11,
  "created_at": "2007-10-20T05:24:19.000Z",
  "updated_at": "2021-01-12T15:53:34.000Z"
}
```

### Request Get a User Repositories

`GET /users/:id/repositories`

<b>Parameters</b>
| Name | Type | In | Default | Description |
|-------|-------|-----|--------------|--------------|
| id | integer | path | - |A user ID.
| limit | integer | query | 10 |Results per page (max 100)
| starting_after | integer | query | - |A user ID. Only return users with an ID greater than this ID.
| order | string | query | asc | Can be one of `asc` or `desc`.
<br>

```bash
 curl http://localhost:3333/users/1/repositories
```

### Response Get a User Repositories

```json
[
  {
    "id": 26899533,
    "name": "30daysoflaptops.github.io",
    "html_url": "https://github.com/mojombo/30daysoflaptops.github.io",
    "subscription_url": "https://api.github.com/repos/mojombo/30daysoflaptops.github.io/subscription",
    "clone_url": "https://github.com/mojombo/30daysoflaptops.github.io.git",
    "description": null,
    "language": "CSS",
    "size": 1197,
    "forks": 2,
    "open_issues": 0,
    "stargazers_count": 7,
    "watchers": 7,
    "created_at": "2014-11-20T06:42:06.000Z",
    "updated_at": "2021-01-13T19:44:03.000Z",
    "pushed_at": "2014-11-20T06:42:47.000Z"
  }
]
```

## Repository

How to get data for repository.

### Request Get Repositories

`GET /repositories`

<b>Parameters</b>
| Name | Type | In | Default | Description |
|-------|-------|-----|--------------|--------------|
| limit | integer | query | 10 | Results per page (max 100)
| starting_after | integer | query | - | A user ID. Only return users with an ID greater than this ID.
| order | string | query | asc | Can be one of `asc` or `desc`.
<br>

```bash
 curl http://localhost:3333/repositories
```

### Response Get Repositories

```json
[
  {
    "id": 61,
    "name": "glowstick",
    "html_url": "https://github.com/mojombo/glowstick",
    "clone_url": "https://github.com/mojombo/glowstick.git",
    "description": "A realtime, OpenGL graphing library for Ruby",
    "language": "Ruby",
    "owner": {
      "id": 1,
      "login": "mojombo",
      "name": "Tom Preston-Werner",
      "avatar_url": "https://avatars.githubusercontent.com/u/1?v=4",
      "url": "https://api.github.com/users/mojombo",
      "api_url": "http://localhost:3333/users/1"
    }
  },
  {
    "id": 28,
    "name": "god",
    "html_url": "https://github.com/mojombo/god",
    "clone_url": "https://github.com/mojombo/god.git",
    "description": "Ruby process monitor",
    "language": "Ruby",
    "owner": {
      "id": 1,
      "login": "mojombo",
      "name": "Tom Preston-Werner",
      "avatar_url": "https://avatars.githubusercontent.com/u/1?v=4",
      "url": "https://api.github.com/users/mojombo",
      "api_url": "http://localhost:3333/users/1"
    }
  }
]
```

### Request Get a Repository

`GET /repositories/:id`

<b>Parameters</b>
| Name | Type | In | Default | Description |
|-------|-------|-----|--------------|--------------|
| id | integer | path | - |A user ID.
<br>

```bash
 curl http://localhost:3333/repositories/1
```

### Response Get a Repository

```json
{
  "id": 1,
  "name": "grit",
  "html_url": "https://github.com/mojombo/grit",
  "subscription_url": "https://api.github.com/repos/mojombo/grit/subscription",
  "clone_url": "https://github.com/mojombo/grit.git",
  "description": "**Grit is no longer maintained. Check out libgit2/rugged.** Grit gives you object oriented read/write access to Git repositories via Ruby.",
  "language": "Ruby",
  "size": 7954,
  "forks": 531,
  "open_issues": 26,
  "stargazers_count": 1904,
  "watchers": 1904,
  "created_at": "2007-10-29T14:37:16.000Z",
  "updated_at": "2021-01-25T18:00:32.000Z",
  "pushed_at": "2020-10-01T03:55:32.000Z",
  "owner": {
    "id": 1,
    "login": "mojombo",
    "name": "Tom Preston-Werner",
    "avatar_url": "https://avatars.githubusercontent.com/u/1?v=4",
    "url": "https://api.github.com/users/mojombo",
    "api_url": "http://localhost:3333/users/1"
  }
}
```

## Contact

Project Link: [GitHubScraper](https://github.com/augustokl/githubScraper)
