import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:movie_provider/providers/movie_provider.dart';
import 'package:provider/provider.dart';
import 'screens/screens.dart';
import 'utils/themes/theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MovieProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: theme(),
        getPages: [
          GetPage(name: '/search', page: () => SearchScreen()),
          // GetPage(name: '/movie', page: () => MovieScreen(movie: ,)),
        ],
        initialRoute: '/search',
      ),
      designSize: const Size(360, 640),
    );
  }
}
