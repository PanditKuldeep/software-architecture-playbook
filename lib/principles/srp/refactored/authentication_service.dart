class AuthenticationService {
  bool authenticate(String email, String password) {
    return email == 'admin@google.com' && password == 'admin@123';
  }
}