import axios from 'axios';

interface IScraper {
  key: string;
}

export default {
  key: 'Scraper',
  async handle({ data }: any): Promise<void> {
    const { page } = data;
    await axios.get('https://api.github.com/users');
  },
} as IScraper;
