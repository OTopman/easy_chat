import 'package:easy_chat/configs/colors.dart';
import 'package:easy_chat/ui/widgets/main_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SizedBox(
          height: 100.0.h,
          width: 100.0.w,
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 5.0.h, bottom: 5.0.h),
                padding: const EdgeInsets.fromLTRB(60, 40, 60, 60),
                child: Text(
                  'Welcome Back to EasyChat',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.bold, color: black),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                top: 25.0.h,
                child: const MainScreenBody(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
