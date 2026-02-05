// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:firebase_database/firebase_database.dart' as _i345;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:real_time_quiz/core/data/di/firebase_module.dart' as _i1052;
import 'package:real_time_quiz/core/data/repositories/firebase_auth_repository.dart'
    as _i683;
import 'package:real_time_quiz/core/domain/repositories/auth_repository.dart'
    as _i118;
import 'package:real_time_quiz/core/domain/services/quiz_id_generator.dart'
    as _i706;
import 'package:real_time_quiz/core/utils/secure_quiz_id_generator.dart'
    as _i28;
import 'package:real_time_quiz/features/quiz/data/datasources/open_trivia_api.dart'
    as _i211;
import 'package:real_time_quiz/features/quiz/data/repositories/firebase_quiz_repository.dart'
    as _i405;
import 'package:real_time_quiz/features/quiz/data/repositories/firebase_time_sync_repository.dart'
    as _i20;
import 'package:real_time_quiz/features/quiz/data/repositories/open_trivia_repository.dart'
    as _i943;
import 'package:real_time_quiz/features/quiz/domain/repositories/quiz_repository.dart'
    as _i815;
import 'package:real_time_quiz/features/quiz/domain/repositories/time_sync_repository.dart'
    as _i139;
import 'package:real_time_quiz/features/quiz/domain/repositories/trivia_repository.dart'
    as _i1010;
import 'package:real_time_quiz/features/quiz/presentation/bloc/create_quiz/create_quiz_bloc.dart'
    as _i220;
import 'package:real_time_quiz/features/quiz/presentation/bloc/host_game/host_game_bloc.dart'
    as _i7;
import 'package:real_time_quiz/features/quiz/presentation/bloc/lobby/lobby_bloc.dart'
    as _i934;
import 'package:real_time_quiz/features/quiz/presentation/bloc/player_game/player_game_bloc.dart'
    as _i235;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final firebaseModule = _$FirebaseModule();
    gh.lazySingleton<_i59.FirebaseAuth>(() => firebaseModule.firebaseAuth);
    gh.lazySingleton<_i345.FirebaseDatabase>(
      () => firebaseModule.firebaseDatabase,
    );
    gh.lazySingleton<_i211.OpenTriviaApi>(() => _i211.OpenTriviaApi());
    gh.lazySingleton<_i706.QuizIdGenerator>(() => _i28.SecureQuizIdGenerator());
    gh.lazySingleton<_i139.TimeSyncRepository>(
      () => _i20.FirebaseTimeSyncRepository(gh<_i345.FirebaseDatabase>()),
    );
    gh.lazySingleton<_i1010.TriviaRepository>(
      () => _i943.OpenTriviaRepository(gh<_i211.OpenTriviaApi>()),
    );
    gh.lazySingleton<_i118.AuthRepository>(
      () => _i683.FirebaseAuthRepository(gh<_i59.FirebaseAuth>()),
    );
    gh.lazySingleton<_i815.QuizRepository>(
      () => _i405.FirebaseQuizRepository(
        gh<_i345.FirebaseDatabase>(),
        gh<_i118.AuthRepository>(),
        gh<_i706.QuizIdGenerator>(),
        gh<_i1010.TriviaRepository>(),
      ),
    );
    gh.factory<_i934.LobbyBloc>(
      () => _i934.LobbyBloc(gh<_i815.QuizRepository>()),
    );
    gh.factory<_i7.HostGameBloc>(
      () => _i7.HostGameBloc(
        gh<_i815.QuizRepository>(),
        gh<_i139.TimeSyncRepository>(),
      ),
    );
    gh.factory<_i220.CreateQuizBloc>(
      () => _i220.CreateQuizBloc(
        gh<_i118.AuthRepository>(),
        gh<_i815.QuizRepository>(),
      ),
    );
    gh.factory<_i235.PlayerGameBloc>(
      () => _i235.PlayerGameBloc(
        gh<_i118.AuthRepository>(),
        gh<_i815.QuizRepository>(),
        gh<_i139.TimeSyncRepository>(),
      ),
    );
    return this;
  }
}

class _$FirebaseModule extends _i1052.FirebaseModule {}
