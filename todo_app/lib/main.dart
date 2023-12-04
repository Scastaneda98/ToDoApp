import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/injection.dart';
import 'package:todo_app/src/domain/usecases/auth/auth_usecases.dart';
import 'package:todo_app/src/domain/usecases/tasks/task_usecases.dart';
import 'package:todo_app/src/domain/usecases/users/users_usecases.dart';
import 'package:todo_app/src/presentation/pages/auth/login/login_page.dart';
import 'package:todo_app/src/presentation/pages/auth/login/login_viewmodel.dart';
import 'package:todo_app/src/presentation/pages/auth/register/register_page.dart';
import 'package:todo_app/src/presentation/pages/auth/register/register_viewmodel.dart';
import 'package:todo_app/src/presentation/pages/home/home_page.dart';
import 'package:todo_app/src/presentation/pages/home/home_viewmodel.dart';
import 'package:todo_app/src/presentation/pages/profile/profile_viewmodel.dart';
import 'package:todo_app/src/presentation/pages/tasks/create/task_create_page.dart';
import 'package:todo_app/src/presentation/pages/tasks/create/task_create_viewmodel.dart';
import 'package:todo_app/src/presentation/pages/tasks/list/tasks_list_viewmodel.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginViewModel(locator<AuthUseCases>())),
        ChangeNotifierProvider(create: (context) => RegisterViewModel(locator<AuthUseCases>())),
        ChangeNotifierProvider(create: (context) => HomeViewModel()),
        ChangeNotifierProvider(create: (context) => ProfileViewModel(locator<UsersUseCases>(), locator<AuthUseCases>())),
        ChangeNotifierProvider(create: (context) => TaskCreateViewModel(locator<AuthUseCases>(), locator<TaskUseCases>())),
        ChangeNotifierProvider(create: (context) => TasksListViewModel(locator<AuthUseCases>(),locator<TaskUseCases>()))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/login',
        routes: {
          '/login' : (BuildContext context) => const LoginPage(),
          '/register' : (BuildContext context) => const RegisterPage(),
          '/home' : (BuildContext context) => const HomePage(),
          '/task/create' : (BuildContext context) => const TaskCreatePage()
        },
      ),
    );
  }
}
