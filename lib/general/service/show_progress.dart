import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

void showProgress(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => const _CustomLoadingDailog(),
  );
}

class _CustomLoadingDailog extends StatelessWidget {
  const _CustomLoadingDailog();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: PopScope(
        canPop: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              
              padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 Gap(30),
                  CupertinoActivityIndicator(),
                  Gap(15),
                  Text(
                    "Please Wait",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      // color: AppColors.,
                      fontSize: 14,
                    ),
                  ),
                  Gap(30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
