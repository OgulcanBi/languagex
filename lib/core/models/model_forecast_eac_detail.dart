import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class ModelForeCastEacDetail {
  @JsonProperty(name: 'ForecastId')
  final int forecastId;

  @JsonProperty(name: 'Id')
  final int id;

  @JsonProperty(name: 'ODEYear')
  final int odeYear;

  @JsonProperty(name: 'ProjectId')
  final int projectId;

  ModelForeCastEacDetail({
    required this.forecastId,
    required this.id,
    required this.odeYear,
    required this.projectId,
  });
}
