import 'package:easy_chat/constants/constants.dart';
import 'package:easy_chat/models/message.dart';
import 'package:easy_chat/models/storage.dart';
import 'package:easy_chat/services/events.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../controllers/app_controller.dart';

class SocketClient {
  static IO.Socket? socket;
  // static final List<Message> _messages = [];
  static final Storage _storage = Storage();
  static final messageController = Get.put(AppController());

  // static List<Message> get Messages => _messages;

  SocketClient() {
    throw "SocketClient constructor cannot be called directly use SocketClient.init() instead";
  }

  static IO.Socket init() {
    socket ??= IO.io(Constants.server,
        IO.OptionBuilder().setTransports(['websocket']).build());

    socket!.on(Events.connect, (data) => debugPrint("App connected to server"));
    socket!.on(Events.connecting, (data) => debugPrint("App connecting to server"));
    socket!.on(Events.disconnect,
        (data) => debugPrint("App disconnected from server"));
    socket!.on(Events.error, (data) {
      debugPrint("An error occurred");
      debugPrint(data.toString());
    });

    socket!.on(Events.messages, _onMessagesLoad);
    socket!.on(Events.typing, _onTyping);
    socket!.on(Events.message, _onMessageLoad);
    socket!.on(Events.users, _onLoadUsers);

    return socket!;
  }

  static login(String username) {
    if (socket == null) throw "SocketClient.init() must be called first.";

    socket!.emit(Events.login, {'username': username});
    _storage.add(Constants.username, username);
  }

  static loadMessages() {
    if (socket == null) throw "SocketClient.init() must be called first.";

    var username = _storage.get(Constants.username);
    socket!.emit(Events.listMessage, {'username': username});
  }

  static typing(bool typing) {
    if (socket == null) throw "SocketClient.init() must be called first.";

    socket!.emit(Events.typing,
        {'username': _storage.get(Constants.username), 'isTyping': typing});
  }

  static sendMessage(String message) {
    if (socket == null) throw "SocketClient.init() must be called first.";
    String? username = _storage.get(Constants.username);
    socket!.emit(Events.sendMessage, {'sender': username, 'message': message});
  }

  static _onTyping(dynamic message) {
    messageController.setTyping(message);
  }

  static _onMessagesLoad(dynamic data) {
    var msg =
        List<Message>.generate(data.length, (i) => Message.fromJson(data[i]));
    messageController.setMessages(msg);
  }

  static _onLoadUsers(dynamic data) {
    var msg = List<String>.generate(data.length, (i) => data[i]);
    messageController.setUsers(msg);
  }

  static _onMessageLoad(dynamic data) {
    messageController.addMessage(Message.fromJson(data));
  }
}
