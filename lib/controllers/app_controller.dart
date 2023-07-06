import 'package:easy_chat/models/message.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  RxList<Message> messages = <Message>[].obs;
  Map<String, dynamic> typing = {'username': '', 'isTyping': false}.obs;
  var user = '...'.obs;
  setMessages(List<Message> msgs) {
    messages.value = msgs;
  }

  void addMessage(Message msg) {
    if (!messages.contains(msg)) {
      messages.add(msg);
    }
  }

  void setTyping(dynamic msg) {
    typing['username'] = msg["username"];
    typing['isTyping'] = msg['isTyping'];
  }

  setUsers(List<String> users) => user.value = users.join(",");
}
