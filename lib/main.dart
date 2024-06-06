import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';
import 'package:stipe_demo/src/core/constants/string_constants.dart';

import 'src/core/constants/route_names.dart';
import 'src/core/routing/route_generator.dart';
import 'src/core/utils/size_helper/screen_util.dart';
import 'src/di/get_it.dart' as get_it;
import 'src/ui/loading/loading_screen.dart';
import 'src/view_models/loading_view_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey =
      "pk_test_51PJBFMHf7q3saoufXHA27sSkFq0QVeBL80FaefVmwxXmR3kK9TNQv5iQmMcYSE9H50CsDuYrqtxt5hKT2hwuYMwV00Oipii9au";
  // "pk_test_51PGFOjSD9e0oWeS1Son9ZYF3HHaA8Dk2oT4ncllFqhlvrt4fO8zNq5lNHEjDbOiFT24Vc98nEahNA8mZCBEAIy8100GoHaNhTA";
  Stripe.merchantIdentifier = "merchent";
  Stripe.urlScheme = 'flutterstripe';
  await Stripe.instance.applySettings();
  await dotenv.load(fileName: "assets/.env");
  unawaited(get_it.init());
  get_it.locator.registerSingleton(LoadingViewModel());
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final LoadingViewModel loadingProvider;

  @override
  void initState() {
    super.initState();
    loadingProvider = get_it.locator<LoadingViewModel>();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        ScreenUtil.init(constraints,
            orientation: Orientation.portrait,
            designSize: ScreenUtil.defaultSize);

        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => loadingProvider,
            ),
          ],
          child: MaterialApp(
            title: appName,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                  seedColor: const Color.fromARGB(255, 165, 135, 216)),
              useMaterial3: true,
            ),
            debugShowCheckedModeBanner: false,
            builder: (context, child) {
              // return child!;
              final MediaQueryData data = MediaQuery.of(context);
              return MediaQuery(
                  data: data.copyWith(textScaler: TextScaler.noScaling),
                  child: LoadingScreen(screen: child!));
            },
            initialRoute: RouteNames.initialRoute,
            onGenerateRoute: RouteGenerator.generateRoute,
          ),
        );
      },
    );
  }
}
