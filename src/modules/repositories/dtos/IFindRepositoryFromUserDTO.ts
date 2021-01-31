export default interface IFindRepositoryFromUserDTO {
  id: number;
  starting_after: number;
  limit: number;
  order: string;
}
