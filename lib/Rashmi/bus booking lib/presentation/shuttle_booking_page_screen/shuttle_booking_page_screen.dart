import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:rashmi_s_application2/core/app_export.dart';
import 'package:rashmi_s_application2/widgets/app_bar/appbar_image.dart';
import 'package:rashmi_s_application2/widgets/app_bar/appbar_title.dart';
import 'package:rashmi_s_application2/widgets/app_bar/custom_app_bar.dart';
import 'package:rashmi_s_application2/widgets/custom_elevated_button.dart';
import 'package:rashmi_s_application2/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class ShuttleBookingPageScreen extends StatelessWidget {
  ShuttleBookingPageScreen({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();

  TextEditingController edittextController = TextEditingController();

  TextEditingController edittextoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.whiteA700,
            resizeToAvoidBottomInset: false,
            appBar: CustomAppBar(
                leadingWidth: getHorizontalSize(30),
                leading: AppbarImage(
                    svgPath: ImageConstant.imgArrowleft,
                    margin: getMargin(left: 16, top: 10, bottom: 13),
                    onTap: () {
                      onTapArrowleftone(context);
                    }),
                centerTitle: true,
                title: AppbarTitle(text: "Booking shuttle"),
                styleType: Style.bgFill),
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 14, right: 14),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: getPadding(top: 25),
                          child:
                              Text("Name", style: theme.textTheme.titleMedium)),
                      CustomTextFormField(
                          controller: nameController,
                          margin: getMargin(top: 5)),
                      Padding(
                          padding: getPadding(top: 10),
                          child: Text("Student ID",
                              style: theme.textTheme.titleMedium)),
                      CustomTextFormField(
                          controller: edittextController,
                          margin: getMargin(top: 5)),
                      Padding(
                          padding: getPadding(top: 13),
                          child: Text("Destination",
                              style: theme.textTheme.titleMedium)),
                      Container(
                          height: getVerticalSize(71),
                          width: getHorizontalSize(332),
                          margin: getMargin(top: 5),
                          child:
                              Stack(alignment: Alignment.bottomLeft, children: [
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: Text("+",
                                    style: theme.textTheme.headlineLarge)),
                            Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                    padding: getPadding(left: 2),
                                    child: Text("Payment option",
                                        style: theme.textTheme.titleMedium))),
                            CustomTextFormField(
                                width: getHorizontalSize(332),
                                controller: edittextoneController,
                                textInputAction: TextInputAction.done,
                                alignment: Alignment.topCenter)
                          ])),
                      Container(
                          margin: getMargin(top: 4),
                          padding: getPadding(all: 11),
                          decoration: AppDecoration.fillGray.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                    padding: getPadding(top: 2),
                                    child: Text("Monthly",
                                        style: CustomTextStyles
                                            .titleMediumGray800)),
                                CustomImageView(
                                    svgPath: ImageConstant.imgArrowright,
                                    height: getVerticalSize(21),
                                    width: getHorizontalSize(14),
                                    margin: getMargin(right: 10))
                              ])),
                      Container(
                          margin: getMargin(top: 19),
                          padding: getPadding(all: 11),
                          decoration: AppDecoration.fillGray.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                    padding: getPadding(top: 1),
                                    child: Text("Daily",
                                        style: CustomTextStyles
                                            .titleMediumGray800)),
                                CustomImageView(
                                    svgPath: ImageConstant.imgArrowright,
                                    height: getVerticalSize(21),
                                    width: getHorizontalSize(14),
                                    margin: getMargin(right: 10))
                              ])),
                      Padding(
                          padding: getPadding(top: 96, right: 3),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomElevatedButton(
                                    width: getHorizontalSize(99),
                                    text: "Cancel"),
                                CustomElevatedButton(
                                    width: getHorizontalSize(99),
                                    text: "Submit")
                              ])),
                      Spacer(),
                      Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                              width: getHorizontalSize(161), child: Divider()))
                    ])),
            bottomNavigationBar: SizedBox(
                child: Container(
                    padding: getPadding(left: 99, top: 5, right: 99, bottom: 5),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: fs.Svg(ImageConstant.imgGroup5),
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
