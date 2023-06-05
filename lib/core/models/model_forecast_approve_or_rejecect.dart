import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class ModelForecastApproveOrReject {
  @JsonProperty(name: 'ApproverMessage')
  final String? approverMessage;

  @JsonProperty(name: 'ForecastId')
  final int forecastId;

  @JsonProperty(name: 'Id')
  final int id;

  @JsonProperty(name: 'IsApproved')
  final bool isApproved;

  @JsonProperty(name: 'ProjectId')
  final int projectId;

  @JsonProperty(name: 'TimePeriod')
  final int timePeriod;

  ModelForecastApproveOrReject(
    this.approverMessage, {
    required this.forecastId,
    required this.id,
    required this.isApproved,
    required this.projectId,
    required this.timePeriod,
  });
}
