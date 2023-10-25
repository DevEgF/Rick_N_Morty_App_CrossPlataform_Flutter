import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ricky_n_morty_aap/home/presentation/cubit/navigation_cubit.dart';
import 'package:ricky_n_morty_aap/home/presentation/widgets/home_widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (__) => NavigationCubit(),
      child: HomeWidgets(),
    );
  }
}
