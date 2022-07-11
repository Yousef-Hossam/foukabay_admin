import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:foukabay_admin/Models/register_workshop.dart';
import 'package:foukabay_admin/Screens/landing_page.dart';
import 'package:foukabay_admin/provider/workshop_provider.dart';
import 'package:foukabay_admin/valditor.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

class RegisterPage extends StatefulWidget {
  static const String route = '/register';

  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> with AfterLayoutMixin {
  late WorkShopProvider workShopProvider;
  final _formKey = GlobalKey<FormState>();
  int? dropdownValue;
  TextEditingController uname = new TextEditingController();
  TextEditingController uphone = new TextEditingController();
  TextEditingController umail = new TextEditingController();
  TextEditingController uunit = new TextEditingController();
  Customer customer = new Customer();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    workShopProvider = Provider.of<WorkShopProvider>(context, listen: false);
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Color(0xff71B3E3),
        toolbarHeight: 90,
        shadowColor: Color(0xff71B3E3).withOpacity(0.6),
        bottomOpacity: 5,
        centerTitle: true,
        title: Image.asset(
          'images/foka_bay.png',
          width: 200,
          height: 60,
          fit: BoxFit.contain,
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Stack(
            children: [
              Image.asset(
                w > 800
                    ? 'images/desktop_register.png'
                    : 'images/mobile_register.png',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal:
                      w > 800 ? MediaQuery.of(context).size.width * 0.24 : 12,
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: h > 800
                          ? MediaQuery.of(context).size.height * .12
                          : 4),
                  child: Container(
                    child: cardRegister(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget cardRegister() {
    double wd = MediaQuery.of(context).size.width;
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: Container(
          //  width: MediaQuery.of(context).size.width * 0.5,
          //    height: MediaQuery.of(context).size.height * 0.5,
          child: Card(
            color: Colors.white,
            elevation: 1,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.white, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Register now!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'Quick and easy.',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                  Divider(
                    height: 10,
                    thickness: 2,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    //   color: Colors.black12,
                    child: TextFormField(
                      controller: uname,
                      //    autocorrect: true,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xffE8E8E8),
                        border: OutlineInputBorder(),
                        hintText: 'Name',
                        hintStyle: TextStyle(
                            fontSize: 16,
                            color: Color(0xffAEAEAE),
                            fontWeight: FontWeight.bold),
                      ),
                      validator: (value) {
                        if (value!.isEmpty || value.length < 2) {
                          return 'please enter vaild name';
                        } else
                          return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    //   color: Colors.black12,
                    child: TextFormField(
                      //  autocorrect: true,
                      controller: umail,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xffE8E8E8),
                        border: OutlineInputBorder(),
                        hintText: 'Email',
                        hintStyle: TextStyle(
                            fontSize: 16,
                            color: Color(0xffAEAEAE),
                            fontWeight: FontWeight.bold),
                      ),
                      validator: (value) {
                        return isEmailValid(value!);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    //   color: Colors.black12,

                    child: TextFormField(
                      //  autocorrect: true,
                      controller: uphone,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xffE8E8E8),
                        border: OutlineInputBorder(),
                        hintText: 'Phone number',
                        hintStyle: TextStyle(
                            fontSize: 16,
                            color: Color(0xffAEAEAE),
                            fontWeight: FontWeight.bold),
                      ),
                      validator: (value) {
                        if (value!.isEmpty || value.length != 11) {
                          return 'please enter vaild phone number';
                        } else
                          return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  ResponsiveRowColumn(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    layout: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                        ? ResponsiveRowColumnType.COLUMN
                        : ResponsiveRowColumnType.ROW,
                    children: [
                      ResponsiveRowColumnItem(
                        rowFlex: 1,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          //     width: wd * 0.22,
                          //   color: Colors.black12,
                          child: TextFormField(
                            controller: uunit,
                            //    autocorrect: true,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xffE8E8E8),
                              border: OutlineInputBorder(),
                              hintText: 'Unit number',
                              hintStyle: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xffAEAEAE),
                                  fontWeight: FontWeight.bold),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'please enter vaild unit number';
                              } else
                                return null;
                            },
                          ),
                        ),
                      ),
                      ResponsiveRowColumnItem(
                        rowFlex: 1,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: FormField<int>(
                              builder: (FormFieldState<int> state) {
                                return InputDecorator(
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Color(0xffE8E8E8),
                                      contentPadding:
                                          EdgeInsets.fromLTRB(4, 4, 4, 4),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(1.0))),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<int>(
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xffAEAEAE),
                                        //   fontFamily: "verdana_regular",
                                      ),
                                      hint: Text(
                                        "  No. of attendees",
                                        style: TextStyle(
                                          color: Color(0xffAEAEAE),
                                          fontSize: 16,
                                          //  fontFamily: "verdana_regular",
                                        ),
                                      ),
                                      items: <int>[
                                        1,
                                        2,
                                        3
                                      ].map<DropdownMenuItem<int>>((int value) {
                                        return DropdownMenuItem(
                                          value: value,
                                          child: Text(value.toString()),
                                        );
                                      }).toList(),
                                      isExpanded: true,
                                      isDense: true,
                                      onChanged: (value) {
                                        dropdownValue = value;
                                        setState(() {});
                                      },
                                      value: dropdownValue,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ResponsiveValue(
                      context,
                      defaultValue: 10.0,
                      valueWhen: const [
                        Condition.smallerThan(
                          name: MOBILE,
                          value: 10.0,
                        ),
                        Condition.largerThan(
                          name: TABLET,
                          value: 25.0,
                        )
                      ],
                    ).value,
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: isLoading == false
                          ? SizedBox(
                              height: 45,
                              width: 250,
                              child: ButtonTheme(
                                //minWidth: 200.0,
                                //   height:32.h,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    side: const BorderSide(
                                        color: Color(0xFF1A7741))),
                                child: RaisedButton(
                                    color: Color(0xFF27AE60),
                                    child: Text("Register",
                                        style: TextStyle(
                                            fontSize: 24,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500)),
                                    onPressed: () async {
                                      print("id" +
                                          workShopProvider.events.id
                                              .toString());
                                      setState(() {
                                        isLoading = true;
                                      });
                                      if (_formKey.currentState!.validate()) {
                                        FocusScope.of(context).unfocus();
                                        await workShopProvider
                                            .userWorkshopRegister(
                                                RegisterWorkshop(
                                                    customer: Customer(
                                                        email:
                                                            umail.text.trim(),
                                                        noOfAttendancies:
                                                            dropdownValue,
                                                        lastName: '',
                                                        firstName:
                                                            uname.text.trim(),
                                                        mobileNumber: int.parse(
                                                            uphone.text.trim()),
                                                        unitNumber:
                                                            uunit.text.trim()),
                                                    eventId: workShopProvider
                                                        .events.id))
                                            .then((value) {
                                          // Navigator.pop(context);
                                          if (value != null) {
                                            setState(() {
                                              isLoading = false;
                                            });
                                            showDialog(
                                                barrierDismissible: false,
                                                context: context,
                                                builder:
                                                    (context) => AlertDialog(
                                                          content: Container(
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                color: Colors
                                                                    .white),
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                .5,
                                                            // width:350.w,
                                                            child: MediaQuery
                                                                .removePadding(
                                                              removeTop: true,
                                                              context: context,
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Image.asset(
                                                                    'images/success.png',
                                                                    width: 150,
                                                                    height: 125,
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Container(
                                                                      child:
                                                                          Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    child: Text(
                                                                      value.toString() ==
                                                                              "sucess"
                                                                          ? "  Thank you for registration."
                                                                          : "Failed to register",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          color:
                                                                              Colors.black),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                    ),
                                                                  )),
                                                                  SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Container(
                                                                      child:
                                                                          Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    child: Text(
                                                                      value.toString() ==
                                                                              "success"
                                                                          ? "   Shortly you will find a confirmation in your email."
                                                                          : value
                                                                              .toString(),
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              16,
                                                                          fontWeight: FontWeight
                                                                              .w400,
                                                                          color:
                                                                              Colors.black),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                    ),
                                                                  )),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            8.0),
                                                                    child:
                                                                        SizedBox(
                                                                      height:
                                                                          50,
                                                                      width:
                                                                          180,
                                                                      child:
                                                                          ButtonTheme(
                                                                        //minWidth: 200.0,
                                                                        //   height:32.h,
                                                                        shape: RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                            side: const BorderSide(color: Color(0xFF27AE60))),
                                                                        child: RaisedButton(
                                                                            color: Color(0xFF27AE60),
                                                                            child: Text("Done", style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.w400)),
                                                                            onPressed: () async {
                                                                              Navigator.of(context).pushNamed(
                                                                                LandingPage.route,
                                                                              );
                                                                            }),
                                                                      ),
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ));
                                          }
                                        }).catchError((error) {
                                          setState(() {
                                            isLoading = false;
                                          });
                                          return false;
                                        });
                                      } else {
                                        showDialog(
                                            barrierDismissible: false,
                                            context: context,
                                            builder: (context) => AlertDialog(
                                                  content: Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        color: Colors.white),
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            .55,
                                                    // width:350.w,
                                                    child: MediaQuery
                                                        .removePadding(
                                                      removeTop: true,
                                                      context: context,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Image.asset(
                                                            'images/success.png',
                                                            width: 150,
                                                            height: 125,
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Container(
                                                              child: Align(
                                                            alignment: Alignment
                                                                .center,
                                                            child: Text(
                                                              "  Thank you for registration.",
                                                              style: TextStyle(
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .black),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),
                                                          )),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Container(
                                                              child: Align(
                                                            alignment: Alignment
                                                                .center,
                                                            child: Text(
                                                              "   Shortly you will find a confirmation in your email.",
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: Colors
                                                                      .black),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),
                                                          )),
                                                          SizedBox(
                                                            height: 25,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: SizedBox(
                                                              height: 50,
                                                              width: 180,
                                                              child:
                                                                  ButtonTheme(
                                                                //minWidth: 200.0,
                                                                //   height:32.h,
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12.0),
                                                                    side: const BorderSide(
                                                                        color: Color(
                                                                            0xFF27AE60))),
                                                                child:
                                                                    RaisedButton(
                                                                        color: Color(
                                                                            0xFF27AE60),
                                                                        child: Text(
                                                                            "Done",
                                                                            style: TextStyle(
                                                                                fontSize: 24,
                                                                                color: Colors.white,
                                                                                fontWeight: FontWeight.w400)),
                                                                        onPressed: () async {
                                                                          Navigator.of(context)
                                                                              .pushNamed(
                                                                            LandingPage.route,
                                                                          );
                                                                        }),
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ));
                                        setState(() {
                                          isLoading = false;
                                        });
                                      }
                                    }),
                              ),
                            )
                          : CircularProgressIndicator(
                              color: Color(0xff71B3E3),
                              backgroundColor: Colors.white70,
                            )),
                ],
              ),
            ),
          ),
        ));
  }

  @override
  void afterFirstLayout(BuildContext context) {
    workShopProvider = Provider.of<WorkShopProvider>(context, listen: false);
    //  workShopProvider.getAllEvents();

    setState(() {});
  }
}
