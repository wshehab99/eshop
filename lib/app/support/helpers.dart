import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../config/app.dart';
import '../../data/network/info/network_info.dart';
import '../../resources/others/utils.dart';
import '../di/dependency_injection.dart';
import '../utils/app_preferences.dart';

BuildContext? currentContext;
//Dependency Injection
void register<T extends Object>(T Function() factoryFunc) =>
    DependencyInjection.sl.registerLazySingleton<T>(factoryFunc);
void registerFactory<T extends Object>(T Function() factoryFunc) =>
    DependencyInjection.sl.registerFactory<T>(factoryFunc);
T sl<T extends Object>() => DependencyInjection.sl<T>();
// Bloc Provider
BlocProvider provideBloc<T extends StateStreamableSource<Object?>>(
        T Function(BuildContext) create) =>
    BlocProvider<T>(lazy: true, create: create);

String language() => sl<AppPreferences>().getLanguage;

bool isArabic() => language() == AppConfig.ar;

//screen sizes
double height(BuildContext context) => Utils.height(context);
double width(BuildContext context) => Utils.width(context);

//navigation
Future redirect<T>(BuildContext context, String routeName, {Object? args}) =>
    Navigator.pushNamed<T>(context, routeName, arguments: args);

Future redirectReplace<T>(BuildContext context, String routeName,
        {Object? args}) =>
    Navigator.pushReplacementNamed(context, routeName, arguments: args);

Future redirectToStart<T>(BuildContext context, String routeName) =>
    Navigator.pushNamedAndRemoveUntil<T>(context, routeName, (route) => false);

void back(BuildContext context) => Navigator.pop(context);

Future<bool> get isInternetConnected => sl<NetworkInfo>().isConnected;
