import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class ModelTab {
  final String title;
  final String activeIcon;
  final String inActiveIcon;

  const ModelTab({
    required this.title,
    required this.activeIcon,
    required this.inActiveIcon,
  });
}
