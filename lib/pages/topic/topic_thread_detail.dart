import 'package:bazara/resources/themes.dart';
import 'package:bazara/utils/screen_util.dart';
import 'package:bazara/widgets/custom_app_bar.dart';
import 'package:bazara/widgets/custom_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class TopicThreadDetail extends StatefulWidget {
  @override
  _TopicThreadDetailState createState() => _TopicThreadDetailState();
}

class _TopicThreadDetailState extends State<TopicThreadDetail> {
  bool _followed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: '#AJ#'),
      body: ListView(
        children: [
          _buildAuthor(),
          _buildContent(),
          _buildImages(),
          Divider(),
          ..._buildComments(),
        ],
      ),
    );
  }

  Widget _buildAuthor() {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h, bottom: 8.h),
      child: Row(
        children: [
          CircleAvatar(
            radius: 16.w,
            backgroundImage: CachedNetworkImageProvider(
                'http://m.imeitou.com/uploads/allimg/2019022710/20jc1uk3zlx.jpg'),
          ),
          SizedBox(width: 8.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText('Citty')..bold(),
              SizedBox(height: 4.h),
              CustomText('1h ago', fontSize: 14.sp, color: secondaryTextColor),
            ],
          ),
          Spacer(),
          FlatButton(
            onPressed: () {
              setState(() {
                _followed = !_followed;
              });
            },
            child: Text(_followed ? 'FOLLOWED' : 'FOLLOW'),
            color: _followed ? Colors.grey : accentColor,
            textColor: Colors.white,
          )
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Text.rich(TextSpan(
          style: TextStyle(color: accentColor, fontSize: 16.sp),
          text: '#AJ#',
          children: [
            TextSpan(text: ' '),
            TextSpan(
              text:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla interdum congue laoreet. Donec vitae ultricies mauris, sit amet venenatis arcu. Phasellus at lacus tortor. Sed efficitur aliquet lectus, nec auctor lorem efficitur a. Aliquam sapien dolor, pharetra a orci vitae, congue hendrerit justo. Morbi ullamcorper sed odio in tristique. Etiam ex elit, tincidunt fringilla velit sed, maximus lacinia sapien. In pulvinar laoreet magna et luctus.\nMorbi hendrerit scelerisque dolor maximus sodales. Vivamus vitae lacus in erat placerat tincidunt. Phasellus bibendum luctus risus, at suscipit eros mattis vel. Nulla tristique maximus libero, vel volutpat enim imperdiet varius. In feugiat turpis eu dolor semper viverra. Duis non lacinia turpis, quis volutpat diam. Nunc sagittis tortor nec faucibus consequat. Morbi enim neque, iaculis in accumsan ac, gravida id dui.',
              style: TextStyle(color: primaryTextColor),
            )
          ])),
    );
  }

  Widget _buildImages() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
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
    );
  }

  List<Widget> _buildComments() {
    return [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: Text.rich(TextSpan(
            text: '189',
            style: TextStyle(fontWeight: FontWeight.bold),
            children: [
              TextSpan(text: ' '),
              TextSpan(
                  text: 'COMMENTS',
                  style: TextStyle(
                      color: secondaryTextColor, fontWeight: FontWeight.bold))
            ])),
      ),
      _buildComment(true),
      _buildComment(false),
      _buildComment(false),
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: CustomText('- NO MORE COMMENTS -', color: secondaryTextColor),
      )
    ];
  }

  Widget _buildComment(bool hasInnerComment) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 16.w,
              backgroundImage: CachedNetworkImageProvider(
                  'https://storage.inewsdb.com/7bd344074a3c5fa3bc34ba73067a617e.jpeg'),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText('MariaBoot',
                      color: accentColor, fontWeight: FontWeight.bold),
                  SizedBox(height: 8.w),
                  CustomText(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent accumsan a turpis eget elementum. Vivamus suscipit, odio eu pharetra placerat, nunc ligula posuere augue, non mattis orci elit in libero.'),
                  SizedBox(height: 8.w),
                  Row(
                    children: [
                      CustomText('10 min ago',
                          color: secondaryTextColor, fontSize: 14.sp),
                      Spacer(),
                      Icon(Icons.thumb_up,
                          color: secondaryTextColor, size: 14.sp),
                      SizedBox(width: 4.w),
                      CustomText('342',
                          color: secondaryTextColor, fontSize: 14.sp),
                      SizedBox(width: 8.w),
                      Icon(Icons.chat_bubble,
                          color: secondaryTextColor, size: 14.sp),
                      SizedBox(width: 4.w),
                      CustomText('12',
                          color: secondaryTextColor, fontSize: 14.sp),
                    ],
                  ),
                  if (hasInnerComment)
                    Container(
                      color: dividerColor,
                      margin: EdgeInsets.only(top: 8.h),
                      padding: EdgeInsets.all(12.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text.rich(
                            TextSpan(
                              text: 'Jarry Doe',
                              style: TextStyle(color: accentColor),
                              children: [
                                TextSpan(
                                    text: ' to ',
                                    style: TextStyle(color: primaryTextColor)),
                                TextSpan(
                                    text: 'W3school',
                                    style: TextStyle(color: accentColor)),
                                TextSpan(
                                    text: ':',
                                    style: TextStyle(color: primaryTextColor)),
                                TextSpan(
                                    text:
                                        'i\'ve been looking for this for a long time...',
                                    style: TextStyle(color: primaryTextColor))
                              ],
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text.rich(TextSpan(text: 'W3school', style: TextStyle(color: accentColor),
                            children: [
                              TextSpan(
                                  text: ':',
                                  style: TextStyle(color: primaryTextColor)),
                              TextSpan(
                                  text:
                                  'Etiam non auctor mauris.',
                                  style: TextStyle(color: primaryTextColor))
                            ]
                          ))
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ));
  }
}
