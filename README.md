<br />
<p align="center">
  <h1 align="center">GitHubScraper</h1>

  <p align="center">
    Scrapes User and Repository from GitHub's API and provides RESTful API which could return these datasets!
    <br />
    <br />
    <a href="https://github.com/othneildrew/Best-README-Template">View Demo</a>
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
            <li><a href="#request-get-users">Request Get Users</a></li>
            <li><a href="#response-get-users">Response Get Users</a></li>
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
- Queries are cached in `Redis` for 10 seconds for better performace.

<!-- GETTING STARTED -->

## Getting Started

Instructions on setting up your project locally.
To get a local copy up and running follow these simple example steps.

### Prerequisites

- Docker and docker-compose you can get at [https://docs.docker.com/get-docker/](https://docs.docker.com/get-docker/)
- Node and npm through package-manager you can get at [https://nodejs.org/en/download/package-manager/](https://nodejs.org/en/download/package-manager/)
- Certify you get installed docker-compose and npm for next steps.

### Setup environment variables

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
   cat dump_githubscraper:30-01-2021_20_55_29.sql | docker exec -i apiscraper_db_1 psql -U postgres
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

Examples how to use `Api`

## User

How to get data for user.

### Request Get Users

`GET /users`

<b>Parameters</b>
| Name | Type | In | Description |
|-------|-------|-----|--------------|
| limit | integer | query | Results per page (max 100)
| starting_after | integer | query | A user ID. Only return users with an ID greater than this ID. ||
<br>

```curl
 curl http://localhost:3333/users
```

### Response Get Users

```curl
{
    "id": 1,
    "login": "mojombo",
    "url": "https://api.github.com/users/mojombo",
    "avatar_url": "https://avatars.githubusercontent.com/u/1?v=4",
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

<!-- CONTACT -->

## Contact

Project Link: [GitHubScraper](https://github.com/augustokl/githubScraper)
