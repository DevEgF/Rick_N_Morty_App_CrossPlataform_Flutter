import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ricky_n_morty_aap/characters/data/repository/character_repository.dart';
import 'package:ricky_n_morty_aap/characters/data/service/character_response.dart';
import 'package:ricky_n_morty_aap/characters/data/service/character_service.dart';

class CharacterServiceMock extends Mock implements CharacterService {}

class CharacterApiResponseMock extends Mock implements CharactersApiResponse {}

void main() {
  group('character repository ...', () {
    late CharacterService service;
    late CharacterRepository repository;

    setUp(() {
      service = CharacterServiceMock();
      repository = CharactersRepositoryImpl(service);
    });

    test(
        'GIVEN a service '
        'WHEN request api data at first page'
        'THEN get api response', () async {
      //GIVEN
      final mock = CharacterApiResponseMock();

      //WHEN
      when(() => service.getCharacters()).thenAnswer((_) async => mock);

      //THEN
      expect(await repository.getCharacters(1), mock);
    });
  });
}
