class AppState {
    final int count;

    AppState({required this.count});

    factory AppState.initial() {
    return AppState(
      count: 0
    );
  }
}