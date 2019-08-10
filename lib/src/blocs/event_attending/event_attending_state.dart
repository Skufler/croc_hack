class EventAttendingState {
  bool isLoading;
  bool isSuccess;
  bool isFailed;

  EventAttendingState(
      {this.isLoading = false, this.isSuccess = false, this.isFailed = false});

  factory EventAttendingState.initial() {
    return EventAttendingState();
  }

  factory EventAttendingState.loading() {
    return EventAttendingState(isLoading: true);
  }

  factory EventAttendingState.failed() {
    return EventAttendingState(isFailed: true, isLoading: false);
  }

  factory EventAttendingState.success() {
    return EventAttendingState(isSuccess: true, isLoading: false);
  }
}
