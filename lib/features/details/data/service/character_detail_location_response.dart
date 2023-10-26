import 'package:equatable/equatable.dart';

class CharacterDetailLocationResponse extends Equatable {
  const CharacterDetailLocationResponse({
    required this.name,
    required this.type,
    required this.dimension,
  });

  factory CharacterDetailLocationResponse.fromJson(Map<String, dynamic> json) =>
      CharacterDetailLocationResponse(
        name: json['name'] as String,
        type: json['type'] as String,
        dimension: json['dimension'],
      );

  final String name;
  final String type;
  final String dimension;

  @override
  List<Object?> get props => [
        name,
        type,
        dimension,
      ];
}
