import 'package:bmi_app/modules/bmi/controller.dart';
import 'package:bmi_app/shared/styles/colors.dart';
import 'package:bmi_app/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultPage extends StatelessWidget {
  ResultPage({Key? key}) : super(key: key);
  HomePageController controller = Get.put(HomePageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
        centerTitle: true,
        title: const Text(
          'Result',
          style: titleStyle,
        ),
        elevation: 2,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: foreground,
          ),
        ),
      ),
      backgroundColor: background,
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height / 3,
          width: MediaQuery.of(context).size.width - 48,
          decoration: BoxDecoration(
            color: mainColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'the result:',
                style: titleStyle,
              ),
              const SizedBox(height: 16),
              Text(
                controller.calculate().toStringAsFixed(2),
                style: numberStyle,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '( ',
                    style: TextStyle(color: background, fontSize: 24),
                  ),
                  Text(
                    controller.bmiState(),
                    style:
                        titleStyle.copyWith(color: controller.bmiStateColor()),
                  ),
                  const Text(
                    ' )',
                    style: TextStyle(color: background, fontSize: 24),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
