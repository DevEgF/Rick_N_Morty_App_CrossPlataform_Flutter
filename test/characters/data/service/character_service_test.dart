import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ricky_n_morty_aap/characters/data/service/character_service.dart';

class DioMock extends Mock implements Dio {}

class ResponseMock extends Mock implements Response<dynamic> {}

void main() {
  group('character service status ok', () {
    late Dio client;
    late CharacterService service;
    final response = ResponseMock();

    setUp(() {
      client = DioMock();
      service = CharacterServiceImpl(client);
    });

    test(
        'GIVEN http client '
        'WHEN request characters at first page '
        'THEN get valid answer', () async {
      // GIVEN
      final dynamic dynamicResponse = {
        'results': [],
        'info': {
          'count': 919,
          'pages': 2,
          'next': null,
          'prev': null,
        }
      };

      when(() => response.statusCode).thenReturn(200);
      when(() => response.data).thenReturn(dynamicResponse);
      when(() => client.get('/character', queryParameters: {'page': '1'}))
          .thenAnswer((_) async => response);

      // WHEN
      final result = await service.getCharacters();

      // THEN
      expect(result.info.count, 919);
    });

    group('character service status invalid', () {
      late Dio client;
      late CharacterService service;

      setUp(() {
        client = DioMock();
        service = CharacterServiceImpl(client);
      });

      test(
          'GIVEN http client '
          'WHEN request characters at first page '
          'THEN get 404 and exception', () async {
        //WHEN
        when(() => response.statusCode).thenReturn(404);
        when(() => client.get('/character', queryParameters: {'page': '1'}))
            .thenAnswer((_) async => response);

        //THEN
        expect(() => service.getCharacters(), throwsA(isA<HttpException>()));
      });
    });
  });
}
