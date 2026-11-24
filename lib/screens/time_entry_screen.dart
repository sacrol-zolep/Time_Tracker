import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/models/time_entry.dart';

class AddTimeEntryScreen extends StatefulWidget{
  final TimeEntry? initialTimeEntry;

  const AddTimeEntryScreen({Key? key, this.initialTimeEntry}):super(key:key);

  @override 
  _AddTimeEntryScreenState createState() => _AddTimeEntryScreenState();
}

class _AddTimeEntryScreenState extends State<AddTimeEntryScreen>{
  late TextEditingController _noteController;
  late TextEditingController _totaltimeController;
  
  String? _selectedProjectId;
  String? _selectedTaskId;

  @override 
  void initState() {
    super.initState();
  }

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}