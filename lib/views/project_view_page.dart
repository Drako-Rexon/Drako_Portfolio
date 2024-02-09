import 'package:flutter/material.dart';
import 'package:portfolio_drako/domain/models/project_model.dart';

class ProjectPage extends StatefulWidget {
  final project;

  const ProjectPage({
    super.key,
    required ProjectModel this.project,
  });

  @override
  State<ProjectPage> createState() => _ProjectPageState(project: project);
}

class _ProjectPageState extends State<ProjectPage> {
  final project;
  _ProjectPageState({required ProjectModel this.project});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Text(project.toString())],
      ),
    );
  }
}
