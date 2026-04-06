enum CommonScreenState {
  initial,
  loading,
  loaded,
  success,
  error;

  bool get isSuccess => this == success;
  bool get isLoading => this == loading;
}
