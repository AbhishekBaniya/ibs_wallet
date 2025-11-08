import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibs_wallet/features/presentation/app_routes/app_navigators.dart';
import 'package:ibs_wallet/features/presentation/widgets/app_parent_widget.dart';

import '../../../core/utils/enums/arrow_button_enum.dart';
import '../app_routes/app_routes.dart';
import '../controller/topup_controller.dart';
import '../widgets/app_button_widget.dart';
import '../widgets/app_text_widget.dart';

class MobileNumberEnterScreen extends StatelessWidget {
  const MobileNumberEnterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final  ctrl = Get.put(TopUpController());
    final services = ['Mobile TopUp', 'Data Bundle', 'Electricity', 'TV Subscription'];
    return AppParentWidget(

      resizeToAvoidBottomInset: true,
      screenBgColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppRichTextWidget().buildRichText(text1: 'Enter mobile number', style1: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF6D6E71),),),
            const SizedBox(height: 12),
                SizedBox(
                  width: Get.width / 1.5,
                  child: Obx(() {
                    return TextField(
                      textAlign: TextAlign.center,
                      autofocus: false,
                      controller: ctrl.mobileNumberField.value,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "E.g +964 50 123 4567",
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
                          AppNavigator().navigateToAndReplace(AppRoutes.selectService);
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
                          AppNavigator().navigateToAndReplace(AppRoutes.enterAmount);
                        },
                      ),
                    )
                  ],
                ),
           /* ...services.map((s) => Card(
              child: ListTile(
                title: Text(s),
                trailing: Obx(() => ctrl.selectedService.value == s ? const Icon(Icons.check_circle, color: Colors.green) : SizedBox.shrink()),
                onTap: () {
                  //ctrl.setService(s);
                  //Get.toNamed(AppRoutes.enterMobile);
                },
              ),
            )),*/
          ]),
        ),
      ),
    );
  }


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
