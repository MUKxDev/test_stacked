import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import './smart_two_view_model.dart';

class SmartTwoView extends StatelessWidget {
  const SmartTwoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SmartTwoViewModel>.reactive(
      viewModelBuilder: () => SmartTwoViewModel(),
      onModelReady: (SmartTwoViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        SmartTwoViewModel model,
        Widget? child,
      ) {
        return Column(
          children: [
            Center(
              child: Text(
                model.theCurrentValue.toString(),
              ),
            ),
            ElevatedButton(
                onPressed: () => model.increment(),
                child: const Text('Increment by 5')),
          ],
        );
      },
    );
  }
}
