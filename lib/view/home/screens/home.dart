import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mail_tracking/core/routs.dart';
import 'package:mail_tracking/cuibts/home_screen/home_screen_cubit.dart';
import 'package:mail_tracking/main.dart';
import 'package:mail_tracking/view/home/screens/search_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeScreenCubit(),
      child: BlocBuilder<HomeScreenCubit, HomeScreenState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () {
                      var page = MaterialPageRoute(
                        builder: (context) => const SearchPage(),
                      );
                      Navigator.of(context).push(page);
                    },
                    icon: const Icon(
                      Icons.search,
                    ))
              ],
              leading: IconButton(
                  onPressed: () {
                    sharedPref.clear();

                    GoRouter.of(context).pushReplacement(AppRouts.login);
                  },
                  icon: const Icon(Icons.logout)),
              title: const Text('Mail tracting'),
            ),
            bottomNavigationBar: BottomNavigationBar(
                iconSize: 30,
                currentIndex:
                    BlocProvider.of<HomeScreenCubit>(context).selectedIndex,
                onTap: (index) {
                  BlocProvider.of<HomeScreenCubit>(context).changepage(index);
                },
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.done), label: 'Done'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.pending), label: 'Await'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.feedback), label: 'Failed'),
                ]),
            body: BlocProvider.of<HomeScreenCubit>(context)
                .pages[BlocProvider.of<HomeScreenCubit>(context).selectedIndex],
          );
        },
      ),
    );
  }
}
