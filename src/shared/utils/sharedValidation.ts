import AppError from '@shared/errors/AppError';

interface IPagination {
  checkLimit: number;
  checkStartingAfter: number;
}

export function validationPagination(
  limit: number,
  startingAfter: number,
): IPagination {
  let checkLimit = limit || 10;
  let checkStartingAfter = startingAfter || 0;

  if (checkLimit > 100) {
    checkLimit = 100;
  }

  if (checkLimit < 1) {
    checkLimit = 10;
  }

  if (checkStartingAfter < 0) {
    checkStartingAfter = 0;
  }

  return { checkLimit, checkStartingAfter };
}

export function checkId(id: number): boolean {
  if (!Number.isInteger(id)) {
    throw new AppError('Id given is not an integer.', 400);
  }

  if (id > 2147483647) {
    throw new AppError('Id is bigger than 2,147,483,647.', 400);
  }

  return true;
}
