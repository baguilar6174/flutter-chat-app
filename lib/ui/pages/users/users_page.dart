import 'package:chat_app/data/services/client_service.dart';
import 'package:chat_app/data/services/socket_service.dart';
import 'package:chat_app/domain/entities/user_mode.dart';
import 'package:chat_app/ui/pages/users/widgets/user_listtile_widget.dart';
import 'package:chat_app/utils/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UsersPage extends StatefulWidget {
  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  
  RefreshController _refreshController = RefreshController(initialRefresh: false);
  List<User> _users = [];

  @override
  void initState() {
    this._loadUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final socketService = Provider.of<SocketService>(context);

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
            child: socketService.serverStatus == ServerStatus.Offline
                ? Icon(
                    Icons.offline_bolt,
                    color: Colors.redAccent,
                  )
                : Icon(
                    Icons.check_circle,
                    color: Colors.blue[300],
                  ),
          ),
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
      itemBuilder: (context, i) => UserListTile(user: _users[i]),
      separatorBuilder: (context, i) => Divider(),
      itemCount: this._users.length,
    );
  }

  _loadUsers() async {
    // monitor network fetch
    this._users = await ClientService.instance.getUsers();
    setState(() {
      
    });
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _showDialog() {
    
    final socketService = Provider.of<SocketService>(context, listen: false);
    
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
            onPressed: () {
              UserPreferences.instance.logOut(context);
              socketService.disconnect();
            }
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
