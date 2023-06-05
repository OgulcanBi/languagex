import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class ResponseData {
  @JsonProperty(name: 'IsSucceed')
  final bool isSuccess;

  @JsonProperty(name: 'ErrorCode')
  final String? errorCode;

  @JsonProperty(name: 'ErrorMessage')
  final String? errorMessage;

  @JsonProperty(name: 'TransactionCode')
  final String? transactionCode;

  ResponseData({
    required this.isSuccess,
    this.errorCode,
    this.errorMessage,
    this.transactionCode,
  });
}
