
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import '../models/project.dart';

class ProjectProvider with ChangeNotifier {
  final LocalStorage storage;

  List <Project> _projects = [];
  
  //Recolectores (Getters)
  List<Project> get projects => _projects;

  ProjectProvider(this.storage) {
    //Cargar datos de la base de datos
    _loadProjectsFromStorage();
  }

  void _loadProjectsFromStorage(){
    var storedProjects = storage.getItem('projects');
    if(storedProjects != null) {
      final List<dynamic> decoded = jsonDecode(storedProjects);
      _projects = decoded.map((item) => Project.fromJson(Map<String, dynamic>.from(item)))
      .toList();
      notifyListeners();
    }
  }

  void _saveProjectToStorage(){
    storage.setItem(
      'projects', 
      jsonEncode(_projects.map((e)=> e.toJson()).toList()),
      );
  }

  void addProject(Project project){
    int index = _projects.indexWhere((p) => p.id == project.id);

    if (index != -1) {
      _projects[index] = project;
    } else {
      _projects.add(project);
    }

    _saveProjectToStorage();
    notifyListeners();
  }

  void deleteProject(String id) {
    _projects.removeWhere((p) => p.id == id);
    notifyListeners();
  }

}
