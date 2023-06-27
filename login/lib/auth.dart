import 'package:appwrite/appwrite.dart';

class Auth {
  static final Auth _instance = Auth._internal();

  late Client _client;
  late Account _account;

  factory Auth() {
    return _instance;
  }

  Auth._internal() {
    _client = Client()
        .setEndpoint('https://your-appwrite-server.com/v1')
        .setProject('your-project-id');

    _account = Account(_client);
  }

  static Auth getInstance() {
    return _instance;
  }

  Future<void> login(String email, String password) async {
    try {
      await _account.createSession(email: email, password: password);
      print('Login successful!');
    } catch (e) {
      print('Login failed: $e');
    }
  }

  Future<void> logout({String? sessionId}) async {
    if (sessionId == null) {
      print('No sessionId provided for logout');
      return;
    }

    try {  
      String sessionId = 'your-session-id';
      Auth.getInstance().logout(sessionId :sessionId  );
      print('Logout successful!');
    } catch (e) {
      print('Logout failed: $e');
    }
  }
}
