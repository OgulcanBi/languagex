import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class ChatgptModel {
  ChatgptModel({
    required this.model,
    required this.messages,
  });

  @JsonProperty(name: 'model')
  final String? model;
  @JsonProperty(name: 'messages')
  final List<Messages>? messages;
}

@jsonSerializable
class Messages {
  Messages({required this.role, required this.content});
  @JsonProperty(name: 'role')
  final String role;
  @JsonProperty(name: 'content')
  final String content;


}