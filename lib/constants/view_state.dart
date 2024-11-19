enum ViewState { loading, success, error }

extension ViewStateExtension on ViewState {
  bool get isLoading => this == ViewState.loading;
  bool get isSuccess => this == ViewState.success;
  bool get isError => this == ViewState.error;
}
