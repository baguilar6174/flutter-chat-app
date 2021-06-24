import 'package:chat_app/data/services/client_service.dart';
import 'package:chat_app/data/services/socket_service.dart';
import 'package:chat_app/domain/entities/message_model.dart';
import 'package:chat_app/domain/entities/user_mode.dart';
import 'package:chat_app/ui/pages/chat/widgets/chat_message_widget.dart';
import 'package:chat_app/utils/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  final User user;

  const ChatPage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final _inputController = TextEditingController();
  final _focusNode = FocusNode();
  bool _isTyping = false;
  List<ChatMessageWidget> _messages = [];

  @override
  void initState() {
    final socketService = Provider.of<SocketService>(context, listen: false);
    socketService.socket.on('personal-message', _listenMessage);
    this._loadMessages();
    super.initState();
  }

  _loadMessages() async {
    
    final user = await UserPreferences.instance.user;
    String code = user!.code;

    final List<Message> messages = await ClientService.instance.getMessages(widget.user.code);
    final history = messages.map((m) => ChatMessageWidget(
      ownerCode: code,
      text: m.message,
      uuid: m.from,
      animationController: AnimationController(vsync: this, duration: Duration(milliseconds: 0))..forward(),
    ));

    setState(() {
      _messages.insertAll(0, history);
    });
  }

  void _listenMessage(dynamic data) async {
    
    final user = await UserPreferences.instance.user;
    String code = user!.code;
    
    ChatMessageWidget message = ChatMessageWidget(
      ownerCode: code,
      text: data['message'],
      uuid: data['from'],
      animationController: AnimationController(
          vsync: this, duration: Duration(milliseconds: 300)),
    );

    setState(() {
      this._messages.insert(0, message);
    });

    message.animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.white,
        title: Column(
          children: [
            CircleAvatar(
              child: Text(
                widget.user.name.substring(0, 2),
                style: TextStyle(fontSize: 12),
              ),
              backgroundColor: Colors.blueAccent,
              maxRadius: 12,
            ),
            SizedBox(height: 3),
            Text(
              widget.user.name,
              style: TextStyle(color: Colors.black87, fontSize: 12),
            )
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                reverse: true,
                physics: BouncingScrollPhysics(),
                itemCount: _messages.length,
                itemBuilder: (BuildContext context, int index) {
                  return _messages[index];
                },
              ),
            ),
            Divider(),
            Container(
              color: Colors.white,
              child: _inputChat(),
            )
          ],
        ),
      ),
    );
  }

  Widget _inputChat() {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: this._inputController,
                onSubmitted: _handleSubmit,
                onChanged: (text) {
                  setState(() {
                    text.trim().length > 0
                        ? this._isTyping = true
                        : this._isTyping = false;
                  });
                },
                decoration: InputDecoration.collapsed(
                  hintText: 'Enviar',
                ),
                focusNode: this._focusNode,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 4),
                child: IconTheme(
                  data: IconThemeData(color: Colors.blue[400]),
                  child: IconButton(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onPressed: this._isTyping
                        ? () => this._handleSubmit(_inputController.text.trim())
                        : null,
                    icon: Icon(Icons.send),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _handleSubmit(String text) async {
    if (text.length == 0) return;

    final socketService = Provider.of<SocketService>(context, listen: false);
    final user = await UserPreferences.instance.user;
    String code = user!.code;

    this._inputController.clear();
    this._focusNode.requestFocus();

    final message = ChatMessageWidget(
      ownerCode: code,
      text: text,
      uuid: code,
      animationController: AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 400),
      ),
    );
    _messages.insert(0, message);
    message.animationController.forward();

    setState(() {
      this._isTyping = false;
    });

    socketService.socket.emit('personal-message', {
      'from': user.code,
      'to': widget.user.code,
      'message': text,
    });
  }

  @override
  void dispose() {
    for (ChatMessageWidget m in _messages) {
      m.animationController.dispose();
    }

    // TODO: desconectar el socket
    // final socketService = Provider.of<SocketService>(context, listen: false);
    // socketService.socket.off('personal-message');

    super.dispose();
  }
}
