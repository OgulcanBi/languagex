import 'package:dart_json_mapper/dart_json_mapper.dart';


@jsonSerializable
class ModelId {
  @JsonProperty(name: 'Id')
  final int id;


  ModelId({
    required this.id,
  });
}
