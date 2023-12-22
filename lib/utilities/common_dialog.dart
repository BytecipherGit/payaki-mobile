import 'package:flutter/material.dart';
import 'package:payaki/utilities/color_utility.dart';

import '../generated/l10n.dart';

class CommonDialog{


  //Show loading dialog
  static showLoadingDialog(BuildContext ctx) {
    showDialog(
      barrierDismissible: false,
      context: ctx,
      builder: (BuildContext context) {
        return Dialog(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.70,
              height: MediaQuery.of(context).size.height * 0.2,
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
//                crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const CircularProgressIndicator(
                        valueColor:
                        AlwaysStoppedAnimation<Color>(ColorUtility.color9C5FA3),
                        strokeWidth: 2.0,
                      ),
                      /*Platform.isAndroid
                      ? */
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        child:  Text(
                          S.of(context).pleaseWait,
                          style: TextStyle(color: Colors.grey, fontSize: 16.0),
                        ),
                      )
//                      : SizedBox(),
                    ]),
              ),
            ));
      },
    );
  }

  static showPaymentLoadingDialog(BuildContext ctx) {
    showDialog(
      barrierDismissible: false,
      context: ctx,
      builder: (BuildContext context) {
        return Dialog(
            child: WillPopScope(
              onWillPop: () async{ return false; },
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.70,
                height: MediaQuery.of(context).size.height * 0.2,
                child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
//                crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        // const Text("Please wait while authorising"),
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          child:  Text(
                            S.of(context).pleaseWaitWhileAuthorising,
                            style: TextStyle(color: Colors.grey, fontSize: 16.0),
                          ),
                        ),
                        const CircularProgressIndicator(
                          valueColor:
                          AlwaysStoppedAnimation<Color>(ColorUtility.color9C5FA3),
                          strokeWidth: 2.0,
                        ),
                        /*Platform.isAndroid
                        ? */

//                      : SizedBox(),
                      ]),
                ),
              ),
            ));
      },
    );
  }

}