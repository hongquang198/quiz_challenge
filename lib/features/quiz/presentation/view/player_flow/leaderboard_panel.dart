import 'package:flutter/material.dart';

import '../../../domain/entities/participant.dart';

class LeaderboardPanel extends StatelessWidget {
  const LeaderboardPanel({
    super.key,
    required this.participants,
    required this.selfUserId,
  });

  final List<Participant> participants;
  final String? selfUserId;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Leaderboard', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        Expanded(
          child: ListView.builder(
            itemCount: participants.length,
            itemBuilder: (context, index) {
              final p = participants[index];
              final isSelf = selfUserId != null && p.userId == selfUserId;

              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: _LeaderboardTile(
                  key: ValueKey(p.userId), // Crucial for tracking the same user
                  isSelf: isSelf,
                  rank: index + 1,
                  name: p.name,
                  score: p.score,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _LeaderboardTile extends StatelessWidget {
  const _LeaderboardTile({
    required this.key,
    required this.rank,
    required this.name,
    required this.score,
    required this.isSelf,
  });

  final Key key;
  final int rank;
  final String name;
  final int score;
  final bool isSelf;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final baseColor = colorScheme.surfaceVariant;

    return Container(
      key: key,
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: isSelf ? baseColor : baseColor.withOpacity(0.6),
        border:
            isSelf ? Border.all(color: colorScheme.primary, width: 2) : null,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          Text(
            '#$rank',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              name,
              style: Theme.of(context).textTheme.bodyMedium,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            '$score',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontFeatures: const [FontFeature.tabularFigures()],
            ),
          ),
        ],
      ),
    );
  }
}
