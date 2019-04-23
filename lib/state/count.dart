class IncrementCountAction {}

int countReducer(int count, action) {
  if (action is IncrementCountAction) {
    return count + 1;
  }
  return count;
}
