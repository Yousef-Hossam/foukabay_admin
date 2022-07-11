import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foukabay_admin/Models/events_model.dart';
import 'package:foukabay_admin/Screens/register_page.dart';
import 'package:intl/intl.dart';

class DescriptionPage extends StatefulWidget {
  static const String route = '/description';

  //Events eventsModel;

  DescriptionPage({Key? key}) : super(key: key);

  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  //  late WorkShopProvider workShopProvider;
  late Events events;
  DateFormat dateFormat = new DateFormat('dd-MM-yyyy hh:mm a');

  @override
  Widget build(BuildContext context) {
    //  workShopProvider = Provider.of<WorkShopProvider>(context, listen: true);
    events = ModalRoute.of(context)!.settings.arguments as Events;
    double w = MediaQuery.of(context).size.width;
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

        //  title: Text('fffff'),
      ),
      body: SingleChildScrollView(
        // child: Container(
        //   width: double.infinity,
        //   height: double.infinity,
        //   decoration: BoxDecoration(
        //     image: DecorationImage(
        //         image: AssetImage(
        //           w > 800
        //               ? 'images/desktop_register.png'
        //               : 'images/mobile_register.png',
        //         ),
        //         fit: BoxFit.cover),
        //   ),
        //   child: Column(
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
            w > 800
                ? Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.2,
                        vertical: 8.0),
                    child: Container(
                        //   height: MediaQuery.of(context).size.height * 0.85,
                        child: cardworkShop(events)),
                  )
                : Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                    child: Container(child: cardWorkShopMobile(events)),
                  )
          ],
        ),
      ),
    );
  }

  Widget cardworkShop(Events workShopModel) {
    double wd = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
      child: Container(
        // height: wd > 600 ? MediaQuery.of(context).size.height * 0.3 : 200,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(12.0)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.memory(
                base64Decode(workShopModel.imageBase64.toString()),
                height: 190,
                width: wd * 0.8,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(workShopModel.eventName.toString(),
                          style: TextStyle(
                              fontSize: 40,
                              color: Colors.black,
                              fontWeight: FontWeight.w700)),
                      Text('Workshop',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w400)),
                    ]),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text('Date',
                          style: TextStyle(
                              fontSize: 26,
                              color: Colors.black,
                              fontWeight: FontWeight.w400)),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                          DateFormat("dd").format(dateFormat
                                  .parse(workShopModel.datetime.toString())) +
                              ' ' +
                              DateFormat("MMMM").format(dateFormat
                                  .parse(workShopModel.datetime.toString())) +
                              ' ' +
                              DateFormat("yyyy").format(dateFormat
                                  .parse(workShopModel.datetime.toString())),
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w400)),
                    ],
                  ),
                  Column(children: [
                    Text('Time',
                        style: TextStyle(
                            fontSize: 26,
                            color: Colors.black,
                            fontWeight: FontWeight.w400)),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                        DateFormat.jm().format(dateFormat
                            .parse(workShopModel.datetime.toString())),
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w400)),
                  ]),
                  Column(children: [
                    Text('Duration',
                        style: TextStyle(
                            fontSize: 26,
                            color: Colors.black,
                            fontWeight: FontWeight.w400)),
                    SizedBox(
                      height: 5,
                    ),
                    Text(workShopModel.durationHours.toString() + ' Hours',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w400)),
                  ]),
                  Column(
                    children: [
                      Text('Age group',
                          style: TextStyle(
                              fontSize: 26,
                              color: Colors.black,
                              fontWeight: FontWeight.w400)),
                      SizedBox(
                        height: 5,
                      ),
                      Text(workShopModel.minAge.toString(),
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w400)),
                    ],
                  )
                ],
              ),
              SizedBox(height: 20),
              Text('Description',
                  style: TextStyle(
                      fontSize: 26,
                      color: Colors.black,
                      fontWeight: FontWeight.w400)),
              SizedBox(height: 5),
              Text(workShopModel.description.toString(),
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w400)),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 50,
                  width: 180,
                  child: ButtonTheme(
                      //minWidth: 200.0,
                      //   height:32.h,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          side: const BorderSide(color: Color(0xFF71B3E3))),
                      child: RaisedButton(
                          color: Color(0xFF71B3E3),
                          child: Text("Register now ",
                              style: TextStyle(
                                  fontSize: 26,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500)),
                          onPressed: () {
                            if (workShopModel.noOfSeats! > 0) {
                              Navigator.of(context).pushNamed(
                                RegisterPage.route,
                              );
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (_) => new AlertDialog(
                                        title: new Text(""),
                                        content: new Text(
                                            "Sorry no available seats"),
                                        actions: <Widget>[
                                          FlatButton(
                                            child: Text('OK!'),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          )
                                        ],
                                      ));
                            }
                          })),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget cardWorkShopMobile(Events workShopModel) {
    double wd = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      child: Container(
        // height: wd > 600 ? MediaQuery.of(context).size.height * 0.3 : 200,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(12.0)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Image.memory(
                  base64Decode(workShopModel.imageBase64.toString()),
                  height: 160,
                  width: wd * 0.9,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(bottom: 6.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                child: Text(
                                    workShopModel.eventName != null
                                        ? workShopModel.eventName.toString()
                                        : '',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700))),
                            const SizedBox(width: 15),
                            Text('WorkShop',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400))
                          ])),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Date',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700)),
                          SizedBox(height: 4),
                          Text(
                              DateFormat("dd").format(dateFormat.parse(
                                      workShopModel.datetime.toString())) +
                                  ' ' +
                                  DateFormat("MMMM").format(dateFormat.parse(
                                      workShopModel.datetime.toString())) +
                                  ' ' +
                                  DateFormat("yyyy").format(dateFormat.parse(
                                      workShopModel.datetime.toString())),
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400)),
                        ],
                      ),
                      Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Time     ',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700)),
                          SizedBox(height: 4),
                          Text(
                              DateFormat.jm().format(dateFormat.parse(
                                      workShopModel.datetime.toString())) +
                                  '   ',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400)),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Text('Duration',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700)),
                          SizedBox(height: 4),
                          Text(
                              workShopModel.durationHours.toString() +
                                  '  Hours',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400)),
                        ],
                      ),
                      Column(
                        children: [
                          Text('Age group',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700)),
                          SizedBox(height: 4),
                          Text(workShopModel.minAge.toString(),
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400)),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Description',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w700)),
                  SizedBox(height: 5),
                  Text(workShopModel.description.toString(),
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w400)),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 12.0, top: 12.0),
                      child: SizedBox(
                        height: 40,
                        width: 150,
                        child: ButtonTheme(
                            //minWidth: 200.0,
                            //   height:32.h,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                side:
                                    const BorderSide(color: Color(0xFF71B3E3))),
                            child: RaisedButton(
                                color: Color(0xFF71B3E3),
                                child: Text("Register now",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500)),
                                onPressed: () {
                                  Navigator.of(context).pushNamed(
                                    RegisterPage.route,
                                  );
                                })),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
