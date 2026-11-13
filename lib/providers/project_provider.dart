
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import '../models/project.dart';
import '../models/task.dart';
import '../models/time_entry.dart';

class ProjectProvider with ChangeNotifier {
  final LocalStorage storage;

  List <Project> _projects = [];
  
  //Recolectores (Getters)
  List<Project> get projects => _projects;

  ProjectProvider(this.storage) {
    //Cargar datos de la base de datos
    _loadProjectsFromStorage();
  }
  
  void _loadProjectsFromStorage() {
    var storedProjects = storage.getItem('projects');
    if (storedProjects != null) {
      final List<dynamic> decoded = jsonDecode(storedProjects as String);
      _projects = decoded
          .map((item) => Project.fromJson(Map<String, dynamic>.from(item)))
          .toList();
      notifyListeners();
    }
  }
}
