import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/di/injection.dart';

import '../../../domain/entities/participant.dart';
import '../../../domain/entities/quiz_config.dart';
import '../../bloc/create_quiz/create_quiz_bloc.dart';
import '../../bloc/host_game/host_game_bloc.dart';
import '../../bloc/lobby/lobby_bloc.dart';
import '../../../../../core/domain/repositories/auth_repository.dart';
import '../player_flow/leaderboard_panel.dart';
import '../widgets/celebratory_emoji.dart';

class HostFlowPage extends StatelessWidget {
  const HostFlowPage({super.key, this.quizId});

  final String? quizId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CreateQuizBloc>(create: (_) => getIt<CreateQuizBloc>()),
        BlocProvider<LobbyBloc>(create: (_) => getIt<LobbyBloc>()),
        BlocProvider<HostGameBloc>(create: (_) => getIt<HostGameBloc>()),
      ],
      child: _HostFlowView(quizId: quizId),
    );
  }
}

class _HostFlowView extends StatefulWidget {
  const _HostFlowView({this.quizId});

  final String? quizId;

  @override
  State<_HostFlowView> createState() => _HostFlowViewState();
}

class _HostFlowViewState extends State<_HostFlowView> {
  @override
  void initState() {
    super.initState();
    if (widget.quizId == null) {
      context.read<CreateQuizBloc>().add(
        const CreateQuizRequested(
          questionCount: 10,
          questionDurationSeconds: 15,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Host Quiz')),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        child:
            widget.quizId != null
                ? _LobbyAndGameView(quizId: widget.quizId!)
                : BlocBuilder<CreateQuizBloc, CreateQuizState>(
                  key: const ValueKey('createQuizStage'),
                  builder: (context, state) {
                    return state.map(
                      initial: (_) => const _CreatingQuizCard(),
                      loading: (_) => const _CreatingQuizCard(),
                      success: (s) => _LobbyAndGameView(quizId: s.quizId),
                      failure:
                          (f) => Center(
                            child: Text(
                              f.message,
                              style: TextStyle(color: colorScheme.error),
                            ),
                          ),
                    );
                  },
                ),
      ),
    );
  }
}

class _CreatingQuizCard extends StatelessWidget {
  const _CreatingQuizCard();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Center(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(color: colorScheme.primary),
              const SizedBox(height: 16),
              const Text('Creating quiz and fetching questions...'),
            ],
          ),
        ),
      ),
    );
  }
}

class _LobbyAndGameView extends StatefulWidget {
  const _LobbyAndGameView({required this.quizId});

  final String quizId;

  @override
  State<_LobbyAndGameView> createState() => _LobbyAndGameViewState();
}

