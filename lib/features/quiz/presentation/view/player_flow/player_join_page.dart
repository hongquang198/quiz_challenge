import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/game_state.dart';
import '../../../domain/entities/participant.dart';
import '../../../domain/entities/question.dart';
import '../../../domain/entities/quiz_config.dart';
import '../../../../../app/di/injection.dart';
import '../../bloc/player_game/player_game_bloc.dart';
import '../host_flow/host_flow_page.dart';
import 'player_game_page.dart';

class PlayerJoinPage extends StatefulWidget {
  const PlayerJoinPage({super.key});

  @override
  State<PlayerJoinPage> createState() => _PlayerJoinPageState();
}

class _PlayerJoinPageState extends State<PlayerJoinPage> {
  final _formKey = GlobalKey<FormState>();
  final _quizIdController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _quizIdController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BlocProvider<PlayerGameBloc>(
      create: (_) => getIt<PlayerGameBloc>(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Join Quiz')),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 480),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: BlocListener<PlayerGameBloc, PlayerGameState>(
                    listenWhen: (previous, current) {
                      // Only navigate if we are transitioning to a NEW state type
                      // This prevents re-navigating when Loaded state updates timestamps
                      return previous.runtimeType != current.runtimeType;
                    },
                    listener: (context, state) {
                      state.maybeWhen(
                        loaded: (
                          String quizId,
                          QuizStatus status,
                          GameState gameState,
                          List<Question> questions,
                          List<Participant> participants,
                          String selfId,
                          int questionDurationSeconds,
                          int secondsRemaining,
                          bool hasAnsweredCurrentQuestion,
                          int? selectedOptionIndex,
                          String? errorMessage,
                        ) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder:
                                  (_) => BlocProvider.value(
                                    value: context.read<PlayerGameBloc>(),
                                    child: const PlayerGamePage(),
                                  ),
                            ),
                          );
                        },
                        redirectToHost: (quizId) {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (_) => HostFlowPage(quizId: quizId),
                            ),
                          );
                        },
                        failure: (message) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(message),
                              backgroundColor: colorScheme.error,
                            ),
                          );
                        },
                        orElse: () {},
                      );
                    },
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Enter quiz code and display name',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: _quizIdController,
                            decoration: const InputDecoration(
                              labelText: 'Quiz Code',
                              border: OutlineInputBorder(),
                            ),
                            textCapitalization: TextCapitalization.characters,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Quiz code is required';
                              }
                              if (value.trim().length < 4) {
                                return 'Quiz code looks too short';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            controller: _nameController,
                            decoration: const InputDecoration(
                              labelText: 'Display Name',
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Display name is required';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          BlocBuilder<PlayerGameBloc, PlayerGameState>(
                            builder: (context, state) {
                              final isLoading = state.maybeWhen(
                                loading: () => true,
                                orElse: () => false,
                              );
                              return SizedBox(
                                height: 48,
                                child: ElevatedButton(
                                  onPressed:
                                      isLoading
                                          ? null
                                          : () {
                                            if (_formKey.currentState
                                                    ?.validate() ??
                                                false) {
                                              context
                                                  .read<PlayerGameBloc>()
                                                  .add(
                                                    PlayerJoinRequested(
                                                      quizId:
                                                          _quizIdController.text
                                                              .trim()
                                                              .toUpperCase(),
                                                      displayName:
                                                          _nameController.text
                                                              .trim(),
                                                    ),
                                                  );
                                            }
                                          },
                                  child:
                                      isLoading
                                          ? const CircularProgressIndicator()
                                          : const Text('Join Quiz'),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
