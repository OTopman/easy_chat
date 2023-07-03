import 'package:easy_chat/configs/colors.dart';
import 'package:easy_chat/controllers/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ChatTopBar extends StatefulWidget {
  const ChatTopBar({super.key});

  @override
  State<ChatTopBar> createState() => _ChatTopBarState();
}

class _ChatTopBarState extends State<ChatTopBar> {
  final appController = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 100.0,
      width: 100.0.w,
      color: white,
      padding: const EdgeInsets.only(left: 15, right: 15, top: 0),
      child: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 40.0.sp,
              height: 40.0.sp,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: black,
                image: const DecorationImage(
                  image: AssetImage('assets/images/avatar.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Charistech',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 8.0.sp),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  width: 50.0.w,
                  child: Obx(
                    () => Text(
                      appController.typing['isTyping']
                          ? '${appController.typing["username"]} is typing'
                          : 'This is a squad of talented team group chat.',
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 5.0.sp, fontWeight: FontWeight.w100),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 25.0.sp,
                  height: 25.0.sp,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/video-icon.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  width: 25.0.sp,
                  height: 25.0.sp,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/call-icon.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
