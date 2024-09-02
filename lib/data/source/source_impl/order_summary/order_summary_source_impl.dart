import '../../../../core/constants/end_point.dart';
import '../../../../core/network/dio/base_dio.dart';
import '../../source_base/order_summary/order_summary_source.dart';

class OrderSummarySourceImpl implements OrderSummarySource {
  final BaseDio dio;

  OrderSummarySourceImpl(this.dio);
  @override
  Future<Map<String, dynamic>> orderSummary() async {
    try {
      final response = await dio.get(
        EndPoint.orderSummary,
      );

      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
