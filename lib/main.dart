import 'package:bloc_poc/bloc/advanced/advanced_bloc.dart';
import 'package:bloc_poc/bloc/counter_cubit.dart';
import 'package:bloc_poc/bloc/pai_cubit.dart';
import 'package:bloc_poc/bloc/simple_cubit.dart';
import 'package:bloc_poc/bloc/user/user_bloc.dart';
import 'package:bloc_poc/locator.dart';
import 'package:bloc_poc/pages/counter_widget_screen.dart';
import 'package:bloc_poc/pages/user_x_page.dart';
import 'package:bloc_poc/repository/user_repository.dart';
import 'package:bloc_poc/pages/advanced_screen.dart';
import 'package:bloc_poc/pages/ant_screen.dart';
import 'package:bloc_poc/pages/bee_screen.dart';
import 'package:bloc_poc/pages/home_screen.dart';
import 'package:bloc_poc/pages/pai_screen.dart';
import 'package:bloc_poc/pages/user_page.dart';
import 'package:bloc_poc/router_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

void main() {
  Get.put(UserRepository());
  setupLocator();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterCubit()),
        BlocProvider(create: (context) => SimpleCubit()),
        BlocProvider(create: (context) => PaiCubit()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        RouteName.home: (context) => const HomeScreen(),
        RouteName.ant: (context) => const AntScreen(),
        RouteName.bee: (context) => const BeeScreen(),
        RouteName.pai: (context) => const PaiScreen(),
      },
      initialRoute: RouteName.home,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case RouteName.advanced:
            return MaterialPageRoute(
              builder:
                  (context) => BlocProvider(
                    create: (context) => AdvancedBloc(),
                    child: const AdvancedScreen(),
                  ),
            );
          case RouteName.user:
            return MaterialPageRoute(
              builder:
                  (context) => BlocProvider(
                    create:
                        (context) =>
                            UserBloc(UserRepository())..add(FetchUser()),
                    child: UserPage(),
                  ),
            );
          case RouteName.userX:
            return MaterialPageRoute(
              builder:
                  (context) => BlocProvider(
                    create:
                        (context) =>
                            UserBloc(UserRepository())..add(FetchUser()),
                    child: UserXPage(),
                  ),
            );
          case RouteName.widgetTest:
            return MaterialPageRoute(
              builder:
                  (context) => BlocProvider(
                    create:
                        (context) =>
                            UserBloc(UserRepository())..add(FetchUser()),
                    child: CounterWidget(),
                  ),
            );
        }

        return MaterialPageRoute(builder: (context) => const HomeScreen());
      },
    );
  }
}
