import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class SimpleBlocObserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    print(change);
  }

  @override
  void onClose(BlocBase bloc) {
    print('close: $bloc');
  }

  @override
  void onCreate(BlocBase bloc) {
    print('create: $bloc');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // TODO: implement onError
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    // TODO: implement onEvent
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    // TODO: implement onTransition
  }
}
