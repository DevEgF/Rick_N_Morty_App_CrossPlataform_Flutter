import 'package:injectable/injectable.dart';
import 'package:ricky_n_morty_aap/characters/data/service/character_response.dart';
import 'package:ricky_n_morty_aap/characters/data/service/character_service.dart';

abstract class CharacterRepository {
  Future<CharactersApiResponse> getCharacters(int page);
}

@Injectable(as: CharacterRepository)
class CharactersRepositoryImpl implements CharacterRepository {
  const CharactersRepositoryImpl(this._service);

  final CharacterService _service;

  @override
  Future<CharactersApiResponse> getCharacters(int page) =>
      _service.getCharacters(page);
}
