
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import '../models/project.dart';
import '../models/task.dart';
import '../models/time_entry.dart';

class ProjectProvider with ChangeNotifier {
  final LocalStorage storage;

  List <Project> _projects = [];
}
