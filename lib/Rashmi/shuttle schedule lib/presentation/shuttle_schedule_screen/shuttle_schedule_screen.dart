import '../shuttle_schedule_screen/widgets/shuttle_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:rashmi_s_application1/core/app_export.dart';
import 'package:rashmi_s_application1/widgets/app_bar/appbar_image.dart';
import 'package:rashmi_s_application1/widgets/app_bar/appbar_title.dart';
import 'package:rashmi_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:rashmi_s_application1/widgets/custom_elevated_button.dart';

class ShuttleScheduleScreen extends StatelessWidget {
  const ShuttleScheduleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.whiteA700,
            body: SizedBox(
                width: double.maxFinite,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: getVerticalSize(241),
                          width: double.maxFinite,
                          child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                CustomAppBar(
                                    leadingWidth: getHorizontalSize(30),
                                    leading: AppbarImage(
                                        svgPath: ImageConstant.imgArrowleft,
                                        margin: getMargin(
                                            left: 16, top: 10, bottom: 13),
                                        onTap: () {
                                          onTapArrowleftone(context);
                                        }),
                                    centerTitle: true,
                                    title:
                                        AppbarTitle(text: "Shuttle schedule"),
                                    styleType: Style.bgFill),
                                CustomImageView(
                                    imagePath: ImageConstant.imgRectangle4024,
                                    height: getVerticalSize(202),
                                    width: getHorizontalSize(360),
                                    alignment: Alignment.bottomCenter)
                              ])),
                      Expanded(
                          child: SingleChildScrollView(
                              child: Container(
                                  height: getVerticalSize(871),
                                  width: getHorizontalSize(358),
                                  margin: getMargin(left: 2),
                                  child: Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                                margin: getMargin(
                                                    left: 3, right: 6),
                                                decoration:
                                                    AppDecoration.fillWhiteA,
                                                child: ListView.separated(
                                                    physics:
                                                        NeverScrollableScrollPhysics(),
                                                    shrinkWrap: true,
                                                    separatorBuilder:
                                                        (context, index) {
                                                      return SizedBox(
                                                          height:
                                                              getVerticalSize(
                                                                  13));
                                                    },
                                                    itemCount: 4,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return ShuttleItemWidget();
                                                    }))),
                                        Align(
                                            alignment: Alignment.bottomCenter,
                                            child: SizedBox(
                                                height: getVerticalSize(160),
                                                width: getHorizontalSize(338),
                                                child: Stack(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    children: [
                                                      Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Container(
                                                              decoration: AppDecoration
                                                                  .fillIndigo200
                                                                  .copyWith(
                                                                      borderRadius:
                                                                          BorderRadiusStyle
                                                                              .roundedBorder11),
                                                              child: Container(
                                                                  height:
                                                                      getVerticalSize(
                                                                          37),
                                                                  width:
                                                                      getHorizontalSize(
                                                                          338),
                                                                  decoration: BoxDecoration(
                                                                      color: appTheme
                                                                          .indigo900,
                                                                      borderRadius:
                                                                          BorderRadius.vertical(
                                                                              top: Radius.circular(getHorizontalSize(11))))))),
                                                      Align(
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: Padding(
                                                              padding:
                                                                  getPadding(
                                                                      left: 17,
                                                                      top: 10),
                                                              child: Text(
                                                                  "Bus number 01",
                                                                  style: theme
                                                                      .textTheme
                                                                      .titleSmall))),
                                                      Align(
                                                          alignment: Alignment
                                                              .bottomCenter,
                                                          child: Padding(
                                                              padding:
                                                                  getPadding(
                                                                      left: 15,
                                                                      right: 15,
                                                                      bottom:
                                                                          10),
                                                              child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                        padding: getPadding(
                                                                            left:
                                                                                3,
                                                                            right:
                                                                                23),
                                                                        child: Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Text("Kottawa", style: CustomTextStyles.labelLargeInterGray80001),
                                                                              Text("NSBM", style: CustomTextStyles.labelLargeInterGray80001)
                                                                            ])),
                                                                    Padding(
                                                                        padding: getPadding(
                                                                            left:
                                                                                3,
                                                                            top:
                                                                                11,
                                                                            right:
                                                                                1),
                                                                        child: Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Text("08.00 a.m.", style: CustomTextStyles.labelLargeInterWhiteA700ExtraBold),
                                                                              Text("09.00 a.m.", style: CustomTextStyles.labelLargeInterWhiteA700ExtraBold)
                                                                            ])),
                                                                    Padding(
                                                                        padding: getPadding(
                                                                            left:
                                                                                3,
                                                                            top:
                                                                                3),
                                                                        child: Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Text("04.00 p.m.", style: CustomTextStyles.labelLargeInterWhiteA700ExtraBold),
                                                                              Text("05.00 p.m.", style: CustomTextStyles.labelLargeInterWhiteA700ExtraBold)
                                                                            ])),
                                                                    CustomElevatedButton(
                                                                        height: getVerticalSize(
                                                                            30),
                                                                        width: getHorizontalSize(
                                                                            120),
                                                                        text:
                                                                            "Book now",
                                                                        margin: getMargin(
                                                                            top:
                                                                                14),
                                                                        buttonStyle:
                                                                            CustomButtonStyles
                                                                                .fillTeal,
                                                                        buttonTextStyle:
                                                                            CustomTextStyles.labelLargeInterWhiteA700ExtraBold)
                                                                  ]))),
                                                      Align(
                                                          alignment: Alignment
                                                              .topRight,
                                                          child: Padding(
                                                              padding:
                                                                  getPadding(
                                                                      top: 11,
                                                                      right:
                                                                          20),
                                                              child: Text(
                                                                  " Kottawa - NSBM",
                                                                  style: CustomTextStyles
                                                                      .labelLargeInterGray300))),
                                                      Align(
                                                          alignment: Alignment
                                                              .topCenter,
                                                          child: Padding(
                                                              padding:
                                                                  getPadding(
                                                                      top: 19),
                                                              child: SizedBox(
                                                                  width:
                                                                      getHorizontalSize(
                                                                          161),
                                                                  child:
                                                                      Divider())))
                                                    ]))),
                                        Align(
                                            alignment: Alignment.topCenter,
                                            child: Container(
                                                padding: getPadding(all: 13),
                                                decoration:
                                                    AppDecoration.fillBlack,
                                                child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Container(
                                                          width:
                                                              getHorizontalSize(
                                                                  164),
                                                          margin: getMargin(
                                                              top: 63),
                                                          child: Text(
                                                              "NSBM \nShuttle Service",
                                                              maxLines: 2,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: theme
                                                                  .textTheme
                                                                  .titleLarge!
                                                                  .copyWith(
                                                                      height:
                                                                          1.20))),
                                                      Text(
                                                          "Now you can easily book your shuttle here",
                                                          style: CustomTextStyles
                                                              .labelLargeInterWhiteA700),
                                                      CustomImageView(
                                                          svgPath: ImageConstant
                                                              .imgGroup410,
                                                          height:
                                                              getVerticalSize(
                                                                  7),
                                                          width:
                                                              getHorizontalSize(
                                                                  35),
                                                          alignment:
                                                              Alignment.center,
                                                          margin: getMargin(
                                                              top: 41))
                                                    ]))),
                                        Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Container(
                                                height: getVerticalSize(94),
                                                width: getHorizontalSize(349),
                                                margin: getMargin(bottom: 125),
                                                child: Stack(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    children: [
                                                      Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Container(
                                                              margin: getMargin(
                                                                  left: 1),
                                                              padding:
                                                                  getPadding(
                                                                      left: 19,
                                                                      top: 7,
                                                                      right: 19,
                                                                      bottom:
                                                                          7),
                                                              decoration:
                                                                  AppDecoration
                                                                      .fillGray,
                                                              child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .end,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Padding(
                                                                        padding: getPadding(
                                                                            left:
                                                                                82,
                                                                            top:
                                                                                2),
                                                                        child: Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.end,
                                                                            children: [
                                                                              Padding(
                                                                                  padding: getPadding(top: 1),
                                                                                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: [
                                                                                    Text("Starting Time", style: theme.textTheme.labelLarge),
                                                                                    SizedBox(
                                                                                        height: getVerticalSize(23),
                                                                                        width: getHorizontalSize(94),
                                                                                        child: Stack(alignment: Alignment.bottomCenter, children: [
                                                                                          Align(alignment: Alignment.topCenter, child: Text("Kottawa - 08.00 am", style: theme.textTheme.labelMedium)),
                                                                                          Align(alignment: Alignment.bottomCenter, child: Text("NSBM     - 09.00 am", style: theme.textTheme.labelMedium))
                                                                                        ]))
                                                                                  ])),
                                                                              Padding(
                                                                                  padding: getPadding(left: 37),
                                                                                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: [
                                                                                    Text("Arrival Time", style: theme.textTheme.labelLarge),
                                                                                    Padding(padding: getPadding(top: 1), child: Text("Kottawa - 08.00 am", style: theme.textTheme.labelMedium)),
                                                                                    Text("NSBM     - 09.00 am", style: theme.textTheme.labelMedium)
                                                                                  ]))
                                                                            ])),
                                                                    Container(
                                                                        margin: getMargin(
                                                                            left:
                                                                                80,
                                                                            top:
                                                                                16,
                                                                            right:
                                                                                80),
                                                                        padding: getPadding(
                                                                            left:
                                                                                16,
                                                                            top:
                                                                                3,
                                                                            right:
                                                                                16,
                                                                            bottom:
                                                                                3),
                                                                        decoration: AppDecoration.fillGreen.copyWith(
                                                                            borderRadius: BorderRadiusStyle
                                                                                .roundedBorder5),
                                                                        child: Padding(
                                                                            padding:
                                                                                getPadding(top: 1),
                                                                            child: Text("Track now", style: theme.textTheme.labelSmall)))
                                                                  ]))),
                                                      Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Container(
                                                              decoration:
                                                                  AppDecoration
                                                                      .fillBlueA,
                                                              child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Container(
                                                                        padding: getPadding(
                                                                            left:
                                                                                7,
                                                                            top:
                                                                                6,
                                                                            right:
                                                                                7,
                                                                            bottom:
                                                                                6),
                                                                        decoration:
                                                                            AppDecoration
                                                                                .fillIndigo,
                                                                        child: Column(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            children: [
                                                                              Text("Bus Route", style: CustomTextStyles.labelLargeWhiteA700),
                                                                              Text("Kottawa - NSBM", style: CustomTextStyles.labelSmallSFProDisplay)
                                                                            ])),
                                                                    Container(
                                                                        width: getHorizontalSize(
                                                                            61),
                                                                        margin: getMargin(
                                                                            left:
                                                                                9,
                                                                            top:
                                                                                2,
                                                                            bottom:
                                                                                7),
                                                                        child: Text(
                                                                            "Shuttle \n01",
                                                                            maxLines:
                                                                                2,
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            textAlign: TextAlign.center,
                                                                            style: theme.textTheme.titleMedium!.copyWith(height: 1.41)))
                                                                  ])))
                                                    ])))
                                      ]))))
                    ])),
            bottomNavigationBar: SizedBox(
                child: Container(
                    padding: getPadding(left: 99, top: 5, right: 99, bottom: 5),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: fs.Svg(ImageConstant.imgGroup19),
                            fit: BoxFit.cover)),
                    child: Container(
                        height: getVerticalSize(6),
                        width: getHorizontalSize(161),
                        margin: getMargin(top: 46),
                        decoration: BoxDecoration(
                            color: appTheme.gray400,
                            borderRadius: BorderRadius.circular(
                                getHorizontalSize(3))))))));
  }

  /// Navigates back to the previous screen.
  ///
  /// This function takes a [BuildContext] object as a parameter, which is used
  /// to navigate back to the previous screen.
  onTapArrowleftone(BuildContext context) {
    Navigator.pop(context);
  }
}
