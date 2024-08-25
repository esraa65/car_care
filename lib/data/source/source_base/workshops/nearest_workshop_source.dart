abstract class NearestWorkshopSource {
  Future<Map<String, dynamic>> nearestWorkshops({
    required String latitude,
    required String longitude,
    required String carId,
    required String serviceId,
    required String type,
  });
}
