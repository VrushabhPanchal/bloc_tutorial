import 'package:bloc_tutorial/cubit/counter_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              BlocConsumer<CounterCubit, CounterState>(
                 listener: (context, state) {
          if(state.wasIncremented == true){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Incremented"),duration: Duration(milliseconds: 300),));
          }
          else if(state.wasIncremented == false){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Decremented"),duration: Duration(milliseconds: 300)));
          }
        },
                builder: (context, state) {
                  if (state.counterValue < 0) {
                    return Text(
                      " Bro its Nagative integer " +
                          state.counterValue.toString(),
                      style: Theme.of(context).textTheme.headlineMedium,
                    );
                  } else if (state.counterValue % 2 == 0) {
                    return Text(
                      "Yaay" + state.counterValue.toString(),
                      style: Theme.of(context).textTheme.headlineMedium,
                    );
                  } else if (state.counterValue == 5) {
                    return Text(
                      "Hmm Number 5" + state.counterValue.toString(),
                      style: Theme.of(context).textTheme.headlineMedium,
                    );
                  }
                  return Text(
                    state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                },
              ),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context).increment();
                        //  context.bloc<CounterCubit>().increment();
                      },
                      child: Center(
                        child: Icon(Icons.add),
                      )),
                  ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context).decrement();
                        // context.bloc<CounterCubit>();
                      },
                      child: Center(
                        child: Icon(Icons.remove),
                      )),
                ],
              )
            ],
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
