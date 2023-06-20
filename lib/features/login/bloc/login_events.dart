abstract class LoginEvent {
  const LoginEvent();
}

class EmailEvent extends LoginEvent {
  final String email;

  EmailEvent({required this.email});
}

class PasswordEvent extends LoginEvent {
  final String password;

  PasswordEvent({required this.password});
}

