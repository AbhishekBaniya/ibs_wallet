
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/res/assets.dart';
import 'app_text_widget.dart';

class AppParentWidget extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final bool? resizeToAvoidBottomInset;
  final Widget? body, bottomNavigationBar;
  final  Color? screenBgColor;
  final bool? top, bottom, left, right;
  const AppParentWidget({super.key, this.appBar, this.resizeToAvoidBottomInset, this.body, this.bottomNavigationBar, this.screenBgColor, this.top, this.bottom, this.left, this.right});

  @override
  Widget build(BuildContext context) => SafeArea(
      top: top??false,
      bottom: bottom??false,
      left: left??false,
      right: right??false,
      //key: parentKey,
      child: Scaffold(
        backgroundColor: screenBgColor,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        appBar: appBar ??  PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.25),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
    
                    /// LEFT SIDE: Logo + Text (Infinite Business Solutions)
                    Image.asset(
                      Assets.logo,
                      height: Get.height/2,
                      width: Get.width/2.4,
                    ),
    
                    /// RIGHT SIDE: Two Circular Icons
                    Row(
                      children: [
                        _circularIcon(Assets.logout,),
                        const SizedBox(width: 12),
                        _circularIcon(Assets.notification,),
                        Icon(
                          Icons.more_vert, size: 32, color: Color(0xFF9E9E9E),),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: body,
        bottomNavigationBar: bottomNavigationBar ?? SizedBox(
          height: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AppRichTextWidget().buildRichText(
                text1: '© 2025 All rights reserved.',
                style1: TextStyle(fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),),
              AppRichTextWidget().buildRichText(
                text1: 'Version 1.0.0 | Privacy Policy | Terms of Service',
                style1: TextStyle(fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w300),),

            ],
          ),
        ),
      ),
  );



  /// Function for reusable circular icon button
  Widget _circularIcon(String iconPath) {
    return Container(
      height: 48,
      width: 48,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFF209FA7),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: Image.asset(
          iconPath,
          width: 32,    // ✅ CONTROL IMAGE SIZE HERE
          height: 32,   // ✅ CONTROL IMAGE SIZE HERE
          fit: BoxFit.contain,
        ),
      ),
    );
    return Container(
      height: 48,
      width: 48,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFF209FA7), // button teal color
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.3),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
        image: DecorationImage(image: AssetImage(iconPath,),fit: BoxFit.fitWidth, ),
      ),
      /*child: Image.asset(iconPath, width: 20, height: 20,)*//*Icon(
        icon,
        size: 26,
        color: Colors.white,
      ),*/
    );
  }
}
