import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_handling/blocs/internet_bloc/internet_bloc.dart';
import 'package:internet_handling/blocs/internet_bloc/internet_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: BlocConsumer<InternetBloc, InternetState>(
          listener: (context, state) {
           if(state is InternetGainedState){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Internet Connected!"),
              backgroundColor: Colors.green,
              )
            );
           } else if ( state is InternetLostState){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Not Cnonnected!"),
              backgroundColor: Colors.red,
              )
            );
           }
          },
          builder: (context, state) {
            if ( state is InternetGainedState){
            return Text("Connected!");
           }
           else if(state is InternetLostState){
            return Text("Not Connected !");
           }
           else {
            return Text("Lodding .....");
           }
          },
        ),

        // child: BlocBuilder<InternetBloc, InternetState>(
        //   builder: (context, state) {
        //    //if(state ==)
        //    // == to check value
        //    //is to check datatype
        //    // double a == 2
        //    // if ( a is int)
        //    if ( state is InternetGainedState){
        //     return Text("Connected!");
        //    }
        //    else if(state is InternetLostState){
        //     return Text("Not Connected !");
        //    }
        //    else {
        //     return Text("Lodding .....");
        //    }
        //   },
        // ),
      )),
    );
  }
}
