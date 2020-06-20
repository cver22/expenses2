import 'package:expenses/models/register/register_status.dart';
import 'package:meta/meta.dart';

@immutable
class RegisterState {
  final RegisterStatus registerStatus;
  final bool isEmailValid;
  final bool isPasswordValid;

  bool get isFormValid => isEmailValid && isPasswordValid;

  RegisterState({
    @required this.registerStatus,
    @required this.isEmailValid,
    @required this.isPasswordValid,
  });

  factory RegisterState.initial() {
    return RegisterState(
      registerStatus: RegisterStatus.initial,
      isEmailValid: true,
      isPasswordValid: true,
    );
  }

  factory RegisterState.submitting() {
    return RegisterState(
      registerStatus: RegisterStatus.submitting,
      isEmailValid: true,
      isPasswordValid: true,
    );
  }

  factory RegisterState.failure() {
    return RegisterState(
      registerStatus: RegisterStatus.failure,
      isEmailValid: true,
      isPasswordValid: true,
    );
  }

  factory RegisterState.success() {
    return RegisterState(
      registerStatus: RegisterStatus.success,
      isEmailValid: true,
      isPasswordValid: true,
    );
  }

  RegisterState updateCredentials({
    bool isEmailValid,
    bool isPasswordValid,
  }) {
    return copyWith(
      registerStatus: RegisterStatus.updated,
      isEmailValid: isEmailValid,
      isPasswordValid: isPasswordValid,
    );
  }

  RegisterState copyWith({
    RegisterStatus registerStatus,
    bool isEmailValid,
    bool isPasswordValid,
  }) {
    return RegisterState(
      registerStatus: registerStatus ?? this.registerStatus,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
    );
  }

  @override
  String toString() {
    return '''{RegisterState {
    registerStatus: $registerStatus,
    isEmailValid: $isEmailValid,
      isPasswordValid: $isPasswordValid,
      }''';
  }
}
