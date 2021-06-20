import 'package:chat_app/domain/entities/user_mode.dart';
import 'package:chat_app/ui/pages/users/widgets/user_listtile_widget.dart';
import 'package:chat_app/utils/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UsersPage extends StatefulWidget {
  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  
  RefreshController _refreshController = RefreshController(initialRefresh: false);

  final users = [
    User(online: true, email: 'bryan@tes.com', name: 'Bryan', code: '1'),
    User(
        online: false,
        email: 'alexander@tes.com',
        name: 'Alexander',
        code: '2'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chat App',
          style: TextStyle(color: Colors.black54),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.exit_to_app,
            color: Colors.black54,
          ),
          onPressed: _showDialog,
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.check_circle,
              color: Colors.blue[400],
            ),
          )
        ],
      ),
      body: SmartRefresher(
        controller: _refreshController,
        child: _listViewUsers(),
        enablePullDown: true,
        onRefresh: _loadUsers,
      ),
    );
  }

  ListView _listViewUsers() {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, i) => UserListTile(user: users[i]),
      separatorBuilder: (context, i) => Divider(),
      itemCount: this.users.length,
    );
  }

  _loadUsers() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 2000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('¿Seguro quieres finalizar tu sesión?'),
        actions: [
          TextButton(
            child: Text(
              'Finalizar',
              style: TextStyle(
                color: Theme.of(context).accentColor,
              ),
            ),
            onPressed: () => UserPreferences.instance.logOut(context),
          ),
          TextButton(
            child: Text(
              'Cancelar',
              style: TextStyle(
                color: Theme.of(context).accentColor,
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
