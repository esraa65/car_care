import 'package:car_care/core/constants/app_colors.dart';
import 'package:car_care/presentation/cubit/navigation_bar/cubit/navigation_bar_cubit.dart';
import 'package:car_care/presentation/view/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutPage extends StatelessWidget {
  const LayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const HomePage(),
      const HomePage(),
    ];
    return Scaffold(body: BlocBuilder<NavigationBarCubit, int>(
      builder: (context, state) {
        return pages[state];
      },
    ), bottomNavigationBar:
        BlocBuilder<NavigationBarCubit, int>(builder: (context, state) {
      return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: state,
        onTap: (index) {
          context.read<NavigationBarCubit>().setPage(index);
        },
        selectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: AppColors.grey82,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColors.grey82,
        ),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: AppColors.grey82,
            ),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: AppColors.grey82,
            ),
            label: "home",
          ),
        ],
      );
    }));
  }
}
