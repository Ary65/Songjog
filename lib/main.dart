import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:songjog/localizations/app_locale.dart';
import 'package:songjog/routers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterLocalization.instance.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  final FlutterLocalization localization = FlutterLocalization.instance;

  @override
  void initState() {
    localization.init(
      mapLocales: [
        const MapLocale('en', AppLocale.EN),
        const MapLocale('bn', AppLocale.BN),
      ],
      initLanguageCode: 'bn',
    );
    localization.onTranslatedLanguage = _onTranslatedLanguage;
    super.initState();
  }

// the setState function here is a must to add
  void _onTranslatedLanguage(Locale? locale) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // var darkMode = ref.watch(darkModeProvider);
    // ThemeMode currentThemeMode = darkMode ? ThemeMode.dark : ThemeMode.light;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp.router(
        title: 'Songjog',
        // theme: lightThemeData(context),
        // darkTheme: darkThemeData(context),
        // themeMode: currentThemeMode,
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        supportedLocales: localization.supportedLocales,
        localizationsDelegates: localization.localizationsDelegates,
      ),
    );
  }
}
