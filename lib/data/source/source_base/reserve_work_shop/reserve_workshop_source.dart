abstract class ReserveWorkshopSource {
  Future<Map<String, dynamic>> reserveWorkshop({
    required String workshopid,
    required String serviceId,
    required String type,
    required String paymentType,
  });
}
