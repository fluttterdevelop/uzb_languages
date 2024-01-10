import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:uzb_languages/generated/codegen_loader.g.dart';
import 'package:uzb_languages/generated/locale_keys.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

/// Commands for running easy localization and generating code
/// 
/// 
  /// flutter pub run easy_localization:generate -o codegen_loader.g.dart -S lib/assets/strings
  /// flutter pub run easy_localization:generate -f keys -o locale_keys.g.dart -S lib/assets/strings

  runApp(EasyLocalization(
      supportedLocales: const [
        Locale('uz'),
        Locale('ru'),
        Locale('en'),
      ],
      path: 'assets/translations/',
      fallbackLocale: const Locale('uz'),
      saveLocale: true,
      assetLoader: const CodegenLoader(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Localization',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Localization '),
        ),
        body: Center(
          child: Text(
            LocaleKeys.welcome,

            // birinchi usul 
            // 'welcome'.tr(),


              // 2 usuli 
            // context.tr('welcome'),

            style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
          ).tr(),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton.large(
              onPressed: () {
                context.setLocale(const Locale('uz'));
              },
              child: const Text('Uzbekcha'),
            ),
            FloatingActionButton.large(
                onPressed: () {
                  context.setLocale(const Locale('ru'));
                },
                child: const Text('Ruscha')),
            FloatingActionButton.large(
                onPressed: () {
                  context.setLocale(const Locale('en'));
                },
                child: const Text('Inglizcha')),
          ],
        ),
      );
    });
  }
}
