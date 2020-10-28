import 'dart:convert';

import 'package:bazara/pages/splash_page.dart';
import 'package:bazara/resources/routes.dart';
import 'package:bazara/resources/themes.dart';
import 'package:bazara/utils/bloc_manager.dart';
import 'package:bazara/utils/dio_util.dart';
import 'package:bazara/utils/global_sms_countdown.dart';
import 'package:bazara/utils/toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Dio dio = DioUtil.dio;
  BlocManager blocManager;
  dio.options.connectTimeout = 5000;
  dio.options.receiveTimeout = 3000;
  dio.options.responseType = ResponseType.plain;
  dio.interceptors.add(
    InterceptorsWrapper(
      onResponse: (Response response) async {
        Map<String, dynamic> result = jsonDecode(response.data);

        if (result['code'] == 10001) {
          Toast.showToast(msg: '登录态已失效，请重新登录');
          // blocManager.userBloc.add(LogoutEvent(true));
          // navigatorKey.currentState.pushAndRemoveUntil(
          //     MaterialPageRoute(builder: (_) {
          //       return LoginPage(isForce: true);
          //     }), (route) => false);
        }
        return response;
      },
      onError: (DioError e) async {
        return e;
      },
    ),
  );

  Bloc.observer = SimpleBlocObserver();
  blocManager = BlocManager(dio: dio);
  runApp(MyApp(blocManager: blocManager));
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

class MyApp extends StatefulWidget {
  final BlocManager blocManager;

  MyApp({Key key, @required this.blocManager})
      : assert(blocManager != null),
        super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    widget.blocManager.init();
    CustomRoute()..init();
  }

  @override
  void dispose() {
    super.dispose();
    GlobalSmsCountDown.destroy();
  }

  @override
  Widget build(BuildContext context) {
    // return MultiBlocProvider(
    // providers: widget.blocManager.getBlocProviders(),
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Bazara',
      theme: kLightTheme
          .getThemeData()
          .copyWith(platform: Theme.of(context).platform),
      home: SplashPage(),
    );
  }
}

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    // print('bloc $bloc onEvent $event');
    super.onEvent(bloc, event);
  }

  @override
  onTransition(Bloc bloc, Transition transition) {
    // print('bloc $bloc onTransition $transition');
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    // print('onError $error');
    super.onError(cubit, error, stackTrace);
  }
}
