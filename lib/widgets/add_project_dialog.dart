
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/providers/project_provider.dart';
import '../models/project.dart';

class AddProjectDialog extends StatefulWidget {
  final Function(Project) onAdd;

  AddProjectDialog({required this.onAdd});

  @override 
  _AddProjectDialogState createState() => _AddProjectDialogState();

}

class _AddProjectDialogState extends State<AddProjectDialog> {
  final TextEditingController _controller = TextEditingController();

  @override 
  Widget build(BuildContext contex) {
    return AlertDialog(
      title: Text('Add new Project'),
      content: TextField(
        controller: _controller,
        decoration: InputDecoration(
          hintText: 'Enter Project name:',
          labelText: 'Project Name'),
      ),
      actions: [
        TextButton(
          onPressed: () {
            if(_controller.text.isNotEmpty){
              var newProject = Project(id: DateTime.now().toString(), name: _controller.text);
              widget.onAdd(newProject);
              Provider.of<ProjectProvider>(context, listen:false).addProject(newProject);
              _controller.clear();
              Navigator.of(contex).pop();
            }
          }, 
          child: Text('Add')
        )
      ],
    );
  }


  @override 
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

}