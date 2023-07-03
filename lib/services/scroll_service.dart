import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ScrollService {
  static scrollToEnd(
      {required ScrollController scrollController,
      reversed = false,
      Function? callback}) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      scrollController.jumpTo(reversed
          ? scrollController.position.minScrollExtent
          : scrollController.position.maxScrollExtent);
      // scrollController.animateTo(
      //   reversed
      //       ? scrollController.position.minScrollExtent
      //       : scrollController.position.maxScrollExtent,
      //   duration: const Duration(milliseconds: 300),
      //   curve: Curves.easeOut,
      // );
      if (callback != null) {
        callback();
      }
    });
  }
}
