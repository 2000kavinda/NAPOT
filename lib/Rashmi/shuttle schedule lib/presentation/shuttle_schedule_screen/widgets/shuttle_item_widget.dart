import 'package:flutter/material.dart';
import 'package:rashmi_s_application1/core/app_export.dart';
import 'package:rashmi_s_application1/widgets/custom_elevated_button.dart';

// ignore: must_be_immutable
class ShuttleItemWidget extends StatelessWidget {
  const ShuttleItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getVerticalSize(94),
      width: getHorizontalSize(349),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: getPadding(
                top: 12,
              ),
              child: Text(
                "",
                style: theme.textTheme.headlineLarge,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: getVerticalSize(94),
              width: getHorizontalSize(349),
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: getMargin(
                        left: 1,
                      ),
                      padding: getPadding(
                        left: 19,
                        top: 7,
                        right: 19,
                        bottom: 7,
                      ),
                      decoration: AppDecoration.fillGray,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: getPadding(
                              left: 82,
                              top: 2,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: getPadding(
                                    top: 1,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Starting Time",
                                        style: theme.textTheme.labelLarge,
                                      ),
                                      Text(
                                        "Kottawa - 08.00 am",
                                        style: theme.textTheme.labelMedium,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    left: 38,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Arrival Time",
                                        style: theme.textTheme.labelLarge,
                                      ),
                                      Padding(
                                        padding: getPadding(
                                          top: 1,
                                        ),
                                        child: Text(
                                          "Kottawa - 08.00 am",
                                          style: theme.textTheme.labelMedium,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              left: 82,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "NSBM     - 09.00 am",
                                  style: theme.textTheme.labelMedium,
                                ),
                                Padding(
                                  padding: getPadding(
                                    left: 37,
                                  ),
                                  child: Text(
                                    "NSBM     - 09.00 am",
                                    style: theme.textTheme.labelMedium,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          CustomElevatedButton(
                            width: getHorizontalSize(80),
                            text: "Track now",
                            margin: getMargin(
                              top: 16,
                              right: 80,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      decoration: AppDecoration.fillBlueA,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: getPadding(
                              left: 7,
                              top: 6,
                              right: 7,
                              bottom: 6,
                            ),
                            decoration: AppDecoration.fillIndigo,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Bus Route",
                                  style: CustomTextStyles.labelLargeWhiteA700,
                                ),
                                Text(
                                  "Kottawa - NSBM",
                                  style:
                                      CustomTextStyles.labelSmallSFProDisplay,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              left: 9,
                              top: 2,
                              bottom: 7,
                            ),
                            child: Text(
                              "Shuttle \n01",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: theme.textTheme.titleMedium!.copyWith(
                                height: 1.41,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
