abstract class OrderSummarySource {
  Future<Map<String, dynamic>> orderSummary({
    required String workshopId,
    required String reservationDate,
    required String type,
    required String serviceIds,
    String promoCode,
    String carId,
  });
}
