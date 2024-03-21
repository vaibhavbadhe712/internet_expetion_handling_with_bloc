
import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_handling/blocs/internet_bloc/internet_event.dart';
import 'package:internet_handling/blocs/internet_bloc/internet_state.dart';

class InternetBloc extends Bloc<InternetEvent,InternetState>{
  Connectivity _connectivity=Connectivity();
  StreamSubscription? ConnectivitySubscription; 
   InternetBloc ():super(InternetInitialState()){
     on<InternetLostEvent>((event, emit)=>emit(InternetLostState()));
     on<InternetGainedEvent>((event, emit)=>emit(InternetGainedState()));




ConnectivitySubscription=_connectivity.onConnectivityChanged.listen((result) {
  if (result ==ConnectivityResult.mobile || result == ConnectivityResult.wifi){
    add(InternetGainedEvent());
  }else {
    add(InternetLostEvent());
  }
 });

   }
   @override
   Future<void> close(){
    ConnectivitySubscription?.cancel();
    return super.close();
   }
}