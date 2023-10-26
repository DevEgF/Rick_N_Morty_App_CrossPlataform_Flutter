import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ricky_n_morty_aap/details/data/service/character_detail_response.dart';

abstract class CharacterDetailService {
  Future<CharacterDetailResponse> getCharacterDetails(String id);
}

@Injectable(as: CharacterDetailService)
class CharacterDetailServiceImpl implements CharacterDetailService {
  CharacterDetailServiceImpl(this._client);

  final Dio _client;

  @override
  Future<CharacterDetailResponse> getCharacterDetails(String id) async {
    try {
      final character = await _client.get('/character/$id');
      final originUrl = character.data['origin']['url'];
      final locationUrl = character.data['location']['url'];

      final locations = await Future.wait([
        if (originUrl != '') ...{
          _client.get(originUrl).then((value) => value.data)
        },
        if (locationUrl != '') ...{
          _client.get(locationUrl).then((value) => value.data)
        }
      ]);

      var json = character.data;
      json['locations'] = locations;

      return CharacterDetailResponse.fromJson(json);
    } catch (_) {
      throw Exception('Fail getting character details $id');
    }
  }
}
