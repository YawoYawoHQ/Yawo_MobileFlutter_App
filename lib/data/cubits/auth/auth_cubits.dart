



import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/data/cubits/auth/auth_states.dart';

import '../../repositories/auth_repositories.dart';

class AuthCubit extends Cubit<AuthState>{
  final AuthRepository authRepository;

  AuthCubit(this.authRepository): super(AuthInitialState());
}