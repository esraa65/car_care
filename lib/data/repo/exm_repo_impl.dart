 import 'package:car_care/data/source/source_base/exm_source.dart';

import '../../domain/repo/exm_repo.dart';

class ExmRepoImpl implements ExmRepo{
  final ExmSource exmSource;
  ExmRepoImpl({required this.exmSource});
  @override
  Future<Map<String, dynamic>> example() {
    // TODO: implement example
    throw UnimplementedError();
  }
}