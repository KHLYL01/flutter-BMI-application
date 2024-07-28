import 'package:bmi_app/modules/bmi/controller.dart';
import 'package:bmi_app/modules/bmi/result_page.dart';
import 'package:bmi_app/shared/styles/colors.dart';
import 'package:bmi_app/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  HomePageController controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
        centerTitle: true,
        title: const Text(
          "BMI App",
          style: titleStyle,
        ),
        elevation: 2,
      ),
      backgroundColor: background,
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => controller.toMale(),
                    child: Container(
                      width: (MediaQuery.of(context).size.width - 32 - 26) / 2,
                      decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 64,
                            width: 64,
                            child: Obx(
                              () => Image(
                                image:
                                    const AssetImage('assets/images/male.png'),
                                fit: BoxFit.cover,
                                color: controller.isMale.isTrue
                                    ? secondColor
                                    : background,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            'MALE',
                            style: titleStyle,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 26),
                  GestureDetector(
                    onTap: () => controller.toFemale(),
                    child: Container(
                      width: (MediaQuery.of(context).size.width - 32 - 26) / 2,
                      decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 64,
                            width: 64,
                            child: Obx(
                              () => Image(
                                image: const AssetImage(
                                    'assets/images/female.png'),
                                fit: BoxFit.cover,
                                color: controller.isMale.isTrue
                                    ? background
                                    : secondColor,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            'FEMALE',
                            style: titleStyle,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'HEIGHT',
                      style: titleStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Obx(
                          () => Text(
                            controller.height.value.round().toString(),
                            style: numberStyle,
                          ),
                        ),
                        const Text('CM', style: TextStyle(color: foreground)),
                      ],
                    ),
                    Obx(
                      () => Slider(
                        min: 60,
                        max: 220,
                        value: controller.height.value,
                        onChanged: (value) {
                          controller.height.value = value;
                        },
                        thumbColor: secondColor,
                        activeColor: secondColor,
                        inactiveColor: foreground,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: (MediaQuery.of(context).size.width - 32 - 26) / 2,
                    decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'WEIGHT',
                          style: titleStyle,
                        ),
                        const SizedBox(height: 4),
                        Obx(
                          () => Text(
                            controller.weight.value.toString(),
                            style: numberStyle,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: background,
                              child: IconButton(
                                  icon: const Icon(
                                    Icons.add,
                                    color: foreground,
                                  ),
                                  onPressed: () => controller.increaseWeight()),
                            ),
                            const SizedBox(width: 8),
                            CircleAvatar(
                              backgroundColor: background,
                              child: IconButton(
                                  icon: const Icon(
                                    Icons.remove,
                                    color: foreground,
                                  ),
                                  onPressed: () => controller.decreaseWeight()),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 26),
                  Container(
                    width: (MediaQuery.of(context).size.width - 32 - 26) / 2,
                    decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'AGE',
                          style: titleStyle,
                        ),
                        const SizedBox(height: 4),
                        Obx(
                          () => Text(
                            controller.age.value.toString(),
                            style: numberStyle,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: background,
                              child: IconButton(
                                  icon: const Icon(
                                    Icons.add,
                                    color: foreground,
                                  ),
                                  onPressed: () => controller.increaseAge()),
                            ),
                            const SizedBox(width: 8),
                            CircleAvatar(
                              backgroundColor: background,
                              child: IconButton(
                                  icon: const Icon(
                                    Icons.remove,
                                    color: foreground,
                                  ),
                                  onPressed: () => controller.decreaseAge()),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: secondColor,
            child: MaterialButton(
              padding: const EdgeInsets.symmetric(vertical: 12),
              onPressed: () => Get.to(() => ResultPage()),
              child: const Text(
                'CALCULATE',
                style: titleStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
