import 'package:equatable/equatable.dart';
import 'reserve_work_shop_service_entity.dart';
import 'reserve_workshop_workshop_entity.dart';
import 'reserve_worksop_products_entity.dart';

class ReserveWorkShopEntity with EquatableMixin {
  final int orderId;
  final String status;
  final int clientId;
  final String reservationType;
  final String? reservationDate;
  final double? originalPrice;
  final double totalPrice;
  final bool hasPromocode;
  final String estimatedFinishTime;
  final List<ReserveWorkShopServiceEntity> services;
  final ReserveWorkshopWorkshopEntity workshop;
  final List<ReserveWorksopProductsEntity> products;

  const ReserveWorkShopEntity({
    required this.orderId,
    required this.status,
    required this.clientId,
    required this.reservationType,
    this.reservationDate,
    this.originalPrice,
    required this.totalPrice,
    required this.hasPromocode,
    required this.estimatedFinishTime,
    required this.services,
    required this.workshop,
    required this.products,
  });

  factory ReserveWorkShopEntity.fromJson(Map<String, dynamic> json) {
    return ReserveWorkShopEntity(
      orderId: json['order_id'],
      status: json['status'],
      clientId: json['client_id'],
      reservationType: json['reservation_type'],
      reservationDate: json['reservation_date'],
      originalPrice: json['original_price']?.toDouble(),
      totalPrice: json['total_price'].toDouble(),
      hasPromocode: json['has_promocode'],
      estimatedFinishTime: json['estimated_finish_time'],
      services: List<ReserveWorkShopServiceEntity>.from(json['services']
          .map((x) => ReserveWorkShopServiceEntity.fromJson(x))),
      workshop: ReserveWorkshopWorkshopEntity.fromJson(json['workshop']),
      products: List<ReserveWorksopProductsEntity>.from(json['products']
          .map((x) => ReserveWorksopProductsEntity.fromJson(x))),
    );
  }

  @override
  List<Object?> get props => [
        orderId,
        status,
        clientId,
        reservationType,
        reservationDate,
        originalPrice,
        totalPrice,
        hasPromocode,
        estimatedFinishTime,
        services,
        workshop,
        products,
      ];
}
