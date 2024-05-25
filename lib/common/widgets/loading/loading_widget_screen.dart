import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ncc/utils/constants/assets_const.dart';

showLoadingDialog({required BuildContext context}) {
  showDialog(
    context: context,
    builder: (context) => const CustomLoadingScreen(),
  );
}

class CustomLoadingScreen extends StatelessWidget {
  const CustomLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: AlertDialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: Lottie.asset(AssetsConst.loadingImg),
      ),
    );
  }
}
