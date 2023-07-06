import 'package:easy_chat/configs/colors.dart';
import 'package:easy_chat/constants/constants.dart';
import 'package:easy_chat/constants/routes.dart';
import 'package:easy_chat/models/storage.dart';
import 'package:easy_chat/services/socket_client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class MainScreenBody extends StatefulWidget {
  const MainScreenBody({super.key});

  @override
  State<MainScreenBody> createState() => _MainScreenBodyState();
}

class _MainScreenBodyState extends State<MainScreenBody> {
  final TextEditingController usernameController = TextEditingController();
  final _storage = Storage();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0.w,
      height: 70.0.h,
      padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
      // margin: EdgeInsets.only(top: 5.0.h),
      decoration: BoxDecoration(
        color: white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.zero,
          bottomRight: Radius.zero,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.topCenter,
                width: 100.0.sp,
                height: 100.0.sp,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(128),
                  color: black,
                  image: const DecorationImage(
                    image: AssetImage('assets/images/avatar.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 7.0.h),
          Text(
            'Username',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: black,
                  fontWeight: FontWeight.w500,
                ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: TextFormField(
              style: Theme.of(context).textTheme.bodySmall,
              controller: usernameController,
              cursorColor: ultraMarineBlue,
              showCursor: true,
              decoration: const InputDecoration(
                label: Text('JohnDoe'),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 30.0,
                  vertical: 25.0,
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          TextButton(
            onPressed: () {
              if (usernameController.text.trim().isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Username is required'),
                    showCloseIcon: true,
                    // action: SnackBarAction(
                    //     label: "Close", onPressed: () => {}),
                  ),
                );
                return;
              }
              _storage.add(Constants.username, usernameController.text.trim());
              SocketClient.login(usernameController.text.trim());
              Get.offAndToNamed(Routes.chat);
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(ultraMarineBlue),
              minimumSize: MaterialStateProperty.all(Size(100.0.w, 50.0.sp)),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              ),
            ),
            child: Text(
              'Get Started',
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(color: white),
            ),
          ),
          const SizedBox(height: 60),
        ],
      ),
    );
  }
}
