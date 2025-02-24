// app_project/lib/main.dart
import 'package:cached_network_image/cached_network_image.dart';
import 'package:components/components.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:main_app/ui/screen/splash.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    CachedNetworkImage.logLevel = CacheManagerLogLevel.verbose;

    return MaterialApp(
      title: 'Carousel Demo',
      theme: MainTheme().light,
      darkTheme: MainTheme().dark,
      home: const SplashPage(),
    );
  }
}