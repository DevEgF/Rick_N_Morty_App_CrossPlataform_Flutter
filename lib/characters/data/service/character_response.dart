import 'package:equatable/equatable.dart';

class CharacterInfoResponse extends Equatable {
  factory CharacterInfoResponse.fromJson(Map<String, dynamic> json) =>
      CharacterInfoResponse(
        json['count'] as int?,
        json['pages'] as int?,
        json['next'] as String?,
        json['prev'] as String?,
      );

  const CharacterInfoResponse(
    this.count,
    this.pages,
    this.next,
    this.prev,
  );
  final int? count;
  final int? pages;
  final String? next;
  final String? prev;

  @override
  List<Object?> get props => [count, pages, next, prev];
}

class CharacterResponse extends Equatable {
  factory CharacterResponse.fromJson(Map<String, dynamic> json) =>
      CharacterResponse(
        json['id'] as int,
        json['name'] as String,
        json['status'] as String,
        json['species'] as String,
        json['type'] as String,
        json['image'] as String,
      );

  const CharacterResponse(
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.image,
  );
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String image;

  @override
  List<Object> get props => [id, name, status, species, type, image];
}

class CharactersApiResponse extends Equatable {
  factory CharactersApiResponse.fromJson(Map<String, dynamic> json) =>
      CharactersApiResponse(
        CharacterInfoResponse.fromJson(json['info']),
        (json['results'] as List<dynamic>)
            .map((characterJson) => CharacterResponse.fromJson(characterJson))
            .toList(),
      );

  const CharactersApiResponse(this.info, this.results);
  final CharacterInfoResponse info;
  final List<CharacterResponse> results;

  @override
  List<Object> get props => [info, results];
}
