import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:ricky_n_morty_aap/details/data/repository/details_repository.dart';
import 'package:ricky_n_morty_aap/details/data/service/character_detail_response.dart';

part 'character_details_event.dart';
part 'character_details_state.dart';

@injectable
class CharacterDetailsBloc
    extends Bloc<CharacterDetailsEvent, CharacterDetailsState> {
  CharacterDetailsBloc(this._repository)
      : super(CharacterDetailsInitialState()) {
    on(_onRequestEvent);
  }

  final CharacterDetailsRepository _repository;

  FutureOr<void> _onRequestEvent(CharacterDetailsRequestEvent event,
      Emitter<CharacterDetailsState> emit) async {
    try {
      emit(CharacterDetailsLoadingState());

      emit(CharacterDetailsResultState(
          await _repository.getCharacterDetails(event.id)));
    } catch (_) {
      emit(CharacterDetailsErrorState());
    }
  }
}
