import axios from 'axios';

export default axios.create({
  baseURL: 'https://api.github.com',
  headers: {
    Accept: 'application/vnd.github.v3+json',
    Authorization: 'token 84e46dcf27739a2f3b14ab6b656d2699a7d4c719',
  },
});
