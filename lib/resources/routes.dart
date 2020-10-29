import 'package:bazara/pages/index.dart';
import 'package:bazara/pages/topic/topic_thread_detail.dart';
import 'package:fluro/fluro.dart';

const String ROUTE_MAIN = '/main';
const String ROUTE_LOGIN = '/login';
const String ROUTE_REGISTER = '/register';
const String ROUTE_FORGET_PASSWORD = '/forget_password';
const String ROUTE_TOPIC_THREAD_DETAIL = '/topic_thread_detail';
const String ROUTE_ORDER_LIST = '/order_list';
const String ROUTE_ORDER_DETAIL = '/order_detail';
const String ROUTE_PROFILE_DETAIL = '/profile_detail';
const String ROUTE_MODIFY_PASSWORD = '/modify_password';
const String ROUTE_MODIFY_NICKNAME = '/modify_nickname';
const String ROUTE_SETTINGS = '/settings';
const String ROUTE_AGREEMENT = '/agreement';
const String ROUTE_FEEDBACK = '/feedback';
const String ROUTE_HELP = '/help';
const String ROUTE_PRIVACY = '/privacy';
const String ROUTE_ABOUT = '/about';

final router = FluroRouter();

class CustomRoute {
  var routeMap = Map<String, Handler>();

  CustomRoute() {
    routeMap[ROUTE_LOGIN] = Handler(handlerFunc: (_, __) => LoginPage());
    routeMap[ROUTE_MAIN] = Handler(handlerFunc: (_, __) => MainPage());
    routeMap[ROUTE_TOPIC_THREAD_DETAIL] = Handler(handlerFunc: (_, __) {
      return TopicThreadDetail();
    });
  }

  void init() {
    for (var key in routeMap.keys) {
      router.define(key, handler: routeMap[key]);
    }
  }
}
