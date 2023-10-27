import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ricky_n_morty_aap/characters/presentation/bloc/character_bloc.dart';
import 'package:ricky_n_morty_aap/details/data/repository/details_repository.dart';
import 'package:ricky_n_morty_aap/details/data/service/character_detail_response.dart';
import 'package:ricky_n_morty_aap/details/presentation/bloc/character_details_bloc.dart';

void main() {
  group('characters details bloc success flow', () {
    late CharacterDetailsRepository repository;
    late CharacterDetailsBloc bloc;
    late CharacterDetailResponse response;

    setUp(() async {
      repository = CharacterDetailsRepositoryMock();
      response = CharacterDetailResponseMock();
      bloc = CharacterDetailsBloc(repository);

      when(() => repository.getCharacterDetails('1'))
          .thenAnswer((_) async => response);
    });

    blocTest('Should emit success result',
        build: () => bloc,
        tearDown: () => bloc.close(),
        act: (bloc) => bloc.add(
              const CharacterDetailsRequestEvent('1'),
            ),
        expect: () => [
              CharacterDetailsLoadingState(),
              CharacterDetailsResultState(response)
            ],
        verify: (_) async =>
            {verify(() => repository.getCharacterDetails('1')).called(1)});
  });
  group('characters details bloc error flow', () {
    late CharacterDetailsRepository repository;
    late CharacterDetailsBloc bloc;
    late CharacterDetailResponse response;

    setUp(() async {
      repository = CharacterDetailsRepositoryMock();
      response = CharacterDetailResponseMock();
      bloc = CharacterDetailsBloc(repository);

      when(() => repository.getCharacterDetails('1'))
          .thenThrow((_) async => Exception('Ops, something wrong happend'));
    });

    blocTest(
      'Should emit error result',
      build: () => bloc,
      tearDown: () => bloc.close(),
      act: (bloc) => bloc.add(
        const CharacterDetailsRequestEvent('1'),
      ),
      expect: () =>
          [CharacterDetailsLoadingState(), CharacterDetailsErrorState()],
    );
  });
}

class CharacterDetailResponseMock extends Mock
    implements CharacterDetailResponse {}

class CharacterDetailsRepositoryMock extends Mock
    implements CharacterDetailsRepository {}
