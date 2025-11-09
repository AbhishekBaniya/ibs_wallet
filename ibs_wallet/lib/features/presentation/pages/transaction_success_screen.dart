import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibs_wallet/features/presentation/app_routes/app_navigators.dart';
import 'package:ibs_wallet/features/presentation/widgets/app_parent_widget.dart';

import '../../../config/res/assets.dart';
import '../../../core/utils/enums/arrow_button_enum.dart';
import '../app_routes/app_routes.dart';
import '../controller/topup_controller.dart';
import '../widgets/app_button_widget.dart';
import '../widgets/app_text_widget.dart';

/*class TransactionSuccessScreen extends StatelessWidget {
  const TransactionSuccessScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return AppParentWidget(
      resizeToAvoidBottomInset: true,
      screenBgColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: InkWell(
          onTap: (){
            AppNavigator().navigateToAndReplace(AppRoutes.home);
          },
          child: Center(
            child: Container(
              height: Get.height/2.5,
              width: Get.width * 0.85,
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.25),
                    blurRadius: 15,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Flexible(child: Image.asset(Assets.success, height: 50,)),
                const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AppRichTextWidget().buildRichText(text1: 'Your transaction has been processed successfully Please take your receipt', style1: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Color(0xFF969696),),textAlign: TextAlign.center),
                    ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}*/
class TransactionSuccessScreen extends StatelessWidget {
  const TransactionSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppParentWidget(
      resizeToAvoidBottomInset: true,
      screenBgColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenWidth = constraints.maxWidth;

          // ✅ responsive breakpoints
          double containerWidth = screenWidth * 0.85;
          double imgSize = screenWidth < 380
              ? 50
              : (screenWidth > 700 ? 90 : 70);

          double fontSize = screenWidth < 380
              ? 14
              : (screenWidth > 700 ? 22 : 18);

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: SingleChildScrollView(      // ✅ prevents overflow
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: containerWidth,
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withValues(alpha: 0.25),
                          blurRadius: 15,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,     // ✅ prevents forced height
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Assets.success,
                          height: imgSize,
                          width: imgSize,
                        ),
                        const SizedBox(height: 18),

                        Text(
                          "Your transaction has been processed successfully.\nPlease take your receipt.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF969696),
                          ),
                        ),
                        const SizedBox(height: 16),

                        InkWell(
                          onTap: () => AppNavigator().navigateToAndReplace(AppRoutes.home),
                          child: Text(
                            "Go to Home",
                            style: TextStyle(
                              fontSize: fontSize - 2,
                              fontWeight: FontWeight.w600,
                              color: Colors.teal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
