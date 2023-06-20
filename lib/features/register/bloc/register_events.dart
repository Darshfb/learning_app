abstract class RegisterEvent {}

class UserNameEvent extends RegisterEvent {
  final String userName;

  UserNameEvent({required this.userName});
}

class EmailEvent extends RegisterEvent {
  final String email;

  EmailEvent({required this.email});
}

class PasswordEvent extends RegisterEvent {
  final String password;

  PasswordEvent({required this.password});
}

class ConfirmPasswordEvent extends RegisterEvent {
  final String confirmPassword;

  ConfirmPasswordEvent({required this.confirmPassword});
}
