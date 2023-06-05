import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:languagex/core/models/response_data.dart';

@jsonSerializable
class ResponseValidLink extends ResponseData {
  ResponseValidLink({
    required this.responseIsValidLink,
    required super.isSuccess,
    super.errorCode,
    super.errorMessage,
    super.transactionCode,
  });

  @JsonProperty(name: 'Response')
  final ResponseIsValidLink? responseIsValidLink;
}

@jsonSerializable
class ResponseIsValidLink {
  @JsonProperty(name: 'IsActive')
  final bool isActive;

  ResponseIsValidLink({required this.isActive});
}
