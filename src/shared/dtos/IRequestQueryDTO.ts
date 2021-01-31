export default interface IRequestQueryDTO {
  starting_after: number;
  limit: number;
  order: 'DESC' | 'ASC';
}
