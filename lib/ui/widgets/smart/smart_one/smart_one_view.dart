import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import './smart_one_view_model.dart';

class SmartOneView extends StatelessWidget {
  const SmartOneView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SmartOneViewModel>.reactive(
      viewModelBuilder: () => SmartOneViewModel(),
      onModelReady: (SmartOneViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        SmartOneViewModel model,
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
                child: const Text('Increment by 1')),
          ],
        );
      },
    );
  }
}
