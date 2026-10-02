/// Generic async lifecycle marker used across cubit states.
enum LoadingStatus {
  initial,
  loading,
  loaded,
  error
  ;

  bool get isInitial => this == LoadingStatus.initial;
  bool get isLoading => this == LoadingStatus.loading;
  bool get isLoaded => this == LoadingStatus.loaded;
  bool get isError => this == LoadingStatus.error;
}
