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
        description: 'Preguntas 1 - 5',
        icon: Icons.menu_book_rounded,
        status: NodeStatus.available,
      ),
      PathNode(
        id: 'block_2',
        title: 'Bloque 2',
        description: 'Preguntas 6 - 10',
        icon: Icons.psychology_rounded,
        status: NodeStatus.locked,
      ),
      PathNode(
        id: 'block_3',
        title: 'Bloque 3',
        description: 'Preguntas 11 - 15',
        icon: Icons.manage_search_rounded,
        status: NodeStatus.locked,
      ),
      PathNode(
        id: 'block_4',
        title: 'Bloque 4',
        description: 'Preguntas 16 - 20',
        icon: Icons.lightbulb_rounded,
        status: NodeStatus.locked,
      ),
      PathNode(
        id: 'block_5',
        title: 'Bloque 5',
        description: 'Preguntas 21 - 25',
        icon: Icons.explore_rounded,
        status: NodeStatus.locked,
      ),
      PathNode(
        id: 'block_6',
        title: 'Bloque 6',
        description: 'Preguntas 26 - 30',
        icon: Icons.flag_rounded,
        status: NodeStatus.locked,
      ),
      PathNode(
        id: 'result',
        title: 'Resultado',
        description: 'Al finalizar las 30 preguntas',
        icon: Icons.workspace_premium_rounded,
        status: NodeStatus.locked,
      ),
    ];
  }
}