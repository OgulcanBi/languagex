import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:languagex/core/models/Base_response.dart';

@jsonSerializable
class ChatgptResponse extends BaseResponse{
  ChatgptResponse({
    required this.id,
    required this.object,
    required this.created,
    required this.model,
    required this.usage,
    required this.choices,
    required super.error,
  });

  @JsonProperty(name: 'id')
  final String? id;
  @JsonProperty(name: 'object')
  final String? object;
  @JsonProperty(name: 'created')
  final num? created;
  @JsonProperty(name: 'model')
  final String? model;
  @JsonProperty(name: 'usage')
  final Usage? usage;
  @JsonProperty(name: 'choices')
  List<Choices>? choices;


}

@jsonSerializable
class Choices {
  Choices({
    required this.message,
    required this.finishReason,
    required this.index,
  });

  @JsonProperty(name: 'message')
  final Message? message;
  @JsonProperty(name: 'finishReason')
  final String? finishReason;
  @JsonProperty(name: 'index')
  final num? index;
}

@jsonSerializable
class Message {
  Message({
    required this.role,
    required this.content,
  });

  @JsonProperty(name: 'role')
  final String? role;
  @JsonProperty(name: 'content')
  final String? content;
}

@jsonSerializable
class Usage {
  Usage({
    required this.promptTokens,
    required this.completionTokens,
    required this.totalTokens,
  });

  @JsonProperty(name: 'promptTokens')
  final num? promptTokens;
  @JsonProperty(name: 'completionTokens')
  final num? completionTokens;
  @JsonProperty(name: 'totalTokens')
  final num? totalTokens;
}
