import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cubit/cubit/greeting_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<GreetingCubit>(
        create: (context) => GreetingCubit(),
        child: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BLoC - Cubit'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<GreetingCubit, GreetingState>(
              builder: (context, state) {
                String message = '';
                if (state is GreetingInitial) {
                  message = 'Bem vindo(a)!';
                } else if (state is GreetingSecondTime) {
                  message = 'Seu segundo acesso, legal!!';
                } else if (state is GreetingThirdTime) {
                  message = 'De novo você aqui';
                } else {
                  message = 'Vai embora cara';
                }
                return Text(
                  message,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                );
              },
            ),
            TextButton(
              onPressed: () =>
                  context.read<GreetingCubit>().nextGreetingState(),
              child: const Text('Mudar o Estado'),
            ),
            TextButton(
              onPressed: () => context.read<GreetingCubit>().resetCounting(),
              child: const Text('Resetar o Estado'),
            ),
          ],
        ),
      ),
    );
  }
}
