import 'package:flutter/material.dart';
import 'package:ricky_n_morty_aap/characters/data/service/character_response.dart';
import 'package:ricky_n_morty_aap/shared/widgets/circle_widget.dart';

class CharacterCardWidget extends StatelessWidget {
  const CharacterCardWidget({
    super.key,
    required this.response,
    this.onTap,
  });

  final CharacterResponse response;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 5,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 200,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(response.image),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        response.name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: theme.textTheme.titleMedium,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          CircleWidget(
                            status: response.status.toLowerCase(),
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Expanded(
                            child: Text(
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                '${response.status} - ${response.species}'),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Text(
                        'Last know location',
                        style: theme.textTheme.bodySmall,
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Expanded(
                        child: Text(
                          response.location.name,
                          style: theme.textTheme.bodyMedium,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
