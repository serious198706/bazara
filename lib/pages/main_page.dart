import 'package:bazara/pages/tab_feed.dart';
import 'package:bazara/pages/tab_notification.dart';
import 'package:bazara/pages/tab_profile.dart';
import 'package:bazara/pages/tab_topic.dart';
import 'package:bazara/widgets/updater.dart';
import 'package:bazara/utils/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../resources/themes.dart';
import '../utils/toast.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List _bottomItems = [
    {'icon': Icons.rss_feed, 'title': '', 'index': 0},
    {'icon': Icons.tag, 'title': '', 'index': 1},
    {'icon': Icons.chat_bubble_outline, 'title': '', 'index': 2},
    {'icon': Icons.person, 'title': '', 'index': 4},
  ];

  Widget _tabFeed;
  Widget _tabTopic;
  Widget _tabNotification;
  Widget _tabProfile;

  PageController _pageController;
  int _selectedIndex = 0;

  DateTime lastQuit;

  @override
  void initState() {
    super.initState();
    _tabFeed = TabFeed();
    _tabTopic = TabTopic();
    _tabNotification = TabNotification();
    _tabProfile = TabProfile();

    _pageController = PageController(initialPage: 0, keepPage: true);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light, // status bar icons' color
      ),
      child: Updater(
        child: WillPopScope(
          onWillPop: () async {
            DateTime currentQuit = DateTime.now();
            if (lastQuit == null ||
                currentQuit.difference(lastQuit).inSeconds > 2) {
              lastQuit = currentQuit;
              Toast.showToast(msg: 'Press back again to quit');
              return false;
            } else {
              return true;
            }
          },
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            child: Scaffold(
              resizeToAvoidBottomPadding: false,
              appBar: AppBar(
                brightness: Brightness.dark,
                elevation: 0.0,
                toolbarHeight: 0.0, // Hide the AppBar
              ),
              body: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: PageView.builder(
                    controller: _pageController,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (_, position) {
                      switch (position) {
                        case 0:
                          return _tabFeed;
                        case 1:
                          return _tabTopic;
                        case 2:
                          return _tabNotification;
                        case 3:
                          return _tabProfile;
                        default:
                          return Container(child: Text("good"));
                      }
                    }),
              ),
              bottomNavigationBar: BottomNavigationBar(
                items: _bottomItems
                    .map((e) => BottomNavigationBarItem(
                        icon: Icon(e['icon'], size: 24.w), label: e['title']))
                    .toList(),
                currentIndex: _selectedIndex,
                selectedItemColor: accentColor,
                unselectedItemColor: Colors.grey,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                onTap: _onItemTapped,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onItemTapped(int position) {
    _pageController.jumpToPage(position);
    setState(() {
      _selectedIndex = position;
    });
  }
}
