import 'package:flutter/material.dart';

import '../enums/node_status.dart';

class PathNode {
  const PathNode({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.status,
  });

  final String id;
  final String title;
  final String description;
  final IconData icon;
  final NodeStatus status;

  PathNode copyWith({
    String? id,
    String? title,
    String? description,
    IconData? icon,
    NodeStatus? status,
  }) {
    return PathNode(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      icon: icon ?? this.icon,
      status: status ?? this.status,
    );
  }
}