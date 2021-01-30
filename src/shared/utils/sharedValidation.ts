interface IPagination {
  checkLimit: number;
  checkStartingAfter: number;
}

export default function validationPagination(
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
