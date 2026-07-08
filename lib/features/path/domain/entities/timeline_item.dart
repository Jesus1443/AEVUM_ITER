import '../enums/timeline_alignment.dart';
import 'path_node.dart';

class TimelineItem {
  const TimelineItem({
    required this.node,
    required this.alignment,
  });

  final PathNode node;
  final TimelineAlignment alignment;
}