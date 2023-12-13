import 'package:flutter/material.dart';
import 'package:itu_cartrack/src/view/user_view.dart';
import 'package:itu_cartrack/src/view/car_view.dart';
import 'package:itu_cartrack/src/controller/user_controller.dart';
import 'package:itu_cartrack/src/controller/car_controller.dart';

class TabManager extends StatefulWidget {
  final UserController userController;
  final CarController carController;

  TabManager(this.userController, this.carController);

  @override
  _TabManagerState createState() => _TabManagerState();
}

class _TabManagerState extends State<TabManager> with SingleTickerProviderStateMixin {
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
        title: Text('Tab Views'),
        bottom: TabBar(
          controller: _tabController,
          tabs: <Widget>[
            Tab(text: 'Users'),
            Tab(text: 'Cars'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          UserView(widget.userController),
          CarView(widget.carController),
        ],
      ),
    );
  }
}