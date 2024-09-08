import 'package:equatable/equatable.dart';

class ReserveWorkshopWorkshopEntity with EquatableMixin {
  final int id;
  final String name;
  final String address;
  final String geoLat;
  final String geoLng;

  const ReserveWorkshopWorkshopEntity({
    required this.id,
    required this.name,
    required this.address,
    required this.geoLat,
    required this.geoLng,
  });

  factory ReserveWorkshopWorkshopEntity.fromJson(Map<String, dynamic> json) {
    return ReserveWorkshopWorkshopEntity(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      geoLat: json['geo_lat'],
      geoLng: json['geo_lng'],
    );
  }

  @override
  List<Object> get props => [
        id,
        name,
        address,
        geoLat,
        geoLng,
      ];
}
