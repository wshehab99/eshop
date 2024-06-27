import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../resources/routing/route_generator.dart';
import '../resources/routing/route_manager.dart';
import '../resources/theme/theme_manager.dart';
import 'bloc/app_cubit.dart';
import 'bloc/app_states.dart';
import 'localization/app_localization.dart';
import 'providers/bloc_providers.dart';

//the entry point of the mobile app
class EShop extends StatelessWidget {
  const EShop({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocProvider.cubits, //app cubits from bloc_setup
      child: BlocBuilder<AppCubit, AppStates>(
        builder: (context, state) {
          return MaterialApp(
            title: "E-Shop",
            theme: ThemeManager.appTheme,
            themeMode: ThemeMode.system,
            debugShowCheckedModeBanner: false,
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            //read current language
            locale: context.read<AppCubit>().locale,
            //Generate Route for navigation between screens
            onGenerateRoute: RouteGenerator.onGenerateRoute,
            //first screen of the app
            initialRoute: RouteManager.splash,
          );
        },
      ),
    );
  }
}
