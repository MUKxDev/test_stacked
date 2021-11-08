import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:test_stacked/app/app.dart';
import 'package:test_stacked/app/locator/locator.dart';

// Amplify Flutter Packages
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
// import 'package:amplify_api/amplify_api.dart'; // UNCOMMENT this line after backend is deployed

// Generated in previous step
import 'models/ModelProvider.dart';
import 'amplifyconfiguration.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _configureAmplify();

  /// Sets logging level
  Logger.level = Level.debug;

  /// Register all the models and services before the app starts
  setupLocator();

  /// Runs the app :)
  runApp(TestStackedApp());
}

Future<void> _configureAmplify() async {
  // await Amplify.addPlugin(AmplifyAPI()); // UNCOMMENT this line after backend is deployed
  await Amplify.addPlugin(
      AmplifyDataStore(modelProvider: ModelProvider.instance));

  // Once Plugins are added, configure Amplify
  await Amplify.configure(amplifyconfig);
}
