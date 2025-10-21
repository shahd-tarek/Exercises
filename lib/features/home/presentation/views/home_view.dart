import 'package:dio/dio.dart';
import 'package:exercises/features/home/data/repo/home_repo.dart';
import 'package:exercises/features/home/data/cubit/home_cubit.dart';
import 'package:exercises/features/home/presentation/widgets/bottom_app_bar.dart';
import 'package:exercises/features/home/presentation/widgets/home_view_body.dart';
import 'package:exercises/features/profile/presentation/views/profile.dart';
import 'package:exercises/features/workout/presentation/views/workout_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [HomeViewBody(), WorkOutView(), ProfileView()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(HomeRepo(Dio())),
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
