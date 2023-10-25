import 'package:equatable/equatable.dart';
import 'package:ricky_n_morty_aap/details/data/service/character_detail_location_response.dart';

class CharacterDetailResponse extends Equatable {
  const CharacterDetailResponse({
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.image,
    required this.locations,
  });

  factory CharacterDetailResponse.fromJson(Map<String, dynamic> json) =>
      CharacterDetailResponse(
        name: json['name'] as String,
        status: json['status'] as String,
        species: json['species'] as String,
        type: json['type'] as String,
        gender: json['gender'] as String,
        image: json['image'] as String,
        locations: (json['locations'] as List<dynamic>)
            .map((locations) =>
                CharacterDetailLocationResponse.fromJson(locations))
            .toList(),
      );

  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final String image;
  final List<CharacterDetailLocationResponse> locations;

  @override
  List<Object?> get props => [
        name,
        species,
        species,
        type,
        gender,
        image,
        locations,
      ];
}
