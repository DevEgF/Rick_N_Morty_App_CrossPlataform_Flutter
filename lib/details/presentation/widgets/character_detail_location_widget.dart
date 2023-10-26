import 'package:flutter/material.dart';
import 'package:ricky_n_morty_aap/details/data/service/character_detail_location_response.dart';

class CharacterDetailLocationWidget extends StatelessWidget {
  const CharacterDetailLocationWidget({
    super.key,
    required this.location,
  });

  final CharacterDetailLocationResponse location;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 4,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 8.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              location.type,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: theme.textTheme.headlineMedium,
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              location.name,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: theme.textTheme.bodySmall,
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(location.dimension,
                overflow: TextOverflow.ellipsis, maxLines: 1),
          ],
        ),
      ),
    );
  }
}
