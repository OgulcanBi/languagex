import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class ModelForecastApproval {
  @JsonProperty(name: 'ProjectId')
  int projectId;

  @JsonProperty(name: 'SearchFilter')
  bool searchFilter;

  @JsonProperty(name: 'TimePeriod')
  int timePeriod;

  ModelForecastApproval({
    required this.projectId,
    required this.searchFilter,
    required this.timePeriod,
  });

}
