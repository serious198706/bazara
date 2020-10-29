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

  var hotTopicItems = ['SEARCH', 'MARTIN', 'SPORT', 'DATOU', 'FASHION', 'WTF'];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: customAppBar(title: 'TOPIC'),
      body: ListView(
        children: [_buildHotTags(), _buildItems()],
      ),
    );
  }

  Widget _buildHotTags() {
    return SizedBox(
      height: 96.w,
      child: ListView.builder(
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
        margin: EdgeInsets.all(8.w),
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
              child: CustomText(hotTopicItems[position], color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItems() {
    return Card(
      child: Column(
        children: [

        ],
      ),
    );
  }
}
