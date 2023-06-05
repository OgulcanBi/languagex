import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:languagex/core/models/response_data.dart';

@jsonSerializable
class ResponseExpensePdf extends ResponseData {
  ResponseExpensePdf({
    this.result,
    required super.isSuccess,
    super.errorCode,
    super.errorMessage,
    super.transactionCode,
  });

  @JsonProperty(name: 'Response')
  final ModelExpensePdf? result;
}

@jsonSerializable
class ModelExpensePdf {
  @JsonProperty(name: 'FileContents')
  final String fileContents;

  @JsonProperty(name: 'ContentType')
  final String? contentType;

  @JsonProperty(name: 'FileDownloadName')
  final String? fileDownloadName;

  @JsonProperty(name: 'LastModified')
  final String? lastModified;

  @JsonProperty(name: 'EntityTag')
  final String? entityTag;

  @JsonProperty(name: 'EnableRangeProcessing')
  final bool? enableRangeProcessing;

  ModelExpensePdf({required this.fileContents, this.contentType, this.fileDownloadName, this.lastModified, this.enableRangeProcessing, this.entityTag});
}
