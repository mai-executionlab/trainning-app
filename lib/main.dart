import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:training_app/presentation/pages/profile/profile_controller.dart';
import 'package:training_app/shared_pref.dart';

import 'injection.dart';
import 'presentation/pages/pages.dart';

void main() async {
  // ProviderContainer()
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await getIt<SharedPref>().init();
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, ref) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'NotoSanJP',
        primarySwatch: Colors.deepOrange,
        // outlinedButtonTheme: OutlinedButtonThemeData(style: OutlinedButton.styleFrom())
      ),
      locale: Locale(ref.watch(languageController)[0]),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      // localizationsDelegates: const [
      //   AppLocalizations.delegate,
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      // supportedLocales: const [
      //   Locale('en', ''), // English, no country code
      //   Locale('ja', ''), // Japanese, no country code
      //   // Locale('vi', ''),
      // ],
      home: const Splash(),
    );
  }
}
