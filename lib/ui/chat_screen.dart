// ignore_for_file: invalid_use_of_protected_member
import 'package:easy_chat/configs/colors.dart';
import 'package:easy_chat/constants/constants.dart';
import 'package:easy_chat/controllers/app_controller.dart';
import 'package:easy_chat/models/storage.dart';
import 'package:easy_chat/services/misc.dart';
import 'package:easy_chat/services/scroll_service.dart';
import 'package:easy_chat/services/socket_client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'widgets/chat_top_bar.dart';
import 'widgets/message_widget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final _messageFieldFocus = FocusNode();
  final _socket = SocketClient.init();
  final _storage = Storage();
  String? username;
  bool _enableSend = false;
  bool _isTyping = false;

  final messageController = Get.put(AppController());
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    // ScrollService.scrollToEnd(scrollController: _scrollController);
    return GestureDetector(
      onTap: () => _messageFieldFocus.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const ChatTopBar(),
              Expanded(
                child: Container(
                  color: cultured,
                  padding: const EdgeInsets.all(20),
                  width: 100.0.w,
                  margin: const EdgeInsets.only(top: 10.0),
                  child: Obx(
                    () => ListView.builder(
                      shrinkWrap: true,
                      // reverse: true,
                      controller: _scrollController,
                      scrollDirection: Axis.vertical,
                      itemCount: messageController.messages.length,
                      itemBuilder: (ctx, i) {
                        // ScrollService.scrollToEnd(
                        //   scrollController: _scrollController,
                        // );
                        return MessageWidget(
                          message: messageController.messages[i],
                        );
                      },
                    ),
                  ),
                ),
              ),
              Container(
                width: 100.0.w,
                // height: 10.0.h,
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 28,
                  bottom: 28,
                ),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.zero,
                    bottomRight: Radius.zero,
                  ),
                ),
                child: TextFormField(
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontWeight: FontWeight.w100),
                  controller: _messageController,
                  cursorColor: ultraMarineBlue,
                  showCursor: true,
                  keyboardType: TextInputType.multiline,
                  minLines: 1,
                  maxLines: 2,
                  enableSuggestions: true,
                  onTap: () => _messageFieldFocus.requestFocus(),
                  focusNode: _messageFieldFocus,
                  onEditingComplete: () {
                    _isTyping = false;
                    SocketClient.typing(false);
                    setState(() {});
                  },
                  onTapOutside: (p) => SocketClient.typing(false),
                  onChanged: (param) {
                    if (param.trim().isNotEmpty) {
                      _enableSend = true;
                      if (!_isTyping) {
                        SocketClient.typing(true);
                        _isTyping = true;
                      }
                    } else if (param.trim().isEmpty && _isTyping) {
                      _enableSend = false;
                      SocketClient.typing(false);
                      _isTyping = false;
                    }
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100.0),
                      borderSide: BorderSide(color: cultured),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100.0),
                      borderSide: BorderSide(color: cultured),
                    ),
                    // errorBorder: InputBorder.none,
                    // disabledBorder: InputBorder.none,
                    suffixIcon: GestureDetector(
                      onTap: !_enableSend
                          ? null
                          : () {
                              SocketClient.sendMessage(
                                  _messageController.text.trim());
                              _messageController.clear();
                              setState(() {
                                _enableSend = false;
                              });

                              ScrollService.scrollToEnd(
                                  scrollController: _scrollController);
                            },
                      child: Container(
                        width: 32,
                        // alignment: Alignment.centerRight,
                        margin: const EdgeInsets.only(right: 10.0),
                        decoration: BoxDecoration(
                          image: _enableSend
                              ? const DecorationImage(
                                  image: AssetImage(
                                      'assets/images/send-icon-active.png'),
                                )
                              : const DecorationImage(
                                  image:
                                      AssetImage('assets/images/send-icon.png'),
                                ),
                        ),
                      ),
                    ),
                    label: const Text('Type here...'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100.0),
                        borderSide: BorderSide(color: cultured)),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: 25.0,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    // Log user in
    if (_storage.get(Constants.username) != null) {
      username = _storage.get(Constants.username);
      SocketClient.login(username!);
    }
    super.initState();

    ScrollService.scrollToEnd(scrollController: _scrollController);
  }

  @override
  void dispose() {
    _socket.destroy();
    // _messagesSocket.dispose();
    super.dispose();
  }
}