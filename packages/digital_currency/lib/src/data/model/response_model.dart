import 'package:digital_currency/src/data/model/model.dart';
import 'package:digital_currency/src/domain/entities/entities.dart';

/// facade for data
class ResponseModel extends ResponseEntity {
  /// data may changed easily
  ResponseModel({
    required final DataModel dataModel,
  }) : super(
          dataEntityList: [dataModel],
        );

  ///
  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        dataModel: DataModel.fromJson(
          json['data'] as Map<String, dynamic>,
        ),
      );
}
