import 'package:eshop/app/app.dart';
import 'package:eshop/app/di/dependency_injection.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyInjection.initializeApp();
  runApp(const EShop());
}
