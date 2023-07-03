import 'package:easy_chat/configs/colors.dart';
import 'package:easy_chat/constants/constants.dart';
import 'package:easy_chat/models/message.dart';
import 'package:easy_chat/models/storage.dart';
import 'package:easy_chat/services/misc.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class MessageWidget extends StatelessWidget {
  MessageWidget({super.key, required this.message});
  Message message;
  final _storage = Storage();
  @override
  Widget build(BuildContext context) {
    bool isMe = message.sender?.toLowerCase() ==
        _storage.get(Constants.username).toLowerCase();
    List<String> times = Misc.formatDateTime(message.createdAt!).split(' ');
    return UnconstrainedBox(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 30.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.transparent,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 70.0.w,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: isMe ? ultraMarineBlue : white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!isMe)
                    Container(
                      margin: const EdgeInsets.only(bottom: 5.0),
                      child: Text(
                        message.sender!,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(fontSize: 6.0.sp),
                      ),
                    ),
                  Text(
                    message.message!,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 6.0.sp,
                        fontWeight: FontWeight.w100,
                        color: isMe ? white : black),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0, left: 5.0),
              child: Text(
                '${times[1]} ${times[2]}',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 5.0.sp,
                      fontWeight: FontWeight.w100,
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
