import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibs_wallet/config/res/dims.dart';
import 'package:ibs_wallet/features/presentation/app_routes/app_navigators.dart';
import 'package:ibs_wallet/features/presentation/app_routes/app_routes.dart';
import 'package:ibs_wallet/features/presentation/widgets/app_button_widget.dart';
import 'package:ibs_wallet/features/presentation/widgets/app_parent_widget.dart';
import 'package:ibs_wallet/features/presentation/widgets/app_text_widget.dart';
import 'package:ibs_wallet/features/presentation/widgets/app_textformfield_widget.dart';

import '../../../config/res/assets.dart';
import '../../../core/utils/enums/arrow_button_enum.dart';
import '../app_routes/app_navigation_tracer.dart';
import '../controller/topup_controller.dart';

/*class SelectServiceScreen extends StatelessWidget {
  const SelectServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(TopUpController());
    final orientation = MediaQuery.of(context).orientation;
    return AppParentWidget(
      resizeToAvoidBottomInset: true,
      screenBgColor: Colors.white,
      body: SingleChildScrollView(
        physics: orientation == Orientation.portrait ? NeverScrollableScrollPhysics(): ScrollPhysics(),
        child: SizedBox(
          height: Get.height,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
          
                AppRichTextWidget().buildRichText(
                  text1: 'Search Product Or Company Provider',
                  style1: TextStyle(fontSize: 14,
                    color: Color(0xFF959699),
                    fontWeight: FontWeight.w400,),),
          
                const SizedBox(height: 20,),
          
                SizedBox(
                  width: Get.width / 1.5,
                  child: Obx(() {
                    return TextField(
                      autofocus: false,
                      controller: ctrl.searchField.value,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: "Search Here ...",
                        hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
          
                        // Remove inner underline
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: BorderSide.none,
                        ),
          
                        // DEFAULT BORDER (grey)
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: const BorderSide(
                            color: Colors.grey,     // default border color
                            width: 2,
                          ),
                        ),
          
                        // FOCUSED BORDER (grey)
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
                  }),
                ),
          
                const SizedBox(height: 20,),
          
                Card(
                      elevation: 8,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                      child: SizedBox(
                        height: 130,
                        child: Padding(
                          padding: const EdgeInsets.all(18),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [

                                      AppRichTextWidget().buildRichText(
                                        text1: *//*(Get.arguments as Map?)?['name'] ?? *//*'Mustafa Taj',
                                        style1: TextStyle(fontSize: 18,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600),),
                                      const SizedBox(height: 14),
                                      AppRichTextWidget().buildRichText(
                                        text1: 'Wallet Balance :',
                                        style1: TextStyle(fontSize: 14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w300),),

                                      const SizedBox(height: 4),

                                      Text('${ctrl.walletBalance.value.toStringAsFixed(
                                          2)} ${ctrl.currency.value}',
                                          style: const TextStyle(fontSize: 14,
                                              fontWeight: FontWeight.bold, color: Color(0xFF209FA7),),),
                                    ],),
                              ),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 55,   // set width
                                      height: 55,  // set height (must match width for circle)
                                      child: FloatingActionButton(
                                        onPressed: () {},
                                        elevation: 6,
                                        backgroundColor: Colors.white,

                                        shape: const CircleBorder(), // force circular shape
                                        child: ClipOval(
                                          child: Image.asset(Assets.topUpRequest,
                                            width: 30,
                                            height: 30,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    AppRichTextWidget().buildRichText(
                                      text1: 'Top-up Request',
                                      style1: TextStyle(fontSize: 14,
                                          color: Colors.black.withOpacity(0.6),
                                          fontWeight: FontWeight.w200),),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
          
                    ),),
                const SizedBox(height: 10),
                AppRichTextWidget().buildRichText(
                  text1: 'Select Services',
                  style1: TextStyle(fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w300),),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    VoucherButton(assetPath: Assets.vouchers, title: 'Voucher',),
                    const SizedBox(width: 20),
                    VoucherButton(assetPath: Assets.giftCard, title: 'Gift Card',),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    VoucherButton(assetPath: Assets.eTopUp,title: 'E-Top-up',),
                    const SizedBox(width: 20),
                    VoucherButton(assetPath: Assets.specialNumber, title: 'Special Number',),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class VoucherButton extends StatelessWidget {
  final String? assetPath, title;
  const VoucherButton({super.key, this.assetPath, this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          AppNavigator().navigateToAndReplace(AppRoutes.enterMobile);
        },
        child: Container(
          height: Dim.doubleTen * 13,
          width: Dim.doubleTen * 13,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFF4A9CA5),
            boxShadow: [
              BoxShadow(
                color: Color(0xFFD9D8D8),
                blurRadius: 20,
                spreadRadius: 0,
                offset: const Offset(8, 8),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(assetPath ?? '', height: Dim.doubleTen * 4, width: Dim.doubleTen * 4,),
              const SizedBox(height: 8),
               Text(
                title ?? '',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}*/


