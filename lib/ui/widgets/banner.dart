// import 'package:earthquakes_of_world/common/constants/admob_constant.dart';
// import 'package:firebase_admob/firebase_admob.dart';
// import 'package:flutter/material.dart';

// class AdmobBanner extends StatefulWidget {
//   AdmobBanner({this.height = 50, this.width});

//   final double height;
//   final double width;

//   @override
//   _AdmobBannerState createState() => _AdmobBannerState();
// }

// class _AdmobBannerState extends State<AdmobBanner> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BannerAdPage(
//       height: widget.height,
//       width: widget.width,
//     );
//   }
// }

// class BannerAdPage extends StatefulWidget {
//   BannerAdPage({this.height, this.width});
//   final double height;
//   final double width;
//   @override
//   _BannerAdPageState createState() => _BannerAdPageState();
// }

// class _BannerAdPageState extends State<BannerAdPage> {
//   BannerAd myBanner;

//   // static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
//   //   //testDevices: testDevice != null ? <String>[testDevice] : null,
//   //   keywords: <String>['foo', 'bar'],
//   //   contentUrl: 'http://foo.com/bar.html',
//   //   childDirected: true,
//   //   nonPersonalizedAds: true,
//   // );

//   BannerAd buildBannerAd() {
//     return BannerAd(
//         adUnitId: main_addmob_technology,
//         size: AdSize.banner,
//         //targetingInfo: targetingInfo,
//         listener: (MobileAdEvent event) {
//           if (event == MobileAdEvent.loaded) {
//             myBanner..show();
//           }
//         });
//   }

//   @override
//   void initState()   {
//     super.initState();

//     myBanner = buildBannerAd()..load();
//   }

//   @override
//   void dispose() {
//     myBanner.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: widget.height,
//       width: widget.width,
//       color: Colors.red,
//     );
//   }
// }
