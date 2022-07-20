import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:foukabay_admin/Models/events_model.dart';
import 'package:foukabay_admin/Screens/landing_page.dart';
import 'package:foukabay_admin/provider/workshop_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AddWorkshopPage extends StatefulWidget {
  static const String route = '/addworkshop';

  const AddWorkshopPage({Key? key}) : super(key: key);

  @override
  State<AddWorkshopPage> createState() => _AddWorkshopPageState();
}

class _AddWorkshopPageState extends State<AddWorkshopPage>
    with AfterLayoutMixin {
  late WorkShopProvider workShopProvider;
  final _formKey = GlobalKey<FormState>();
  String? dropdownValue;
  TextEditingController wname = new TextEditingController();
  TextEditingController wdesc = new TextEditingController();
  TextEditingController wduration = new TextEditingController();
  TextEditingController wseats = new TextEditingController();
  TextEditingController wmin = new TextEditingController();
  TextEditingController wmax = new TextEditingController();
  TextEditingController dateinput = new TextEditingController();
  TextEditingController timeinput = new TextEditingController();
  // Events EventRegister = new Events();
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
                height: MediaQuery.of(context).size.height * 1.21,
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
        child: ListView(
          scrollDirection: Axis.vertical,
          primary: false,
          shrinkWrap: true,
          children: [
            Container(
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
                  padding:
                      EdgeInsets.symmetric(horizontal: 14.0, vertical: 14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Add New Work Shop!',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w700),
                      ),
                      // Text(
                      //   'Quick and easy.',
                      //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                      // ),
                      Divider(
                        height: 10,
                        thickness: 2,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        //   color: Colors.black12,
                        child: TextFormField(
                          controller: wname,
                          //    autocorrect: true,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xffE8E8E8),
                            border: OutlineInputBorder(),
                            hintText: 'workshop name',
                            hintStyle: TextStyle(
                                fontSize: 16,
                                color: Color(0xffAEAEAE),
                                fontWeight: FontWeight.bold),
                          ),
                          validator: (value) {
                            if (value!.isEmpty || value.length < 3) {
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
                          controller: wdesc,
                          keyboardType: TextInputType.text,
                          maxLines: 3,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xffE8E8E8),
                            border: OutlineInputBorder(),
                            hintText: 'Description',
                            hintStyle: TextStyle(
                                fontSize: 16,
                                color: Color(0xffAEAEAE),
                                fontWeight: FontWeight.bold),
                          ),
                          validator: (value) {
                            if (value!.isEmpty || value.length < 10) {
                              return 'please enter vaild description';
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
                        layout:
                            ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
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
                                controller: wduration,
                                //    autocorrect: true,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xffE8E8E8),
                                  border: OutlineInputBorder(),
                                  hintText: 'duration hours',
                                  hintStyle: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xffAEAEAE),
                                      fontWeight: FontWeight.bold),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'please enter vaild number';
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
                              //     width: wd * 0.22,
                              //   color: Colors.black12,
                              child: TextFormField(
                                controller: wseats,
                                //    autocorrect: true,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xffE8E8E8),
                                  border: OutlineInputBorder(),
                                  hintText: 'num of seats',
                                  hintStyle: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xffAEAEAE),
                                      fontWeight: FontWeight.bold),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'please enter vaild number';
                                  } else
                                    return null;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      ResponsiveRowColumn(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        layout:
                            ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
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
                                controller: wmin,
                                //    autocorrect: true,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xffE8E8E8),
                                  border: OutlineInputBorder(),
                                  hintText: 'min age',
                                  hintStyle: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xffAEAEAE),
                                      fontWeight: FontWeight.bold),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'please enter vaild min age';
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
                              //     width: wd * 0.22,
                              //   color: Colors.black12,
                              child: TextFormField(
                                controller: wmax,
                                //    autocorrect: true,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xffE8E8E8),
                                  border: OutlineInputBorder(),
                                  hintText: 'max age',
                                  hintStyle: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xffAEAEAE),
                                      fontWeight: FontWeight.bold),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'please enter vaild max age';
                                  } else
                                    return null;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                          padding: EdgeInsets.all(10),
                          //  height: 150,
                          child: Center(
                              child: TextFormField(
                            controller: dateinput,
                            decoration: InputDecoration(
                              filled: true,
                              //   icon: Icon(Icons.calendar_today),
                              fillColor: Color(0xffE8E8E8),
                              border: OutlineInputBorder(),
                              hintText: 'Enter Date',
                              prefixIcon: Icon(Icons.calendar_today),
                              hintStyle: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xffAEAEAE),
                                  fontWeight: FontWeight.bold),
                            ),
                            readOnly: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'please enter vaild date';
                              } else
                                return null;
                            },
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2023));

                              if (pickedDate != null) {
                                print(
                                    pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                String formattedDate =
                                    DateFormat('dd-MM-yyyy').format(pickedDate);
                                print(
                                    formattedDate); //formatted date output using intl package =>  2021-03-16
                                //you can implement different kind of Date Format here according to your requirement

                                setState(() {
                                  dateinput.text =
                                      formattedDate; //set output date to TextField value.
                                });
                              } else {
                                print("Date is not selected");
                              }
                            },
                          ))),
                      Container(
                          padding: EdgeInsets.all(10),
                          //   height:150,
                          child: Center(
                              child: TextFormField(
                            controller: timeinput,
                            decoration: InputDecoration(
                              filled: true,
                              //   icon: Icon(Icons.calendar_today),
                              fillColor: Color(0xffE8E8E8),
                              border: OutlineInputBorder(),
                              hintText: '"Enter Time',
                              prefixIcon: Icon(Icons.timer),
                              hintStyle: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xffAEAEAE),
                                  fontWeight: FontWeight.bold),
                            ),
                            readOnly: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'please enter vaild time';
                              } else
                                return null;
                            },
                            //set it true, so that user will not able to edit text
                            onTap: () async {
                              TimeOfDay? pickedTime = await showTimePicker(
                                initialTime: TimeOfDay.now(),
                                context: context,
                              );

                              if (pickedTime != null) {
                                print(pickedTime
                                    .format(context)); //output 10:51 PM
                                // DateTime parsedTime = DateFormat.jm()
                                //     .parse(pickedTime.format(context).toString());
                                // //converting to DateTime so that we can further format on different pattern.
                                // print(parsedTime); //output 1970-01-01 22:53:00.000
                                // String formattedTime =
                                //     DateFormat('HH:mm').format(parsedTime);
                                // print(formattedTime); //output 14:59:00
                                // //DateFormat() is from intl package, you can format the time on any pattern you need.

                                setState(() {
                                  timeinput.text = pickedTime
                                      .format(context)
                                      .toString(); //set the value of text field.
                                });
                              } else {
                                print("Time is not selected");
                              }
                            },
                          ))),

                      Container(
                        padding: EdgeInsets.all(10),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: FormField<String>(
                            builder: (FormFieldState<String> state) {
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
                                  child: DropdownButton<String>(
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xffAEAEAE),
                                      //   fontFamily: "verdana_regular",
                                    ),
                                    hint: Text(
                                      "  choose month",
                                      style: TextStyle(
                                        color: Color(0xffAEAEAE),
                                        fontSize: 16,
                                        //  fontFamily: "verdana_regular",
                                      ),
                                    ),
                                    items: <String>['July', 'Augest']
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
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
                                  width: 260,
                                  child: ButtonTheme(
                                    //minWidth: 200.0,
                                    //   height:32.h,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        side: const BorderSide(
                                            color: Color(0xFF1A7741))),
                                    child: RaisedButton(
                                        color: Color(0xFF27AE60),
                                        child: Text("Add Workshop",
                                            style: TextStyle(
                                                fontSize: 24,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500)),
                                        onPressed: () async {
                                          setState(() {
                                            isLoading = true;
                                          });
                                          if (_formKey.currentState!
                                              .validate()) {
                                            FocusScope.of(context).unfocus();
                                            await workShopProvider
                                                .adminWorkshopRegister(Events(
                                                    available: true,
                                                    description: wdesc.text,
                                                    eventName: wname.text,
                                                    eventType: 'Workshop',
                                                    durationHours: int.parse(
                                                        wduration.text),
                                                    minAge:
                                                        int.parse(wmin.text),
                                                    maxAge:
                                                        int.parse(wmax.text),
                                                    monthName:
                                                        dropdownValue != null
                                                            ? dropdownValue
                                                            : 'July',
                                                    datetime: dateinput.text +
                                                        ' ' +
                                                        timeinput.text,
                                                    imageBase64: '',
                                                    noOfSeats:
                                                        int.parse(wseats.text),
                                                    location: 'Workshop Area'))
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
                                                        (context) =>
                                                            AlertDialog(
                                                              content:
                                                                  Container(
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    color: Colors
                                                                        .white),
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height *
                                                                    .4,
                                                                // width:350.w,
                                                                child: MediaQuery
                                                                    .removePadding(
                                                                  removeTop:
                                                                      true,
                                                                  context:
                                                                      context,
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Image
                                                                          .asset(
                                                                        'images/success.png',
                                                                        width:
                                                                            150,
                                                                        height:
                                                                            125,
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            10,
                                                                      ),
                                                                      Container(
                                                                          child:
                                                                              Align(
                                                                        alignment:
                                                                            Alignment.center,
                                                                        child:
                                                                            Text(
                                                                          // value.toString() ==
                                                                          "  Thank you for Add Workshop.",
                                                                          //  : "Failed to register",
                                                                          style: TextStyle(
                                                                              fontSize: 18,
                                                                              fontWeight: FontWeight.bold,
                                                                              color: Colors.black),
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                        ),
                                                                      )),
                                                                      // SizedBox(
                                                                      //   height: 5,
                                                                      // ),
                                                                      // Container(
                                                                      //     child:
                                                                      //         Align(
                                                                      //   alignment:
                                                                      //       Alignment
                                                                      //           .center,
                                                                      //   child: Text(
                                                                      //     // value.toString() ==
                                                                      //     //         "success"
                                                                      //          "   Shortly you will find a confirmation in your email.",
                                                                      //         // : value
                                                                      //         //     .toString(),
                                                                      //     style: TextStyle(
                                                                      //         fontSize:
                                                                      //             16,
                                                                      //         fontWeight: FontWeight
                                                                      //             .w400,
                                                                      //         color:
                                                                      //             Colors.black),
                                                                      //     textAlign:
                                                                      //         TextAlign
                                                                      //             .center,
                                                                      //   ),
                                                                      // )),
                                                                      SizedBox(
                                                                        height:
                                                                            10,
                                                                      ),
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(8.0),
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
                                                                            shape:
                                                                                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0), side: const BorderSide(color: Color(0xFF27AE60))),
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
            ),
          ],
        ));
  }

  @override
  void afterFirstLayout(BuildContext context) {
    workShopProvider = Provider.of<WorkShopProvider>(context, listen: false);
    //  workShopProvider.getAllEvents();

    setState(() {});
  }
}