class SelectServiceScreen extends StatelessWidget {
  const SelectServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(TopUpController());

    return AppParentWidget(
      resizeToAvoidBottomInset: true,
      screenBgColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenWidth = constraints.maxWidth;
          double inputWidth =
          screenWidth < 380 ? screenWidth * 0.85 : screenWidth * 0.65;

          double voucherSize =
          screenWidth < 380 ? 95 : (screenWidth > 600 ? 150 : 120);

          double fabSize =
          screenWidth < 380 ? 48 : (screenWidth > 600 ? 70 : 55);

          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                AppRichTextWidget().buildRichText(
                  text1: 'Search Product Or Company Provider',
                  style1: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF959699),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 20),


                SizedBox(
                  width: inputWidth,
                  child: Obx(() {
                    return TextField(
                      controller: ctrl.searchField.value,
                      decoration: InputDecoration(
                        hintText: "Search Here ...",
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 14,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide:
                          const BorderSide(color: Colors.grey, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide:
                          const BorderSide(color: Colors.grey, width: 1),
                        ),
                      ),
                    );
                  }),
                ),

                const SizedBox(height: 20),

                // ✅ Wallet Card Responsive
                Card(
                  elevation: 6,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// Left Side Column
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppRichTextWidget().buildRichText(
                                text1: "Mustafa Taj",
                                style1: const TextStyle(
                                  color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 14),
                              AppRichTextWidget().buildRichText( text1:
                                "Wallet Balance:",
                                style1: TextStyle(
                                  color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300),
                              ),
                              const SizedBox(height: 4),

                              const SizedBox(height: 4),
                              Obx(() => AppRichTextWidget().buildRichText( text1:
                                "${ctrl.walletBalance.value.toStringAsFixed(2)} ${ctrl.currency.value}",
                                style1: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF209FA7),
                                ),
                              )),
                            ],
                          ),
                        ),

                        /// ✅ FAB Responsive
                        SizedBox(
                          width: fabSize,
                          height: fabSize,
                          child: FloatingActionButton(
                            onPressed: () {},
                            elevation: 6,
                            backgroundColor: Colors.white,
                            shape: const CircleBorder(),
                            child: ClipOval(
                              child: Image.asset(
                                Assets.topUpRequest,
                                width: fabSize * 0.5,
                                height: fabSize * 0.5,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                AppRichTextWidget().buildRichText(
                  text1: 'Select Services',
                  style1: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(height: 20),

                // ✅ Responsive Buttons
                Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  alignment: WrapAlignment.center,
                  children: [
                    VoucherButton(
                        assetPath: Assets.vouchers,
                        title: 'Voucher',
                        size: voucherSize),
                    VoucherButton(
                        assetPath: Assets.giftCard,
                        title: 'Gift Card',
                        size: voucherSize),
                    VoucherButton(
                        assetPath: Assets.eTopUp,
                        title: 'E-Top-up',
                        size: voucherSize),
                    VoucherButton(
                        assetPath: Assets.specialNumber,
                        title: 'Special Number',
                        size: voucherSize),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// ✅ Voucher buttons now responsive
class VoucherButton extends StatelessWidget {
  final String? assetPath, title;
  final double size;
  const VoucherButton({super.key, this.assetPath, this.title, required this.size});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => AppNavigator().navigateTo(AppRoutes.enterMobile),
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0xFF4A9CA5),
          boxShadow: const [
            BoxShadow(
              color: Color(0xFFD9D8D8),
              blurRadius: 20,
              offset: Offset(8, 8),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              assetPath ?? '',
              height: size * 0.35,
              width: size * 0.35,
            ),
            const SizedBox(height: 8),
            Text(
              title ?? '',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ),
    );
  }
}

