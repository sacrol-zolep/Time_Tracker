// Home app screen

import 'package:flutter/material.dart';
import '../screens/project_management_screen.dart';
import '../screens/time_entry_screen.dart';

class HomeScreen extends StatefulWidget{
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Time Tracking"),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white70,
          tabs: [
            Tab(text: "All entries"),
            Tab(text: "Grouped by Projects"),
          ],
        ),
      ),
      drawer: _buildDrawer(context),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildTasks(context),
          _buildTasks(context),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: () => Navigator.push( context,
          MaterialPageRoute(builder: (context) => AddTimeEntryScreen())),
        tooltip: 'Add Time entry',
        child: Icon(Icons.add),
        ),
    );
  }


  Widget _buildTasks(BuildContext context) {
    return Center(
      child: Text("Tasks screen coming soon...",
          style: TextStyle(color: Colors.grey[600], fontSize: 18)),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.teal),
            child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
          ),
          ListTile(
            leading:  Icon(Icons.folder, color: Colors.teal),
            title: Text('Projects'),
            onTap: (){
              Navigator.pop(context);
              Navigator.pushNamed(context, '/manage_projects');
            },
          ),
          ListTile(
            leading:  Icon(Icons.task, color: Colors.teal),
            title: Text('Tasks'),
          ),
        ],
      ),
    );
  }

}