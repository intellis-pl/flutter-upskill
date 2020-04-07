import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multilayerapp/injection.dart';
import 'package:multilayerapp/presentation/bloc/calculator/calculator_bloc.dart';
import 'package:multilayerapp/presentation/pages/calculator/calculator_screen.dart';
import 'injection.iconfig.dart';
import 'presentation/pages/main_page_screen.dart';

void main() {
  configureInjection(Env.dev);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        builder: (context) => getIt<CalculatorBloc>(),
        child: MaterialApp(
            initialRoute: '/',
            routes: {
              '/': (context) => MainPageScreen(),
              '/calculator': (context) => CalculatorScreen()
            }
        ),
      ),
    );
  }
}
