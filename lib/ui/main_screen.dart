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
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: EdgeInsets.only(top: 5.0.h),
                  padding: const EdgeInsets.fromLTRB(40, 0, 60, 60),
                  child: Text(
                    'Welcome Back to EasyChat',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.bold, color: black),
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.bottomCenter,
                child: MainScreenBody(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
