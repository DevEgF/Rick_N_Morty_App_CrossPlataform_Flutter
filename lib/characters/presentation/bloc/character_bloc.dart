import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ricky_n_morty_aap/characters/data/service/character_response.dart';
import 'package:ricky_n_morty_aap/characters/domain/character_interactor.dart';
import 'package:ricky_n_morty_aap/shared/event_transformations.dart';

part 'character_event.dart';
part 'character_state.dart';

@injectable
class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  CharacterBloc(this._interactor) : super(const CharacterState()) {
    on<CharacterEvent>(
      _onCharacterRequestEvent,
      transformer: throttleDroppable(
        const Duration(milliseconds: 100),
      ),
    );
  }

  final CharactersInteractor _interactor;

  Future<void> _onCharacterRequestEvent(
    CharacterEvent event,
    Emitter<CharacterState> emit,
  ) async {
    if (state.hasReachedMax) {
      return;
    }

    emit(state.copyWith(result: ResultState.loading));

    try {
      final response = await _interactor.fetchCharacters(state.page);

      emit(
        state.copyWith(
          page: state.page + 1,
          characters: List.of(state.characters)..addAll(response.results),
          hasReachedMax: state.page >= (response.info.pages ?? 1),
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(result: ResultState.error),
      );
    }
  }
}
