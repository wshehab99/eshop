import 'package:get_it/get_it.dart';

import 'initializer/bloc/bloc_initializer.dart';
import 'initializer/network/network_initializer.dart';
import 'initializer/services/services_initializer.dart';

//main file for singleton the app
//and run the required methods before the runApp method
abstract class DependencyInjection {
  static final GetIt sl = GetIt.instance;
  //set the main objects of the app before app run
  static Future<void> initializeApp() async {
    sl.allowReassignment = true;

    await ServicesInitializer.initializeServices();
    //network || apis || repositories
    NetworkInitializer.setNetwork();
    //cubits
    BlocInitializer.setCubits();
  }
}
