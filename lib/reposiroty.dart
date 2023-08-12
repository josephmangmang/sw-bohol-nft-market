class Repository {
  static final Repository _instance = Repository._internal();

  Repository._internal();

  factory Repository() {
    return _instance;
  }

  bool isLogin = false;
}
