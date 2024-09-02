import 'package:equatable/equatable.dart';

class OrderSummaryService with EquatableMixin {
  final int id;
  final String? createdAt;
  final String? updatedAt;
  final String type;
  final int isMainService;
  final int requireCarBrand;
  final String enName;
  final String enDescription;
  final String arName;
  final String arDescription;
  final int isActive;
  final int? parentId;
  final int hasProducts;
  final int? categoryId;
  final Pivot pivot;

  const OrderSummaryService({
    required this.id,
    this.createdAt,
    this.updatedAt,
    required this.type,
    required this.isMainService,
    required this.requireCarBrand,
    required this.enName,
    required this.enDescription,
    required this.arName,
    required this.arDescription,
    required this.isActive,
    this.parentId,
    required this.hasProducts,
    this.categoryId,
    required this.pivot,
  });

  @override
  List<Object?> get props => [
        id,
        createdAt,
        updatedAt,
        type,
        isMainService,
        requireCarBrand,
        enName,
        enDescription,
        arName,
        arDescription,
        isActive,
        parentId,
        hasProducts,
        categoryId,
        pivot,
      ];
  factory OrderSummaryService.fromJson(Map<String, dynamic> json) {
    return OrderSummaryService(
      id: json['id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      type: json['type'],
      isMainService: json['is_main_service'],
      requireCarBrand: json['require_car_brand'],
      enName: json['en_name'],
      enDescription: json['en_description'],
      arName: json['ar_name'],
      arDescription: json['ar_description'],
      isActive: json['is_active'],
      parentId: json['parent_id'],
      hasProducts: json['has_products'],
      categoryId: json['category_id'],
      pivot: Pivot.fromJson(json['pivot']),
    );
  }
}

class Pivot extends Equatable {
  final int orderId;
  final int serviceId;
  final String status;
  final double price;
  final int astimatedTime;
  final String astimatedTimeType;

  const Pivot({
    required this.orderId,
    required this.serviceId,
    required this.status,
    required this.price,
    required this.astimatedTime,
    required this.astimatedTimeType,
  });

  @override
  List<Object?> get props => [
        orderId,
        serviceId,
        status,
        price,
        astimatedTime,
        astimatedTimeType,
      ];
  factory Pivot.fromJson(Map<String, dynamic> json) {
    return Pivot(
      orderId: json['order_id'],
      serviceId: json['service_id'],
      status: json['status'],
      price: json['price'].toDouble(),
      astimatedTime: json['astimated_time'],
      astimatedTimeType: json['astimated_time_type'],
    );
  }
}
