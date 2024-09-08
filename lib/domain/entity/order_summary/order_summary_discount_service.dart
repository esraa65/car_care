import 'package:equatable/equatable.dart';

class OrderSummaryDiscountService with EquatableMixin {
  final int id;
  final String enName;
  final String arName;
  final int originalPrice;
  final int priceAfterDiscount;

  const OrderSummaryDiscountService({
    required this.id,
    required this.enName,
    required this.arName,
    required this.originalPrice,
    required this.priceAfterDiscount,
  });

  @override
  List<Object?> get props => [
        id,
        enName,
        arName,
        originalPrice,
        priceAfterDiscount,
      ];

  factory OrderSummaryDiscountService.fromJson(Map<String, dynamic> json) {
    return OrderSummaryDiscountService(
      id: json['id'],
      enName: json['en_name'],
      arName: json['ar_name'],
      originalPrice: json['original_price'],
      priceAfterDiscount: json['price_after_discount'],
    );
  }
}
