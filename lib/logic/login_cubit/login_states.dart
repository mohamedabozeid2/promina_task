abstract class LoginStates{}

class LoginInitialState extends LoginStates{}

class LoginSuccessState extends LoginStates{}
class LoginLoadingState extends LoginStates{}
class LoginErrorState extends LoginStates{
  final String error;
  LoginErrorState({required this.error});
}