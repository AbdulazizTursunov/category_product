import 'dart:io';
import 'package:category_product/bottom_nav_bar/tab_box.dart';
import 'package:category_product/data/db/initial_db.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory? directory;
  if (Platform.isWindows) {
    directory = await getApplicationSupportDirectory();
  } else {
    directory = await getApplicationDocumentsDirectory();
  }

  if (!await directory.exists()) {
  directory.create(recursive: true);
  }
  DatabaseHelper().initDb(directory.path);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
 debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const BottomNavBar(),
    );
  }
}

