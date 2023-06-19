import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class BaseResponse {
  BaseResponse({
    this.error,
  });

  @JsonProperty(name: 'error')
  final Error? error;
}

@jsonSerializable
class Error {
  Error({
    required this.message,
    required this.type,
    this.param,
    required this.code,
  });

  @JsonProperty(name: 'message')
  final String? message;
  @JsonProperty(name: 'type')
  final String? type;
  @JsonProperty(name: 'param')
  final dynamic? param;
  @JsonProperty(name: 'code')
  final String? code;
}
