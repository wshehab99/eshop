import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presentation/errors/views/error_view.dart';
import '../../presentation/errors/widgets/loading.dart';
import 'base_state.dart';

class BaseBlocConsumer<B extends StateStreamable<S>, S>
    extends StatelessWidget {
  const BaseBlocConsumer(
      {super.key, required this.builder, required this.listener});

  final Widget Function(BuildContext, S) builder;
  final void Function(BuildContext, S) listener;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<B, S>(
      listener: listener,
      builder: (context, state) {
        if (state is ErrorState) return ErrorView(state.failure);
        if (state is LoadingState) {
          return const Scaffold(body: Center(child: Loading()));
        }
        return builder(context, state);
      },
    );
  }
}

class BaseBlocBuilder<B extends StateStreamable<S>, S> extends StatelessWidget {
  const BaseBlocBuilder({super.key, required this.builder});

  final Widget Function(BuildContext, S) builder;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<B, S>(
      builder: (context, state) {
        if (state is ErrorState) return ErrorView(state.failure);
        if (state is LoadingState) {
          return const Scaffold(body: Center(child: Loading()));
        }
        return builder(context, state);
      },
    );
  }
}
