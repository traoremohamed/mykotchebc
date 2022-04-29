import 'package:mykotche/core.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({
    this.title,
    this.content,
    this.lottieFilename,
    this.labelLeftButton,
    this.labelRightButton,
    this.colorLeftButton,
    this.colorRightButton,
    this.colorLeftTextButton,
    this.colorRightTextButton,
    this.fontSizeLeftButton,
    this.fontSizeRightButton,
    this.iconLeftButton,
    this.iconRightButton,
    this.onLeftPressed,
    this.onRightPressed,
    this.customWidget,
    Key key,
  }) : super(key: key);

  final String title, content, lottieFilename;
  final String labelLeftButton, labelRightButton;
  final Color colorLeftButton, colorRightButton;
  final Color colorLeftTextButton, colorRightTextButton;
  final double fontSizeLeftButton, fontSizeRightButton;
  final Function() onLeftPressed;
  final Function() onRightPressed;
  final Icon iconLeftButton, iconRightButton;
  final Widget customWidget;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              (lottieFilename == null)
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.only(bottom: 15.0, top: 20),
                      child: Lottie.asset(
                        "assets/lottie/$lottieFilename.json",
                        height: 130,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
              (title == null)
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
              (content == null)
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 8),
                      child: Text(
                        content,
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
              (customWidget == null)
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 8),
                      child: customWidget,
                    ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: onLeftPressed,
                        child: Container(
                          height: 45,
                          color: colorLeftButton,
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            border: Border.all(
                              color: Colors.grey[300],
                              width: 1,
                            ),
                          ),
                          child: Center(
                              child: Text(
                            labelLeftButton ?? "Annuler",
                            style: TextStyle(
                                color: colorLeftTextButton,
                                fontSize: fontSizeLeftButton ?? 16),
                          )),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: InkWell(
                        onTap: onRightPressed,
                        child: Container(
                          height: 45,
                          color: colorRightButton,
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          child: Center(
                              child: Text(
                            labelRightButton ?? "Oui",
                            style: TextStyle(
                                color: colorRightTextButton ?? Colors.white,
                                fontSize: fontSizeRightButton ?? 16),
                          )),
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    //   child: ExButton(
                    //     icon: iconRightButton,
                    //     labelButton: labelRightButton ?? labels.text.yes,
                    //     color: colorRightButton ??
                    //         (Get.isDarkMode ? Colors.white : Colors.green[400]),
                    //     colorText: colorRightTextButton ??
                    //         (Get.isDarkMode ? Colors.black87 : Colors.white),
                    //     fontSize: fontSizeRightButton,
                    //     onPressed: onRightPressed,
                    //   ),
                    // ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
