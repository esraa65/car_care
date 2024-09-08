import 'package:equatable/equatable.dart';

class ReserveWorkShopServiceEntity with EquatableMixin {
  final int id;
  final String name;
  final String description;
  final double price;
  final String estimatedTime;

  const ReserveWorkShopServiceEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.estimatedTime,
  });

  factory ReserveWorkShopServiceEntity.fromJson(Map<String, dynamic> json) {
    return ReserveWorkShopServiceEntity(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'].toDouble(),
      estimatedTime: json['estimated_time'],
    );
  }

  @override
  List<Object> get props => [
        id,
        name,
        description,
        price,
        estimatedTime,
      ];
}
