import 'package:base_clean_architecture/core/theme/main_theme.dart';
import 'package:flutter/material.dart';
import 'package:base_clean_architecture/injection/injection.dart' as di;
import 'package:flutter/scheduler.dart';
import 'package:base_clean_architecture/core/route/main_route.dart' as router;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final brightness = SchedulerBinding.instance?.window.platformBrightness;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Discovery',
      darkTheme: MainTheme().dark,
      theme: MainTheme().light,
      themeMode: brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light,
      onGenerateRoute: router.generateRoute,
      initialRoute: router.MovieGenreScreenRoute,
    );
  }
}
