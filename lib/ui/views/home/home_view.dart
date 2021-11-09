import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:test_stacked/ui/widgets/dumb/button_widget.dart';
import 'package:test_stacked/ui/widgets/smart/smart_one/smart_one_view.dart';
import 'package:test_stacked/ui/widgets/smart/smart_two/smart_two_view.dart';

import './home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (HomeViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        HomeViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Home'),
          ),
          body: SafeArea(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ButtonWidget(
                  onPressed: () => model.navigateToUsers(),
                  child: const Text('Go to Users'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: const [
                    Text(
                      'both bellow uses the same ReactiveValue in a reactiveServices',
                      textAlign: TextAlign.center,
                    ),
                    Divider(),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  SmartOneView(),
                  SmartTwoView(),
                ],
              )
            ],
          )),
        );
      },
    );
  }
}
