import 'package:flutter/material.dart';

import '../../domain/entities/path_node.dart';
import '../../domain/enums/node_status.dart';

class PathRepository {
  const PathRepository();

  List<PathNode> getNodes() {
    return const [
      PathNode(
        id: 'start',
        title: 'Inicio',
        description: 'Comienza tu test vocacional.',
        icon: Icons.flag_rounded,
        status: NodeStatus.available,
      ),
      PathNode(
        id: 'block_1',
        title: 'Bloque 1',
        description: 'Preguntas 1 - 5',
        icon: Icons.looks_one_rounded,
        status: NodeStatus.locked,
      ),
      PathNode(
        id: 'block_2',
        title: 'Bloque 2',
        description: 'Preguntas 6 - 10',
        icon: Icons.looks_two_rounded,
        status: NodeStatus.locked,
      ),
      PathNode(
        id: 'block_3',
        title: 'Bloque 3',
        description: 'Preguntas 11 - 15',
        icon: Icons.looks_3_rounded,
        status: NodeStatus.locked,
      ),
      PathNode(
        id: 'block_4',
        title: 'Bloque 4',
        description: 'Preguntas 16 - 20',
        icon: Icons.looks_4_rounded,
        status: NodeStatus.locked,
      ),
      PathNode(
        id: 'block_5',
        title: 'Bloque 5',
        description: 'Preguntas 21 - 25',
        icon: Icons.looks_5_rounded,
        status: NodeStatus.locked,
      ),
      PathNode(
        id: 'block_6',
        title: 'Bloque 6',
        description: 'Preguntas 26 - 30',
        icon: Icons.looks_6_rounded,
        status: NodeStatus.locked,
      ),
      PathNode(
        id: 'result',
        title: 'Resultado',
        description: 'Descubre tu perfil vocacional.',
        icon: Icons.emoji_events_rounded,
        status: NodeStatus.locked,
      ),
    ];
  }
}