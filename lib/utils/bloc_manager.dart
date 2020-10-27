import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

class BlocManager {
  // define blocs

  BlocManager({@required Dio dio}) {
    // init blocs
  }

  void init() {
    // app initial state
  }

  void destroy() {
    // close all blocs
  }

  List<BlocProvider> getBlocProviders() {
    return [
      // BlocProvider<UserBloc>(create: (_) => _userBloc),
    ];
  }
}
