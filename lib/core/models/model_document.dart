import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class ModelDocument {
  @JsonProperty(name: 'DocumentId')
  final int documentId;

  @JsonProperty(name: 'Document')
  final String document;

  @JsonProperty(name: 'DocumentName')
  final String documentName;

  ModelDocument({
    required this.documentId,
    required this.document,
    required this.documentName,
  });
}
