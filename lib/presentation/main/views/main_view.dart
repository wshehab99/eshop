import 'package:eshop/app/localization/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../resources/others/string_manager.dart';
import '../bloc/main_cubit.dart';
import '../bloc/main_states.dart';
import '../widgets/navbar_widget.dart';
import 'pages/home_page.dart';
import 'pages/messages_page.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Widget> _pages = const [
    HomePage(),
    CategoriesPage(),
  ];

  final List<String> _titles = const [
    StringManager.home,
    StringManager.categories,
  ];
  @override
  void initState() {
    context.read<MainCubit>().initHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
        listener: _listener,
        builder: (context, state) {
          MainCubit cubit = context.read<MainCubit>();
          return Scaffold(
            key: _scaffoldKey,
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              title: Text(
                _titles[cubit.currentIndex].translate(context),
              ),
            ),
            body: _pages[cubit.currentIndex],
            bottomNavigationBar: NavbarWidget(
              onTap: cubit.changeNavBarIndex,
              currentIndex: cubit.currentIndex,
              items: [
                NavBarItem(
                  icon: const Icon(Icons.home_outlined),
                  label: StringManager.home.translate(context),
                  selectedIcon: const Icon(Icons.home),
                ),
                NavBarItem(
                  icon: const Icon(Icons.tune_outlined),
                  label: StringManager.categories.translate(context),
                  selectedIcon: const Icon(Icons.tune),
                ),
              ],
            ),
          );
        });
  }

  void _listener(BuildContext context, MainStates state) {}
}
