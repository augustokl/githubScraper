import axios from 'axios';

const parameters = {
  baseURL: 'https://api.github.com',
  headers: {
    Accept: 'application/vnd.github.v3+json',
  },
};

const token = process.env.API_GITHUB_KEY;

if (token) {
  parameters.headers = Object.assign(parameters.headers, {
    Authorization: `token ${token}`,
  });
}

const api = axios.create(parameters);

export default api;
