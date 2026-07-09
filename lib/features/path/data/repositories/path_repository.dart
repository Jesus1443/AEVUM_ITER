import 'package:flutter/material.dart';

import '../../domain/entities/path_node.dart';
import '../../domain/enums/node_status.dart';

class PathRepository {
  const PathRepository();

  List<PathNode> getNodes() {
    return const [
      PathNode(
        id: 'block_1',
        title: 'Bloque 1',
        description: '',
        icon: Icons.menu_book_rounded,
        status: NodeStatus.available,
      ),
      PathNode(
        id: 'block_2',
        title: 'Bloque 2',
        description: '',
        icon: Icons.psychology_rounded,
        status: NodeStatus.locked,
      ),
      PathNode(
        id: 'block_3',
        title: 'Bloque 3',
        description: '',
        icon: Icons.manage_search_rounded,
        status: NodeStatus.locked,
      ),
      PathNode(
        id: 'block_4',
        title: 'Bloque 4',
        description: '',
        icon: Icons.lightbulb_rounded,
        status: NodeStatus.locked,
      ),
      PathNode(
        id: 'block_5',
        title: 'Bloque 5',
        description: '',
        icon: Icons.explore_rounded,
        status: NodeStatus.locked,
      ),
      PathNode(
        id: 'block_6',
        title: 'Bloque 6',
        description: '',
        icon: Icons.flag_rounded,
        status: NodeStatus.locked,
      ),
      PathNode(
        id: 'result',
        title: 'Resultado',
        description: '',
        icon: Icons.workspace_premium_rounded,
        status: NodeStatus.locked,
      ),
    ];
  }
}