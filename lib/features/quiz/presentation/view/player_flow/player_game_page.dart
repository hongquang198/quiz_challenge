import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/game_state.dart';
import '../../../domain/entities/participant.dart';
import '../../../domain/entities/question.dart';
import '../../../domain/entities/quiz_config.dart';
import '../../bloc/player_game/player_game_bloc.dart';
import '../widgets/celebratory_emoji.dart';
import 'leaderboard_panel.dart';

class PlayerGamePage extends StatelessWidget {
  const PlayerGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Quiz')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<PlayerGameBloc, PlayerGameState>(
          builder: (context, state) {
            return state.maybeWhen(
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
                final index = gameState.currentQuestionIndex;
                final hasQuestion =
                    index >= 0 &&
                    index < questions.length &&
                    status == QuizStatus.inProgress;
                final isFinished = status == QuizStatus.finished;

                return LayoutBuilder(
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
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Chip(label: Text('Code: $quizId')),
                                      const Spacer(),
                                      if (status == QuizStatus.inProgress)
                                        _CountdownBadge(
                                          secondsRemaining: secondsRemaining,
                                        ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  if (!hasQuestion)
                                    Expanded(
                                      child: Center(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              status == QuizStatus.waiting
                                                  ? (participants.length < 2
                                                      ? 'Wait for at least 2 players to join...'
                                                      : 'Waiting for host to start...')
                                                  : 'Quiz finished 🎉',
                                              style:
                                                  Theme.of(
                                                    context,
                                                  ).textTheme.bodyLarge,
                                            ),
                                            if (status == QuizStatus.waiting &&
                                                participants.length < 2) ...[
                                              const SizedBox(height: 8),
                                              Text(
                                                '(Current: ${participants.length})',
                                                style: Theme.of(
                                                  context,
                                                ).textTheme.bodySmall?.copyWith(
                                                  color: colorScheme.error,
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
                                      style:
                                          Theme.of(
                                            context,
                                          ).textTheme.titleMedium,
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      questions[index].text,
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                    const SizedBox(height: 24),
                                    Expanded(
                                      child: _OptionsGrid(
                                        options: questions[index].options,
                                        enabled:
                                            !hasAnsweredCurrentQuestion &&
                                            secondsRemaining > 0 &&
                                            status == QuizStatus.inProgress,
                                        selectedIndex: state.maybeMap(
                                          loaded: (s) => s.selectedOptionIndex,
                                          orElse: () => null,
                                        ),
                                        correctIndex:
                                            questions[index].correctIndex,
                                        onSelected: (optionIndex) {
                                          context.read<PlayerGameBloc>().add(
                                            PlayerAnswerSelected(
                                              selectedOptionIndex: optionIndex,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
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
                                        child: Card(
                                          elevation: 8,
                                          child: Padding(
                                            padding: const EdgeInsets.all(24),
                                            child: LeaderboardPanel(
                                              participants: participants,
                                              selfUserId: state.maybeMap(
                                                loaded: (s) => s.selfId,
                                                orElse: () => null,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                  : Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: LeaderboardPanel(
                                        participants: participants,
                                        selfUserId: null,
                                      ),
                                    ),
                                  ),
                              if (isFinished)
                                const CelebratoryEmoji(emoji: '🎉'),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              failure:
                  (message) => Center(
                    child: Text(
                      message,
                      style: TextStyle(color: colorScheme.error),
                    ),
                  ),
              orElse: () => const Center(child: CircularProgressIndicator()),
            );
          },
        ),
      ),
    );
  }
}

class _CountdownBadge extends StatelessWidget {
  const _CountdownBadge({required this.secondsRemaining});

  final int secondsRemaining;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final fraction = (secondsRemaining / 15).clamp(0, 1).toDouble();

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: fraction, end: fraction),
      duration: const Duration(milliseconds: 300),
      builder: (context, value, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: 32,
              width: 32,
              child: CircularProgressIndicator(
                value: value,
                strokeWidth: 4,
                color: colorScheme.primary,
                backgroundColor: colorScheme.surfaceVariant,
              ),
            ),
            Text(
              secondsRemaining.toString(),
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        );
      },
    );
  }
}

class _OptionsGrid extends StatelessWidget {
  const _OptionsGrid({
    required this.options,
    required this.enabled,
    required this.onSelected,
    this.selectedIndex,
    this.correctIndex,
  });

  final List<String> options;
  final bool enabled;
  final ValueChanged<int> onSelected;
  final int? selectedIndex;
  final int? correctIndex;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 2.2, // Made taller to accommodate more text
      ),
      itemCount: options.length,
      itemBuilder: (context, index) {
        final option = options[index];

        // Determine color based on state
        Color? backgroundColor = colorScheme.secondaryContainer;
        Color? foregroundColor = colorScheme.onSecondaryContainer;
        double opacity = enabled ? 1.0 : 0.6;

        if (selectedIndex != null) {
          // User has answered
          if (index == correctIndex) {
            // Correct answer -> Green
            backgroundColor = Colors.green;
            foregroundColor = Colors.white;
            opacity = 1.0;
          } else if (index == selectedIndex) {
            // Wrong answer selected -> Red
            backgroundColor = Colors.red;
            foregroundColor = Colors.white;
            opacity = 1.0;
          }
        }

        return AnimatedOpacity(
          duration: const Duration(milliseconds: 200),
          opacity: opacity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
              foregroundColor: foregroundColor,
              disabledBackgroundColor:
                  backgroundColor, // Fix: Show color even when disabled
              disabledForegroundColor:
                  foregroundColor, // Fix: Show color even when disabled
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: enabled ? () => onSelected(index) : null,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.center,
              child: Text(
                option,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        );
      },
    );
  }
}
