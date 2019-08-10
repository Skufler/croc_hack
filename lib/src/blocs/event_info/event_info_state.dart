class EventInfoState {
  bool isLoading;
  bool isSuccess;
  bool isFailed;

  EventInfoState(
      {this.isLoading = false, this.isSuccess = false, this.isFailed = false});

  factory EventInfoState.initial() {
    return EventInfoState();
  }

  factory EventInfoState.loading() {
    return EventInfoState(isLoading: true);
  }

  factory EventInfoState.failed() {
    return EventInfoState(isFailed: true, isLoading: false);
  }

  factory EventInfoState.success() {
    return EventInfoState(isSuccess: true, isLoading: false);
  }
}
