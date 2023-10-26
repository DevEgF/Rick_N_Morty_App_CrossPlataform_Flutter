import 'package:injectable/injectable.dart';
import 'package:ricky_n_morty_aap/characters/data/repository/character_repository.dart';
import 'package:ricky_n_morty_aap/characters/data/service/character_response.dart';

abstract class CharactersInteractor {
  Future<CharactersApiResponse> fetchCharacters(int page);
}

@Injectable(as: CharactersInteractor)
class CharactersInteractorImpl implements CharactersInteractor {
  const CharactersInteractorImpl(this._repository);

  final CharacterRepository _repository;

  @override
  Future<CharactersApiResponse> fetchCharacters(int page) =>
      _repository.getCharacters(page);
}
