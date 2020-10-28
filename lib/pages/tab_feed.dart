import 'package:bazara/pages/article_page.dart';
import 'package:bazara/widgets/custom_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:bazara/utils/screen_util.dart';
import 'package:bazara/resources/themes.dart';
import 'package:carousel_slider/carousel_slider.dart';

class TabFeed extends StatefulWidget {
  @override
  _TabFeedState createState() => _TabFeedState();
}

class _TabFeedState extends State<TabFeed> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return SafeArea(
        child: Scaffold(
      backgroundColor: windowBgColor,
      body: Column(
        children: [
          _buildTopBar(),
          _buildTab(),
          Expanded(
            child: _buildList(),
          ),
        ],
      ),
    ));
  }

  Widget _buildTopBar() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        children: [
          CircleAvatar(
            radius: 16.w,
            backgroundImage: NetworkImage(
              'http://m.imeitou.com/uploads/allimg/2019022710/20jc1uk3zlx.jpg',
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                  color: dividerColor,
                  borderRadius: BorderRadius.all(Radius.circular(4.w))),
              child: Row(
                children: [
                  Icon(Icons.search, color: primaryTextColor),
                  Spacer()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTab() {
    return DefaultTabController(
      length: 10,
      child: TabBar(
          isScrollable: true,
          labelColor: accentColor,
          labelStyle: TextStyle(fontSize: 14.sp),
          unselectedLabelColor: secondaryTextColor,
          unselectedLabelStyle: TextStyle(fontSize: 14.sp),
          indicatorColor: accentColor,
          indicatorSize: TabBarIndicatorSize.label,
          tabs: [
            Tab(text: 'TIMELINE'),
            Tab(text: 'TRENDING'),
            Tab(text: 'SPORT'),
            Tab(text: 'MARTIN'),
            Tab(text: 'FASHION'),
            Tab(text: 'TRY-ON'),
            Tab(text: 'CLOTHES'),
            Tab(text: 'SOCKS'),
            Tab(text: 'HARD'),
            Tab(text: 'SPLENDED'),
          ]),
    );
  }

  Widget _buildList() {
    return ListView(
      children: [
        _buildBanner(),
        _buildItem(true),
        _buildItem(false),
        _buildItem(true),
        _buildItem(false),
      ],
    );
  }

  Widget _buildBanner() {
    final List<String> imgList = [
      'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
      'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
      'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
      'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
    ];

    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 2.0,
        viewportFraction: 0.8,
        enlargeCenterPage: true,
      ),
      items: imgList
          .map(
            (item) => Container(
              margin: EdgeInsets.all(8.w),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.network(item, fit: BoxFit.cover, width: 1000.0),
                    ],
                  )),
            ),
          )
          .toList(),
    );
  }

  Widget _buildItem(bool withImage) {
    return GestureDetector(
      onTap: withImage ? _gotoWeb : _gotoDetail,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
        child: Card(
          child: Column(
            children: [
              if (withImage)
                AspectRatio(
                  aspectRatio: 2,
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://www.target.com.au/medias/static_content/product/images/full/07/18/A1390718.jpg?impolicy=desktop_hero',
                    width: 1.sw,
                    fit: BoxFit.cover,
                  ),
                ),
              Container(
                padding: EdgeInsets.all(12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8.w),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 17.w,
                          backgroundColor: dividerColor,
                          child: CircleAvatar(
                            radius: 16.w,
                            backgroundColor: Colors.white,
                            backgroundImage: CachedNetworkImageProvider(
                                'https://www.moko.com.hk/wp-content/uploads/2018/12/408-417-adidas-02.png'),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        CustomText('Adidas', fontWeight: FontWeight.bold),
                        Spacer(),
                        CustomText('5min ago',
                            fontSize: 14.sp, color: secondaryTextColor),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    CustomText('COME BACK WHEN DEC/1!!!')..bold(),
                    SizedBox(height: 8.h),
                    CustomText(
                        'Enjoy 30% selected full price items and up to 50% off outlet items!'),
                    SizedBox(height: 8.h),
                    CustomText('#SALES #TGIF #PRICE-OFF # OUTLETS',
                        color: accentColor),
                    if (!withImage)
                      SizedBox(height: 8.h),
                    if (!withImage)
                      Row(
                        children: [
                          Expanded(
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: CachedNetworkImage(
                                imageUrl:
                                'https://www.rei.com/dam/content_team_010818_52427_htc_running_shoes_hero2_lg.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Expanded(
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: CachedNetworkImage(
                                imageUrl:
                                'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/cushion-shoes-7659-1584132587.jpg?crop=1.00xw:0.701xh;0,0.229xh&resize=1200:*',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Expanded(
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: CachedNetworkImage(
                                imageUrl:
                                'https://www.opt.net.au/wp-content/uploads/2015/11/Buying-Your-Next-Pair-of-Running-Shoes-2.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.remove_red_eye, color: Colors.deepPurple),
                        SizedBox(width: 4.w),
                        CustomText('1.6k', color: secondaryTextColor),
                        SizedBox(width: 8.w),
                        Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                        SizedBox(width: 4.w),
                        CustomText('1.6k', color: secondaryTextColor),
                      ],
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  void _gotoWeb() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return ArticlePage(url: 'https://www.adidas.com/us/blog/342735-how-to-lace-running-shoes', title: 'HOW TO LACE RUNNING SHOES');
    }));
  }

  void _gotoDetail() {

  }
}
