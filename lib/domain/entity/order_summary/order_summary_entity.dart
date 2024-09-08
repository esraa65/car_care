import 'package:equatable/equatable.dart';

import 'order_summary_discount_service.dart';
import 'order_summary_service.dart';

class OrderSummaryEntity with EquatableMixin {
  final List<OrderSummaryService>? services;
  final bool? hasPromoCode;
  final int? originalPrice;
  final int? totalPrice;
  final List<dynamic>? products;
  final OrderSummaryDiscountService? discountedService;
  final String? discountType;

  OrderSummaryEntity({
    this.hasPromoCode,
    this.products,
    this.discountedService,
    this.discountType,
    this.services,
    this.originalPrice,
    this.totalPrice,
  });

  @override
  List<Object?> get props => [
        services,
        hasPromoCode,
        originalPrice,
        totalPrice,
        products,
        discountedService,
        discountType,
      ];

  factory OrderSummaryEntity.fromJson(Map<String, dynamic> json) {
    return OrderSummaryEntity(
      services: (json['services'] as List)
          .map((service) => OrderSummaryService.fromJson(service))
          .toList(),
      hasPromoCode: json['has_promocode'],
      originalPrice: json['original_price'],
      totalPrice: json['total_price'],
      products: json['products'] ?? [],
      discountedService: json['discounted_service'] == null
          ? null
          : OrderSummaryDiscountService.fromJson(
              json['discounted_service'] as Map<String, dynamic>),
      discountType: json['discount_type'],
    );
  }
}
