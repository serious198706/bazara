import 'package:bazara/resources/themes.dart';
import 'package:bazara/utils/screen_util.dart';
import 'package:bazara/widgets/custom_app_bar.dart';
import 'package:bazara/widgets/custom_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class TabTopic extends StatefulWidget {
  @override
  _TabTopicState createState() => _TabTopicState();
}

class _TabTopicState extends State<TabTopic>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  var hotTopicItems = ['SEARCH', 'MARTIN', 'SPORT', 'DATOU', 'FASHION', 'WTF', 'AFAN'];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: customAppBar(title: 'TOPIC', showBack: false),
      body: ListView(
        children: [_buildHotTags(), _buildItems()],
      ),
    );
  }

  Widget _buildHotTags() {
    return SizedBox(
      height: 96.w,
      child: ListView.builder(
        padding: EdgeInsets.all(12.w),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: hotTopicItems.length,
        itemBuilder: _buildHotTagItem,
      ),
    );
  }

  Widget _buildHotTagItem(BuildContext context, int position) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(40.w))),
        margin: EdgeInsets.symmetric(horizontal: 4.h, vertical: 4.w),
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl:
                  'https://www.rei.com/dam/content_team_010818_52427_htc_running_shoes_hero2_lg.jpg',
              height: 96.w,
              fit: BoxFit.cover,
            ),
            Container(
              alignment: Alignment.center,
              color: Colors.black54,
              child: CustomText(hotTopicItems[position], color: Colors.white, fontSize: 14.sp),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItems() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      margin: EdgeInsets.only(bottom: 12.w),
      child: Card(
        child: Column(
          children: [
            _buildItem(),
            _buildItem(),
            _buildItem(),
            _buildItem(),
            _buildItem(),
            _buildItem(),
            _buildItem(),
            _buildItem(),
            _buildItem(),
            _buildItem(),
            _buildItem(),
            _buildItem(),
            _buildItem(),
          ],
        ),
      ),
    );
  }

  Widget _buildItem() {
    return Container(
      padding: EdgeInsets.all(16.w),
      child: Row(
        children: [
            SizedBox(
              width: 64.w,
              height: 64.w,
              child: AspectRatio(
              aspectRatio: 1,
              child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3540787812,2042677663&fm=26&gp=0.jpg',
                ),
              ),
            ),
          SizedBox(width: 12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText('AJ'),
              SizedBox(height: 4.h),
              Row(
                children: [
                  Icon(Icons.local_fire_department_rounded),
                  SizedBox(width: 4.w),
                  CustomText('75.2k'),
                  SizedBox(width: 12.w),
                  Icon(Icons.messenger_outlined),
                  SizedBox(width: 4.w),
                  CustomText('12.9k'),
                ],
              )
            ],
          ),
          Spacer(),
          Icon(Icons.chevron_right)
        ],
      ),
    );

  }
}
