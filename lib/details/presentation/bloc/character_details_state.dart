part of 'character_details_bloc.dart';

sealed class CharacterDetailsState extends Equatable {
  const CharacterDetailsState();

  @override
  List<Object> get props => [];
}

class CharacterDetailsInitialState extends CharacterDetailsState {}

class CharacterDetailsLoadingState extends CharacterDetailsState {}

class CharacterDetailsErrorState extends CharacterDetailsState {}

class CharacterDetailsResultState extends CharacterDetailsState {
  const CharacterDetailsResultState(this.response);

  final CharacterDetailResponse response;

  @override
  List<Object> get props => [response];
}
