import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multilayerapp/injection.dart';
import 'package:multilayerapp/presentation/providers/bloc/calculator/calculator_bloc.dart';
import 'package:multilayerapp/presentation/pages/calculator/calculator_screen.dart';
import 'package:multilayerapp/presentation/providers/calculator_model.dart';
import 'package:provider/provider.dart';

import 'injection.iconfig.dart';
import 'presentation/pages/main_page_screen.dart';

void main() {
  configureInjection(Env.dev);
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => CalculatorModel()),
            BlocProvider(builder: (context) => getIt<CalculatorBloc>())
          ],
      child: MyApp())
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
            initialRoute: '/',
            routes: {
              '/': (context) => MainPageScreen(),
              '/calculator': (context) => CalculatorScreen()
            }
      );
  }
}
