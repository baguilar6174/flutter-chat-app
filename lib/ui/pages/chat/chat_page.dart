import 'package:chat_app/ui/pages/chat/widgets/chat_message_widget.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final _inputController = TextEditingController();
  final _focusNode = FocusNode();
  bool _isTyping = false;

  List<ChatMessageWidget> _messages = [
    // ChatMessageWidget(text: 'Hola mundo', uuid: '123'),
    // ChatMessageWidget(text: 'Hola mundo', uuid: '123'),
    // ChatMessageWidget(text: 'Hola mundo', uuid: '123'),
    // ChatMessageWidget(text: 'Hola mundo', uuid: '123ds'),
    // ChatMessageWidget(text: 'Hola mundo', uuid: '123fd'),
  ];

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
                'Br',
                style: TextStyle(fontSize: 12),
              ),
              backgroundColor: Colors.blueAccent,
              maxRadius: 12,
            ),
            SizedBox(height: 3),
            Text(
              'Bryan Aguilar',
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

  _handleSubmit(String text) {
    if(text.length == 0 ) return;
    this._inputController.clear();
    this._focusNode.requestFocus();

    final message = ChatMessageWidget(
      text: text,
      uuid: '123',
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
  }

  @override
  void dispose() {
    // TODO: off del socket
    for(ChatMessageWidget m in _messages ){
      m.animationController.dispose();
    }
    super.dispose();
  }
}
