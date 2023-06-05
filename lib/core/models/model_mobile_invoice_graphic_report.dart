import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:languagex/core/models/response_data.dart';

@jsonSerializable
class ResponseMobileInvoiceGraphicReport extends ResponseData {
  ResponseMobileInvoiceGraphicReport({
    required this.result,
    required super.isSuccess,
    super.errorCode,
    super.errorMessage,
    super.transactionCode,
  });

  @JsonProperty(name: 'Response')
  final ModelMobileInvoiceGraphicReportResponse? result;
}

@jsonSerializable
class ModelBilling {
  @JsonProperty(name: 'Headers')
  final List<String> headers;

  @JsonProperty(name: 'BgColors')
  final List<String> bgColors;

  @JsonProperty(name: 'Value')
  final List<num> value;

  ModelBilling({
    required this.headers,
    required this.bgColors,
    required this.value,
  });
}

@jsonSerializable
class ModelCollection {
  @JsonProperty(name: 'Headers')
  final List<String> headers;

  @JsonProperty(name: 'BgColors')
  final List<String> bgColors;

  @JsonProperty(name: 'Value')
  final List<num> value;

  ModelCollection({
    required this.headers,
    required this.bgColors,
    required this.value,
  });
}

@jsonSerializable
class ModelMobileInvoiceGraphicReportResponse {
  @JsonProperty(name: 'Billing')
  final ModelBilling billing;

  @JsonProperty(name: 'Collection')
  final ModelCollection collection;

  @JsonProperty(name: 'SelectedProjectCount')
  final int selectedProjectCount;

  ModelMobileInvoiceGraphicReportResponse({
    required this.billing,
    required this.collection,
    required this.selectedProjectCount,
  });
}
