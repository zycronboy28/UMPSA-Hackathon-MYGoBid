// app_state.dart
class AppState {
  // Private constructor
  AppState._();

  // Singleton instance
  static final AppState _instance = AppState._();

  // Factory constructor
  factory AppState() {
    return _instance;
  }

  // Selected index variable
  int selectedIndex = 0;
}