import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ricky_n_morty_aap/characters/data/service/character_response.dart';

abstract class CharacterService {
  Future<CharactersApiResponse> getCharacters([int page = 1]);
}

@Injectable(as: CharacterService)
class CharacterServiceImpl implements CharacterService {
  const CharacterServiceImpl(this._client);

  final Dio _client;

  @override
  Future<CharactersApiResponse> getCharacters([int page = 1]) async {
    final response = await _client.get(
      '/character',
      queryParameters: {'page': '$page'},
    );

    if (response.statusCode == 200) {
      return CharactersApiResponse.fromJson(response.data);
    }

    throw HttpException('Fail to get characters at page $page');
  }
}
