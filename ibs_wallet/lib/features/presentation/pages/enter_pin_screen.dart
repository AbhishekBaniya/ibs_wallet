import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibs_wallet/features/presentation/app_routes/app_navigators.dart';
import 'package:ibs_wallet/features/presentation/widgets/app_parent_widget.dart';

import '../../../core/utils/enums/arrow_button_enum.dart';
import '../app_routes/app_routes.dart';
import '../controller/topup_controller.dart';
import '../widgets/app_button_widget.dart';
import '../widgets/app_text_widget.dart';

class EnterPinScreen extends StatelessWidget {
  const EnterPinScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final  ctrl = Get.put(TopUpController());
    return AppParentWidget(
      resizeToAvoidBottomInset: true,
      screenBgColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppRichTextWidget().buildRichText(text1: 'Enter Wallet Pin', style1: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF6D6E71),),),
            const SizedBox(height: 12),
                SizedBox(
                  width: Get.width / 1.5,
                  child: Obx(() {
                    return TextField(
                      textAlign: TextAlign.center,
                      autofocus: false,
                      controller: ctrl.pinField.value,
                      keyboardType: TextInputType.number,
                      maxLength: 4,
                      obscureText: true,                 // ✅ Hides input
                      obscuringCharacter: '•',           // ✅ Dot symbol
                      decoration: InputDecoration(
                        counter: SizedBox.shrink(),
                        hintText: "****",
                        hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),

                        // ✅ Remove inner underline
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: BorderSide.none,
                        ),

                        // ✅ DEFAULT BORDER (grey)
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: const BorderSide(
                            color: Colors.grey,     // default border color
                            width: 2,
                          ),
                        ),

                        // ✅ FOCUSED BORDER (grey)
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: const BorderSide(
                            color: Colors.grey,     // focus border color
                            width: 1,
                          ),
                        ),

                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 14,
                        ),
                        suffixIcon: Icon(Icons.visibility_off_outlined),
                      ),
                    );
                  },),
                ),

            const SizedBox(height: 24),

                Row(
                  children: [

                    Flexible(
                      child: AppButtonWidget(
                        arrowType: ButtonArrowType.left,
                        buttonLabel: "Back",
                        buttonBorderColor: const Color(0xFF209FA7),
                        buttonColor: Color(0xFF209FA7),
                        buttonLabelColor: Colors.white,
                        onTap: (){
                          AppNavigator().navigateToAndReplace(AppRoutes.enterAmount);
                        },
                      ),
                    ),
                    const SizedBox(width: 12,),
                    Flexible(
                      child: AppButtonWidget(
                        rightArrowColor: Color(0xFF209FA7),
                        arrowType: ButtonArrowType.right,
                        buttonLabel: "Next",
                        buttonBorderColor: Color(0xFF209FA7),
                        buttonLabelColor: const Color(0xFF606160),
                        buttonColor: Colors.white,
                        onTap: (){
                          AppNavigator().navigateToAndReplace(AppRoutes.success);
                        },
                      ),
                    )
                  ],
                ),
          ],),
        ),
      ),
    );
  }
}
