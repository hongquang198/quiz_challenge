import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/domain/failures/app_failure.dart';
import '../../../../../core/domain/repositories/auth_repository.dart';
import '../../../domain/repositories/quiz_repository.dart';

part 'create_quiz_bloc.freezed.dart';
part 'create_quiz_event.dart';
part 'create_quiz_state.dart';

@injectable
class CreateQuizBloc extends Bloc<CreateQuizEvent, CreateQuizState> {
  CreateQuizBloc(
    this._authRepository,
    this._quizRepository,
  ) : super(const CreateQuizState.initial()) {
    on<CreateQuizRequested>(_onCreateQuizRequested);
  }

  final AuthRepository _authRepository;
  final QuizRepository _quizRepository;

  Future<void> _onCreateQuizRequested(
    CreateQuizRequested event,
    Emitter<CreateQuizState> emit,
  ) async {
    emit(const CreateQuizState.loading());
    try {
      final userId = await _ensureSignedIn();
      final quizId = await _quizRepository.createQuiz(
        hostId: userId,
        questionCount: event.questionCount,
        questionDurationSeconds: event.questionDurationSeconds,
      );
      emit(CreateQuizState.success(quizId: quizId));
    } on AppFailure catch (f) {
      emit(CreateQuizState.failure(message: f.toString()));
    } catch (e) {
      emit(CreateQuizState.failure(message: e.toString()));
    }
  }

  Future<String> _ensureSignedIn() async {
    final existing = _authRepository.currentUserId();
    if (existing != null) return existing;
    return _authRepository.signInAnonymously();
  }
}

