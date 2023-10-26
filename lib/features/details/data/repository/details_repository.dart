import 'package:injectable/injectable.dart';
import 'package:ricky_n_morty_aap/details/data/service/character_detail_response.dart';
import 'package:ricky_n_morty_aap/details/data/service/character_detail_service.dart';

abstract class CharacterDetailsRepository {
  Future<CharacterDetailResponse> getCharacterDetails(String id);
}

@Injectable(as: CharacterDetailsRepository)
class CharacterDetailsRepositoryImpl implements CharacterDetailsRepository {
  const CharacterDetailsRepositoryImpl(this._service);

  final CharacterDetailService _service;

  @override
  Future<CharacterDetailResponse> getCharacterDetails(String id) =>
      _service.getCharacterDetails(id);
}
