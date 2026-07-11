import 'package:flutter/material.dart';

import '../../domain/entities/path_node.dart';
import '../../domain/enums/node_status.dart';

class PathRepository {
  const PathRepository();

  List<PathNode> getNodes() {
    return const [
      PathNode(
        id: 'realistic',
        title: 'Realista',
        description: '',
        icon: Icons.build_rounded,
        status: NodeStatus.available,
      ),
      PathNode(
        id: 'investigative',
        title: 'Investigador',
        description: '',
        icon: Icons.science_rounded,
        status: NodeStatus.locked,
      ),
      PathNode(
        id: 'artistic',
        title: 'Artístico',
        description: '',
        icon: Icons.palette_rounded,
        status: NodeStatus.locked,
      ),
      PathNode(
        id: 'social',
        title: 'Social',
        description: '',
        icon: Icons.groups_rounded,
        status: NodeStatus.locked,
      ),
      PathNode(
        id: 'enterprising',
        title: 'Emprendedor',
        description: '',
        icon: Icons.trending_up_rounded,
        status: NodeStatus.locked,
      ),
      PathNode(
        id: 'conventional',
        title: 'Convencional',
        description: '',
        icon: Icons.fact_check_rounded,
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