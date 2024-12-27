import 'package:bloc/bloc.dart';
import 'package:flutter_laravel_api/models/login_model.dart';
import 'package:flutter_laravel_api/models/register_model.dart';
import 'package:flutter_laravel_api/repositories/authentication_repository.dart';
import 'package:meta/meta.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(this._authRepo) : super(const AuthenticationState()){
    on<Namechanged> (_nameChange);
    on<Emailchanged> (_emailChange);
    on<Passwordchanged> (_pwdChange);
    on<PasswordConfirmchanged> (_pwdConfChange);
    on<FormSubmit> (_formSubmit);
    on<LogInUser> (_loginUsers);
  }

  final AuthenticationRepository _authRepo;
  void _nameChange(Namechanged event, Emitter<AuthenticationState> emit){
    final newValueForName = event.name;
    final newState = state.copyWith(name: newValueForName);
    print("new value for:: $newValueForName");
    emit(newState);
  }

  void _emailChange(Emailchanged event, Emitter<AuthenticationState> emit){
    final newValueForEmail = event.email;
    final newState = state.copyWith(email: newValueForEmail);
    print("new value for:: $newValueForEmail");
    emit(newState);
  }
  void _pwdChange(Passwordchanged event, Emitter<AuthenticationState> emit){
    final newValueForPwd = event.password;
    final newState = state.copyWith(password: newValueForPwd);
    print("new value for:: $newValueForPwd");
    emit(newState);
  }
  void _pwdConfChange(PasswordConfirmchanged event, Emitter<AuthenticationState> emit){
    final newValueFoPwdConf = event.password_confirm;
    final newState = state.copyWith(password_confirm: newValueFoPwdConf);
    print("new value for:: $newValueFoPwdConf");
    emit(newState);
  }

  Future<void> _formSubmit(FormSubmit event, Emitter<AuthenticationState> emit) async {
    final name = state.name.trim();
    final email = state.email.trim();
    final password = state.password.trim();
    final password_confirm = state.password_confirm.trim();

    print("Current state values: name=$name, email=$email, password=$password, password_confirm=$password_confirm");

    if (name.isEmpty || email.isEmpty || password.isEmpty || password_confirm.isEmpty) {
      print("Error: Missing required fields");
      emit(state.copyWith(
        status: FormStatus.error,
        errorMsg: "Tous les champs doivent être remplis",
      ));
      return;
    }

    final RegisterUsers user = RegisterUsers(
      name: name,
      email: email,
      password: password,
      password_confirm: password_confirm,
    );

    print("User object created: $user");
    print("RegisterUsers object created: ${user.toMap()}");

    final registerUser = await _authRepo.registerUser(user);
    print("the user is : $registerUser");
    if(registerUser != null){
      emit(state.copyWith(
        status: FormStatus.success,
      ));
    }else {
      emit(state.copyWith(
        status: FormStatus.error,
        errorMsg: "Inscription échouée",
      ));
      print("Inscription échouée");
    }
  }

  Future<void> _loginUsers(LogInUser event, Emitter<AuthenticationState> emit) async {
    final email = state.email.trim();
    final password = state.password;

    print("email=$email, password=$password");

    if (email.isEmpty || password.isEmpty) {
      print("Error: Missing required fields");
      emit(state.copyWith(
        status: FormStatus.error,
        errorMsg: "Tous les champs doivent être remplis",
      ));
      return;
    }

    final LoginUsers user = LoginUsers(
      email: email,
      password: password,
    );

    print("User object created: $user");
    print("LoginUsers object created: ${user.toMap()}");

    final logUser = await _authRepo.tryLoginUser(user);
    print("the user is : $logUser");
    if(logUser != null){
      emit(state.copyWith(
        status: FormStatus.success,
      ));
    }else {
      emit(state.copyWith(
        status: FormStatus.error,
        errorMsg: "Connxion échouée",
      ));
      print("Connxion échouée");
    }
  }
}