import 'package:easy_chat/models/message.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  RxList<Message> messages = <Message>[].obs;
  Map<String, dynamic> typing = {'username': '', 'isTyping': false}.obs;
  var user = '...'.obs;
  setMessages(List<Message> msgs) {
    messages.value = [...msgs];
  }

  addMessage(Message msg) => messages.addIf(!messages.contains(msg), msg);
  void setTyping(dynamic msg) {
    // if (msg['isTyping']) {
    print(msg);
    typing['username'] = msg["username"];
    typing['isTyping'] = msg['isTyping'];
    // } else {
    // typing = 'This is a squad of talented team group chat'.obs;
    // }
  }

  setUsers(List<String> users) => user.value = users.join(",");
}
