import 'package:dio/dio.dart';
import 'package:exercises/core/repo/api_repo.dart';
import 'package:exercises/features/home/data/cubit/home_cubit.dart';
import 'package:exercises/features/home/presentation/widgets/bottom_app_bar.dart';
import 'package:exercises/features/home/presentation/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeViewBody(),
    const Center(child: Text("Workout Page", style: TextStyle(fontSize: 22))),
    const Center(child: Text("Profile Page", style: TextStyle(fontSize: 22))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(ApiRepo(Dio())),
      child: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: CustomBottomAppBar(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
      ),
    );
  }
}
