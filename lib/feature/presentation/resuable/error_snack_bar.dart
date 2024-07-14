import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSnackBar {
  showSnackBar(
    BuildContext context, {
    required String title,
    required String msg,
  }) {
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      padding: EdgeInsets.zero,
      width: double.infinity,
      animation: CurvedAnimation(
        parent: AnimationController(
          duration: const Duration(milliseconds: 200),
          vsync: ScaffoldMessenger.of(context),
        ),
        curve: Curves.ease,
      ),
      content: CustomSnackBarContent(
        title: title,
        message: msg,
      ),
    );
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}

class CustomSnackBarContent extends StatelessWidget {
  final String title;
  final String message;

  const CustomSnackBarContent({
    super.key,
    required this.title,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      padding: EdgeInsets.only(left: 26.w, right: 7.1.w),
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: const [BoxShadow(color: Colors.grey, offset: Offset(0, 0), blurRadius: 24, spreadRadius: 0)],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Column(
              children: [
                SizedBox(height: 7.h),
                GestureDetector(
                  onTap: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
                  child: Container(
                    height: 20.7.w,
                    width: 20.7.w,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(Icons.close_rounded, size: 16.r, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 19.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 0.1.w),
                    SizedBox(
                      width: 290.w,
                      child: Text(
                        title,
                        style: TextStyle(fontSize: 16.sp, color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6.5.h),
                SizedBox(
                  width: 330.w,
                  child: Padding(
                    padding: EdgeInsets.only(left: 2.w),
                    child: Text(
                      message,
                      style: TextStyle(fontSize: 14.sp, color: Colors.white),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      maxLines: 2,
                    ),
                  ),
                ),
                SizedBox(height: 23.h),
              ],
            ),
          )
        ],
      ),
    );
  }
}
