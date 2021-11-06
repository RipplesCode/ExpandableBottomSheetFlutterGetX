import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expandable Bottom Sheet'),
        centerTitle: true,
      ),
      body: ExpandableBottomSheet(
        key: controller.key,
        // optional
        // This will enable tap to toggle option on header.
        enableToggle: true,
        //required
        //This is the widget which will be overlapped by the bottom sheet.
        background: Container(
          color: Colors.deepPurpleAccent,
          child: Center(
            child: Obx(() => Text(
                  'Background-' + controller.expansionStatus.value.toString(),
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )),
          ),
        ),
        //required
        //This is the content of the bottom sheet which will be extendable by dragging
        expandableContent: Container(
          height: 500,
          color: Colors.green,
          child: Center(
            child: Text(
              'Content',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
        //optional
        //This widget is sticking above the content and will never be contracted.
        persistentHeader: Container(
          color: Colors.blue,
          height: 40,
          child: Center(
            child: Text(
              'Header',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
        //optional
        //This is a widget aligned to the bottom of the screen and stays there.
        persistentFooter: Container(
          color: Colors.red,
          height: 60,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.arrow_upward,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    controller.key.currentState!.expand();
                  }),
              IconButton(
                icon: Icon(
                  Icons.cloud,
                  color: Colors.white,
                ),
                onPressed: () {
                  controller.expansionStatus.value =
                      controller.key.currentState!.expansionStatus;
                },
              ),
              IconButton(
                  icon: Icon(
                    Icons.arrow_downward,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    controller.key.currentState!.contract();
                  }),
            ],
          ),
        ),
        //optional
        //The content extend will be at least this height.
        persistentContentHeight: 220,
        //optional

        onIsContractedCallback: () => print('contracted'),
        onIsExtendedCallback: () => print('expanded'),

        //optional; default: Duration(milliseconds: 250)
        //The durations of the animations.
        animationDurationExtend: Duration(milliseconds: 500),
        animationDurationContract: Duration(milliseconds: 250),

        //optional; default: Curves.ease
        //The curves of the animations.
        animationCurveExpand: Curves.bounceOut,
        animationCurveContract: Curves.ease,
      ),
    );
  }
}
