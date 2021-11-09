import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import './startup_view_model.dart';

class StartupView extends StatefulWidget {
  const StartupView({Key? key}) : super(key: key);

  @override
  _StartupViewState createState() => _StartupViewState();
}

class _StartupViewState extends State<StartupView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.reactive(
      viewModelBuilder: () => StartupViewModel(),
      onModelReady: (StartupViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        StartupViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const <Widget>[
                SizedBox(height: 15),
                CircularProgressIndicator(),
              ],
            ),
          ),
        );
      },
    );
  }
}