class _LobbyAndGameViewState extends State<_LobbyAndGameView> {
  @override
  void initState() {
    super.initState();
    // Initialize blocs once in initState instead of build
    context.read<LobbyBloc>().add(LobbyStarted(quizId: widget.quizId));
    context.read<HostGameBloc>().add(HostGameStarted(quizId: widget.quizId));
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BlocBuilder<HostGameBloc, HostGameState>(
      builder: (context, hostState) {
        final status = hostState.maybeMap(
          loaded: (s) => s.status,
          orElse: () => QuizStatus.waiting,
        );

        final isFinished = status == QuizStatus.finished;

        return Padding(
          padding: const EdgeInsets.all(16),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final width = constraints.maxWidth;
              final spacing = 16.0;

              // Dimensions for split view
              final qWidth = (width - spacing) * 0.6;
              final lWidth = (width - spacing) * 0.4;

              return Stack(
                clipBehavior: Clip.none,
                children: [
                  // Questions side (slides out left)
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 800),
                    curve: Curves.easeInOutExpo,
                    left: isFinished ? -width : 0,
                    top: 0,
                    bottom: 0,
                    width: qWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Quiz Code',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        const SizedBox(height: 8),
                        _QuizCodeChip(code: widget.quizId),
                        const SizedBox(height: 24),
                        Expanded(
                          child: hostState.maybeMap(
                            loaded:
                                (s) => BlocBuilder<LobbyBloc, LobbyState>(
                                  builder: (context, lobbyState) {
                                    final participants = lobbyState.maybeMap(
                                      loaded: (ls) => ls.participants,
                                      orElse: () => <Participant>[],
                                    );
                                    return _HostQuestionPane(
                                      state: s,
                                      participantCount: participants.length,
                                    );
                                  },
                                ),
                            loading:
                                (_) => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                            orElse:
                                () => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Leaderboard side (slides left and expands)
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 800),
                    curve: Curves.easeInOutExpo,
                    left: isFinished ? 0 : qWidth + spacing,
                    top: 0,
                    bottom: 0,
                    width: isFinished ? width : lWidth,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        isFinished
                            ? Column(
                              children: [
                                Text(
                                  'Final Results 🏆',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.displayMedium?.copyWith(
                                    color: colorScheme.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 24),
                                Expanded(
                                  child: _LeaderboardCard(
                                    status: status,
                                    colorScheme: colorScheme,
                                    isFullScreen: true,
                                    selfUserId:
                                        getIt<AuthRepository>().currentUserId(),
                                  ),
                                ),
                              ],
                            )
                            : _LeaderboardCard(
                              status: status,
                              colorScheme: colorScheme,
                              isFullScreen: false,
                              selfUserId:
                                  getIt<AuthRepository>().currentUserId(),
                            ),
                        if (isFinished) const CelebratoryEmoji(emoji: '🎉'),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}

class _LeaderboardCard extends StatelessWidget {
  const _LeaderboardCard({
    required this.status,
    required this.colorScheme,
    this.isFullScreen = false,
    this.selfUserId,
  });

  final QuizStatus status;
  final ColorScheme colorScheme;
  final bool isFullScreen;
  final String? selfUserId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LobbyBloc, LobbyState>(
      builder: (context, state) {
        final participants = state.maybeMap(
          loaded: (s) => s.participants,
          orElse: () => <Participant>[],
        );

        return Card(
          elevation: isFullScreen ? 8 : 1,
          child: Padding(
            padding: EdgeInsets.all(isFullScreen ? 24 : 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Lobby',
                      style:
                          isFullScreen
                              ? Theme.of(context).textTheme.headlineMedium
                              : Theme.of(context).textTheme.titleMedium,
                    ),
                    const Spacer(),
                    if (isFullScreen)
                      Chip(
                        label: const Text('Game Over'),
                        backgroundColor: colorScheme.errorContainer,
                      ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  _getLobbyStatus(status, participants.length),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurface.withOpacity(0.7),
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: LeaderboardPanel(
                    participants: participants,
                    selfUserId: selfUserId,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String _getLobbyStatus(QuizStatus status, int participantCount) {
    switch (status) {
      case QuizStatus.waiting:
        return participantCount < 2
            ? 'Wait for at least 2 players to join...'
            : 'Ready to start!';
      case QuizStatus.inProgress:
        return 'Quiz in progress';
      case QuizStatus.finished:
        return 'Quiz finished';
    }
  }
}

class _QuizCodeChip extends StatelessWidget {
  const _QuizCodeChip({required this.code});

  final String code;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Transform.scale(scale: value, child: child);
      },
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: () {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Share code: $code')));
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: colorScheme.primaryContainer,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                code,
                style: TextStyle(
                  color: colorScheme.onPrimaryContainer,
                  fontFeatures: const [FontFeature.tabularFigures()],
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(width: 8),
              Icon(Icons.copy, size: 16, color: colorScheme.onPrimaryContainer),
            ],
          ),
        ),
      ),
    );
  }
}

class _HostQuestionPane extends StatelessWidget {
  const _HostQuestionPane({
    required this.state,
    required this.participantCount,
  });

  final HostGameLoaded state;
  final int participantCount;

  @override
  Widget build(BuildContext context) {
    final index = state.gameState.currentQuestionIndex;
    final hasQuestion =
        index >= 0 &&
        index < state.questions.length &&
        state.status == QuizStatus.inProgress;

    final canStart = participantCount >= 2;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!hasQuestion)
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        state.status == QuizStatus.finished
                            ? 'Quiz Finished! 🎉'
                            : 'Press "Start Game" to begin.',
                        style: Theme.of(context).textTheme.headlineSmall,
                        textAlign: TextAlign.center,
                      ),
                      if (state.status == QuizStatus.waiting && !canStart) ...[
                        const SizedBox(height: 12),
                        Text(
                          'Wait for at least 2 players to join\n(Current: $participantCount)',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.error,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              )
            else ...[
              Text(
                'Question ${index + 1}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Text(
                state.questions[index].text,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 16),
            ],
            const Spacer(),
            if (state.status != QuizStatus.finished)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton.icon(
                    onPressed:
                        (state.status == QuizStatus.waiting && !canStart)
                            ? null
                            : () {
                              if (state.status == QuizStatus.waiting) {
                                context.read<HostGameBloc>().add(
                                  const HostStartGame(),
                                );
                              } else {
                                context.read<HostGameBloc>().add(
                                  const HostNextQuestionRequested(),
                                );
                              }
                            },
                    icon: const Icon(Icons.skip_next),
                    label:
                        state.status == QuizStatus.inProgress
                            ? const Text('Next Question')
                            : const Text('Start Game'),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
