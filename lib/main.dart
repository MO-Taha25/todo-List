import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/app_theme.dart';
import 'package:todo/auth/login_screen.dart';
import 'package:todo/auth/registration_screen.dart';
import 'package:todo/home_screen.dart';
import 'package:todo/tabs/setting/setting_provider.dart';
import 'package:todo/tabs/tasks/task_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseFirestore.instance.disableNetwork();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => TaskProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => SettingsProvider(),
      )
    ],
    child: TodoApp(),
  ));
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routName: (_) => const HomeScreen(),
        LoginScreen.routName: (_) => LoginScreen(),
        RegistrScreen.routName: (_) => const RegistrScreen(),
      },
      initialRoute: HomeScreen.routName,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: settingsProvider.themeMode,
    );
  }
}
