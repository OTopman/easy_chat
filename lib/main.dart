import 'package:easy_chat/configs/app_router.dart';
import 'package:easy_chat/configs/app_theme.dart';
import 'package:easy_chat/constants/constants.dart';
import 'package:easy_chat/constants/routes.dart';
import 'package:easy_chat/models/storage.dart';
import 'package:easy_chat/services/socket_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(Constants.storageBox);

  SocketClient.init();

  runApp(App());
}

class App extends StatelessWidget {
  App({super.key});

  final _storage = Storage();

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return ScreenUtilInit(
          designSize: Size(SizerExt(100.0).w, SizerExt(100.0).h),
          builder: (context, widget) {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme,
              initialRoute: _storage.get(Constants.username) != null
                  ? Routes.chat
                  : Routes.home,
              onGenerateRoute: AppRouter.onPageGenerated,
              builder: (ctx, child) {
                return MediaQuery(
                  data: MediaQuery.of(ctx).copyWith(
                    textScaleFactor:
                        orientation == Orientation.portrait ? 2.0 : 1,
                  ),
                  child: child!,
                );
              },
            );
          },
        );
      },
    );
  }
}
