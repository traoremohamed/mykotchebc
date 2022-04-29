import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    @required this.photoURL,
    @required this.membership,
    @required this.progress,
    Key key,
  }) : super(key: key);

  final String photoURL;
  final String membership;
  final int progress;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      child: Stack(
        children: [
          CircularStepProgressIndicator(
            padding: 0,
            currentStep: progress,
            totalSteps: 100,
            selectedStepSize: 4,
            width: 80,
            height: 80,
            startingAngle: 2.3,
            selectedColor: Colors.yellow[600],
            unselectedColor: Colors.white,
            roundedCap: (_, __) => true,
            child: Center(
              child: CircleAvatar(
                maxRadius: 30,
                backgroundImage: AssetImage(photoURL),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 0,
            child: Badge(
              shape: BadgeShape.square,
              animationType: BadgeAnimationType.scale,
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2.2),
              borderSide: BorderSide(color: Colors.white, width: 2),
              badgeColor: Colors.yellow[600],
              borderRadius: BorderRadius.circular(13),
              elevation: 0,
              badgeContent: Text(
                membership,
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
