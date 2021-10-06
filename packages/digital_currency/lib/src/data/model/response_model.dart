import 'package:digital_currency/src/data/model/model.dart';
import 'package:digital_currency/src/domain/entities/entities.dart';

/// Facade for data
class ResponseModel extends ResponseEntity {
  /// Data may changed easily
  ResponseModel({
    required final DataModel dataModel,
  }) : super(
          dataEntityList: [dataModel],
        );

  /// Interface to create ResponseModel object
  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        dataModel: DataModel.fromJson(
          json['data'] as Map<String, dynamic>,
        ),
      );
}
