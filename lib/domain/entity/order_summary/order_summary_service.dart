import 'package:equatable/equatable.dart';

class OrderSummaryService with EquatableMixin {
  String? enName;
  String? arName;
  String? type;
  int? price;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? estimatedTime;
  String? estimatedTimeType;

  OrderSummaryService({
    this.enName,
    this.arName,
    this.type,
    this.price,
    this.createdAt,
    this.updatedAt,
    this.estimatedTime,
    this.estimatedTimeType,
  });

  @override
  List<Object?> get props => [
        enName,
        arName,
        type,
        price,
        createdAt,
        updatedAt,
        estimatedTime,
        estimatedTimeType,
      ];

  factory OrderSummaryService.fromJson(Map<String, dynamic> json) {
    return OrderSummaryService(
      enName: json['en_name'],
      arName: json['ar_name'],
      type: json['type'],
      price: json['price'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      estimatedTime: json['astimated_time'],
      estimatedTimeType: json['astimated_time_type'],
    );
  }
}

class Pivot with EquatableMixin {
  int? workShopId;
  int? serviceId;
  int? price;
  int? astimatedTime;
  String? astimatedTimeType;
  String? requiredBrands;

  Pivot({
    this.workShopId,
    this.serviceId,
    this.price,
    this.astimatedTime,
    this.astimatedTimeType,
    this.requiredBrands,
  });

  @override
  List<Object?> get props => [
        workShopId,
        serviceId,
        price,
        astimatedTime,
        astimatedTimeType,
        requiredBrands
      ];

  factory Pivot.fromJson(Map<String, dynamic> json) {
    return Pivot(
      workShopId: json['work_shop_id'] as int?,
      serviceId: json['service_id'] as int?,
      price: json['price'] as int?,
      astimatedTime: json['astimated_time'] as int?,
      astimatedTimeType: json['astimated_time_type'] as String?,
      requiredBrands: json['required_brands'] as Null,
    );
  }
}
