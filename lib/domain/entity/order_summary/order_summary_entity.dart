import 'package:car_care/domain/entity/order_summary/order_summary_service.dart';
import 'package:equatable/equatable.dart';
import 'order_summary_workshop_entity.dart';

class OrderSummaryEntity extends Equatable {
  final int id;
  final String createdAt;
  final String updatedAt;
  final int orderNumber;
  final String type;
  final String? reservationDate;
  final double totalPrice;
  final int totalAstimatedTime;
  final String totalAstimatedTimeType;
  final String status;
  final String statusAr;
  final int clientId;
  final OrderSummaryWorkshopEntity workshop;
  final List<OrderSummaryService> services;
  final double tax;
  final bool carDeleted;
  final bool isReviewed;
  final String? car;

  const OrderSummaryEntity({
    this.car,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.orderNumber,
    required this.type,
    this.reservationDate,
    required this.totalPrice,
    required this.totalAstimatedTime,
    required this.totalAstimatedTimeType,
    required this.status,
    required this.statusAr,
    required this.clientId,
    required this.workshop,
    required this.services,
    required this.tax,
    required this.carDeleted,
    required this.isReviewed,
  });

  @override
  List<Object?> get props => [
        id,
        createdAt,
        updatedAt,
        orderNumber,
        type,
        reservationDate,
        totalPrice,
        totalAstimatedTime,
        totalAstimatedTimeType,
        status,
        statusAr,
        clientId,
        workshop,
        services,
        tax,
        carDeleted,
        isReviewed,
      ];
  factory OrderSummaryEntity.fromJson(Map<String, dynamic> json) {
    return OrderSummaryEntity(
      id: json['id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      orderNumber: json['order_number'],
      type: json['type'],
      reservationDate: json['reservation_date'],
      totalPrice: json['total_price'].toDouble(),
      totalAstimatedTime: json['total_astimated_time'],
      totalAstimatedTimeType: json['total_astimated_time_type'],
      status: json['status'],
      statusAr: json['status_ar'],
      clientId: json['client_id'],
      workshop: OrderSummaryWorkshopEntity.fromJson(json['workshop']),
      services: (json['services'] as List)
          .map((serviceJson) => OrderSummaryService.fromJson(serviceJson))
          .toList(),
      tax: json['tax'].toDouble(),
      carDeleted: json['car_deleted'],
      isReviewed: json['is_reviewed'] == 1,
      car: json['car'],
    );
  }
}
