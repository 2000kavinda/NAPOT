import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:rashmi_s_application3/core/app_export.dart';
import 'package:rashmi_s_application3/widgets/app_bar/appbar_image.dart';
import 'package:rashmi_s_application3/widgets/app_bar/appbar_title.dart';
import 'package:rashmi_s_application3/widgets/app_bar/custom_app_bar.dart';

class BusNumber01Screen extends StatelessWidget {
  const BusNumber01Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.whiteA700,
            appBar: CustomAppBar(
                leadingWidth: getHorizontalSize(30),
                leading: AppbarImage(
                    svgPath: ImageConstant.imgArrowleft,
                    margin: getMargin(left: 16, top: 10, bottom: 13),
                    onTap: () {
                      onTapArrowleftone(context);
                    }),
                centerTitle: true,
                title: AppbarTitle(text: "Bus number 01"),
                styleType: Style.bgFill),
            body: SizedBox(
                width: double.maxFinite,
                child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                            height: getVerticalSize(190),
                            width: double.maxFinite,
                            child: Stack(alignment: Alignment.center, children: [
                              CustomImageView(
                                  imagePath: ImageConstant.imgRectangle4025,
                                  height: getVerticalSize(190),
                                  width: getHorizontalSize(360),
                                  alignment: Alignment.center),
                              Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                      padding: getPadding(
                                          left: 16,
                                          top: 13,
                                          right: 16,
                                          bottom: 13),
                                      decoration: AppDecoration.fillBlack,
                                      child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Padding(
                                                padding: getPadding(top: 71),
                                                child: Text("Kottawa",
                                                    style: theme
                                                        .textTheme.titleLarge)),
                                            Padding(
                                                padding: getPadding(top: 3),
                                                child: Text(
                                                    "NSBM Green University",
                                                    style: theme
                                                        .textTheme.titleMedium)),
                                            Padding(
                                                padding: getPadding(top: 2),
                                                child: Row(children: [
                                                  CustomImageView(
                                                      svgPath:
                                                          ImageConstant.imgSearch,
                                                      height: getSize(11),
                                                      width: getSize(11),
                                                      margin: getMargin(top: 2)),
                                                  Padding(
                                                      padding:
                                                          getPadding(left: 5),
                                                      child: Text(
                                                          "arrival at 09.00 a.m.",
                                                          style: theme.textTheme
                                                              .labelMedium))
                                                ])),
                                            CustomImageView(
                                                svgPath:
                                                    ImageConstant.imgGroup410,
                                                height: getVerticalSize(7),
                                                width: getHorizontalSize(35),
                                                margin: getMargin(top: 18))
                                          ])))
                            ])),
                        Container(
                            height: getVerticalSize(430),
                            width: getHorizontalSize(317),
                            margin: getMargin(top: 30),
                            child: Stack(alignment: Alignment.center, children: [
                              Align(
                                  alignment: Alignment.topCenter,
                                  child: Padding(
                                      padding: getPadding(top: 11),
                                      child: Text("+",
                                          style: theme.textTheme.headlineLarge))),
                              Align(
                                  alignment: Alignment.center,
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text("08.00 a.m.",
                                                        style: theme.textTheme
                                                            .titleSmall),
                                                    Padding(
                                                        padding:
                                                            getPadding(top: 2),
                                                        child: Text(
                                                            "Kottawa Main Bus Station",
                                                            style: CustomTextStyles
                                                                .titleSmallMedium))
                                                  ]),
                                              Container(
                                                  height: getSize(21),
                                                  width: getSize(21),
                                                  margin: getMargin(
                                                      top: 8, bottom: 8),
                                                  decoration: BoxDecoration(
                                                      color: appTheme.whiteA700,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              getHorizontalSize(
                                                                  10)),
                                                      border: Border.all(
                                                          color:
                                                              appTheme.gray70001,
                                                          width:
                                                              getHorizontalSize(
                                                                  2))))
                                            ]),
                                        Padding(
                                            padding: getPadding(top: 17),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                      children: [
                                                        Text("08.10 a.m.",
                                                            style: theme.textTheme
                                                                .titleSmall),
                                                        Padding(
                                                            padding: getPadding(
                                                                top: 2),
                                                            child: Text(
                                                                "Makubura Main Bus Station",
                                                                style: CustomTextStyles
                                                                    .titleSmallMedium))
                                                      ]),
                                                  Container(
                                                      height: getSize(21),
                                                      width: getSize(21),
                                                      margin: getMargin(
                                                          top: 8, bottom: 8),
                                                      decoration: BoxDecoration(
                                                          color:
                                                              appTheme.whiteA700,
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  getHorizontalSize(
                                                                      10)),
                                                          border: Border.all(
                                                              color: appTheme
                                                                  .gray70001,
                                                              width:
                                                                  getHorizontalSize(
                                                                      2))))
                                                ])),
                                        Padding(
                                            padding: getPadding(top: 17),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                      children: [
                                                        Text("08.15 a.m.",
                                                            style: theme.textTheme
                                                                .titleSmall),
                                                        Padding(
                                                            padding: getPadding(
                                                                top: 2),
                                                            child: Text(
                                                                "Makubura Main Bus Station",
                                                                style: CustomTextStyles
                                                                    .titleSmallMedium))
                                                      ]),
                                                  Container(
                                                      height: getSize(21),
                                                      width: getSize(21),
                                                      margin: getMargin(
                                                          top: 8, bottom: 8),
                                                      decoration: BoxDecoration(
                                                          color:
                                                              appTheme.whiteA700,
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  getHorizontalSize(
                                                                      10)),
                                                          border: Border.all(
                                                              color: appTheme
                                                                  .gray70001,
                                                              width:
                                                                  getHorizontalSize(
                                                                      2))))
                                                ])),
                                        Padding(
                                            padding: getPadding(top: 17),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                      children: [
                                                        Text("08.20 a.m.",
                                                            style: theme.textTheme
                                                                .titleSmall),
                                                        Padding(
                                                            padding: getPadding(
                                                                top: 2),
                                                            child: Text(
                                                                "Makubura Main Bus Station",
                                                                style: CustomTextStyles
                                                                    .titleSmallMedium))
                                                      ]),
                                                  Container(
                                                      height: getSize(21),
                                                      width: getSize(21),
                                                      margin: getMargin(
                                                          top: 8, bottom: 8),
                                                      decoration: BoxDecoration(
                                                          color:
                                                              appTheme.whiteA700,
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  getHorizontalSize(
                                                                      10)),
                                                          border: Border.all(
                                                              color: appTheme
                                                                  .gray70001,
                                                              width:
                                                                  getHorizontalSize(
                                                                      2))))
                                                ])),
                                        Padding(
                                            padding: getPadding(top: 17),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                      children: [
                                                        Text("08.25 a.m.",
                                                            style: theme.textTheme
                                                                .titleSmall),
                                                        Padding(
                                                            padding: getPadding(
                                                                top: 2),
                                                            child: Text(
                                                                "Makubura Main Bus Station",
                                                                style: CustomTextStyles
                                                                    .titleSmallMedium))
                                                      ]),
                                                  Container(
                                                      height: getSize(21),
                                                      width: getSize(21),
                                                      margin: getMargin(
                                                          top: 8, bottom: 8),
                                                      decoration: BoxDecoration(
                                                          color:
                                                              appTheme.whiteA700,
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  getHorizontalSize(
                                                                      10)),
                                                          border: Border.all(
                                                              color: appTheme
                                                                  .gray70001,
                                                              width:
                                                                  getHorizontalSize(
                                                                      2))))
                                                ])),
                                        Padding(
                                            padding: getPadding(top: 17),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                      children: [
                                                        Text("08.30 a.m.",
                                                            style: theme.textTheme
                                                                .titleSmall),
                                                        Padding(
                                                            padding: getPadding(
                                                                top: 2),
                                                            child: Text(
                                                                "Makubura Main Bus Station",
                                                                style: CustomTextStyles
                                                                    .titleSmallMedium))
                                                      ]),
                                                  Container(
                                                      height: getSize(21),
                                                      width: getSize(21),
                                                      margin: getMargin(
                                                          top: 4, bottom: 12),
                                                      decoration: BoxDecoration(
                                                          color:
                                                              appTheme.whiteA700,
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  getHorizontalSize(
                                                                      10)),
                                                          border: Border.all(
                                                              color: appTheme
                                                                  .gray70001,
                                                              width:
                                                                  getHorizontalSize(
                                                                      2))))
                                                ])),
                                        Padding(
                                            padding: getPadding(top: 17),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                      children: [
                                                        Text("08.35 a.m.",
                                                            style: theme.textTheme
                                                                .titleSmall),
                                                        Padding(
                                                            padding: getPadding(
                                                                top: 2),
                                                            child: Text(
                                                                "Makubura Main Bus Station",
                                                                style: CustomTextStyles
                                                                    .titleSmallMedium))
                                                      ]),
                                                  Container(
                                                      height: getSize(21),
                                                      width: getSize(21),
                                                      margin: getMargin(
                                                          top: 8, bottom: 8),
                                                      decoration: BoxDecoration(
                                                          color:
                                                              appTheme.whiteA700,
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  getHorizontalSize(
                                                                      10)),
                                                          border: Border.all(
                                                              color: appTheme
                                                                  .gray70001,
                                                              width:
                                                                  getHorizontalSize(
                                                                      2))))
                                                ])),
                                        Padding(
                                            padding: getPadding(top: 17),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                      children: [
                                                        Text("08.40 a.m.",
                                                            style: theme.textTheme
                                                                .titleSmall),
                                                        Padding(
                                                            padding: getPadding(
                                                                top: 2),
                                                            child: Text(
                                                                "Makubura Main Bus Station",
                                                                style: CustomTextStyles
                                                                    .titleSmallMedium))
                                                      ]),
                                                  Container(
                                                      height: getSize(21),
                                                      width: getSize(21),
                                                      margin: getMargin(
                                                          top: 8, bottom: 8),
                                                      decoration: BoxDecoration(
                                                          color:
                                                              appTheme.whiteA700,
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  getHorizontalSize(
                                                                      10)),
                                                          border: Border.all(
                                                              color: appTheme
                                                                  .gray70001,
                                                              width:
                                                                  getHorizontalSize(
                                                                      2))))
                                                ]))
                                      ]))
                            ])),
                        Padding(
                            padding: getPadding(top: 74),
                            child: SizedBox(
                                width: getHorizontalSize(161), child: Divider()))
                      ]),
                )),
            bottomNavigationBar: SizedBox(
                child: Container(
                    padding: getPadding(left: 99, top: 5, right: 99, bottom: 5),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: fs.Svg(ImageConstant.imgGroup4),
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
