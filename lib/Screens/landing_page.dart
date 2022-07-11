import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foukabay_admin/Screens/workshops_page.dart';
import 'package:foukabay_admin/widgets/fracation_sized_box.dart';
import 'package:responsive_framework/responsive_framework.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);
  static const String route = '/landing';

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      //   backgroundColor: Colors.black12,
      body: Stack(
        children: [
          Image.asset(
            screenWidth > 700
                ? 'images/landing_desktop_bk.png'
                : 'images/landing_mobile_bk.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          FractionallyAlignedSizedBox(
            bottomFactor: .09,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: ResponsiveValue(
                    context,
                    defaultValue: 200.0,
                    valueWhen: [
                      Condition.smallerThan(
                        name: MOBILE,
                        value: 200.0,
                      ),
                      Condition.largerThan(
                        name: TABLET,
                        value: MediaQuery.of(context).size.width * .26,
                      )
                    ],
                  ).value,
                  height: 60,
                  child: ButtonTheme(
                      //minWidth: 200.0,
                      //   height:32.h,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60.0),
                          side: const BorderSide(color: Colors.white)),
                      child: RaisedButton(
                          color: Colors.white,
                          child: Text("Workshops",
                              style: TextStyle(
                                  fontSize: ResponsiveValue(
                                    context,
                                    defaultValue: 20.0,
                                    valueWhen: const [
                                      Condition.smallerThan(
                                        name: MOBILE,
                                        value: 20.0,
                                      ),
                                      Condition.largerThan(
                                        name: TABLET,
                                        value: 40.0,
                                      )
                                    ],
                                  ).value,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700)),
                          onPressed: () {
                            Navigator.of(context).pushNamed(WorkShops.route);
                          })),
                ),
                // child: Container(
                //   decoration: BoxDecoration(
                //       // borderRadius: BorderRadius.circular(5.0),
                //       //border: borderColor == null ? null : Border.all(color: borderColor),
                //       borderRadius: BorderRadius.all(Radius.circular(50)),
                //       color: Colors.white),
                //   child: Align(
                //     alignment: Alignment.center,
                //     child: Text(
                //       'Workshops',
                //       //   textAlign: TextAlign.center,
                //       style: TextStyle(
                //           fontSize: ResponsiveValue(
                //             context,
                //             defaultValue: 20.0,
                //             valueWhen: const [
                //               Condition.smallerThan(
                //                 name: MOBILE,
                //                 value: 20.0,
                //               ),
                //               Condition.largerThan(
                //                 name: TABLET,
                //                 value: 40.0,
                //               )
                //             ],
                //           ).value,
                //           fontWeight: FontWeight.w700),
                //     ),
                //   ),
                //   width: MediaQuery.of(context).size.width * 0.26,
                //   height: 60,
                //   //    color: Colors.white,
                // ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
