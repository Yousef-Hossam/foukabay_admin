import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:foukabay_admin/Models/events_model.dart';
import 'package:foukabay_admin/Screens/RegisteredUsers.dart';
import 'package:foukabay_admin/Screens/add_workshop.dart';
import 'package:foukabay_admin/Screens/edit_workshop.dart';
import 'package:foukabay_admin/provider/workshop_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class WorkShops extends StatefulWidget {
  static const String route = '/events';

  const WorkShops({Key? key}) : super(key: key);

  @override
  State<WorkShops> createState() => _WorkShopsState();
}

class _WorkShopsState extends State<WorkShops> with AfterLayoutMixin {
  late WorkShopProvider workShopProvider;
  DateFormat dateFormat = new DateFormat('dd-MM-yyyy hh:mm a');

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   callWorkShops();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    workShopProvider = Provider.of<WorkShopProvider>(context, listen: true);
    print("length" + workShopProvider.listWorkshops.length.toString());
    // workShopProvider.getAllEvents();
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Color(0xff71B3E3),
        toolbarHeight: 100,
        shadowColor: Color(0xff71B3E3).withOpacity(0.6),
        bottomOpacity: 5,
        centerTitle: true,
        title: Image.asset(
          'images/foka_bay.png',
          width: 200,
          height: 70,
          fit: BoxFit.contain,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: IconButton(
              icon: Icon(
                Icons.add,
              ),
              iconSize: 55,
              color: Colors.white,
              //  splashColor: Colors.purple,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AddWorkshopPage.route,
                );
              },
            ),
          ),
        ],

        //  title: Text('fffff'),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  w > 800
                      ? 'images/desktop_register.png'
                      : 'images/mobile_register.png',
                ),
                fit: BoxFit.cover),
          ),
          // Image.asset(
          //   w > 800
          //       ? 'images/desktop_register.png'
          //       : 'images/mobile_register.png',
          //   width: MediaQuery.of(context).size.width,
          //   height: MediaQuery.of(context).size.height,
          //   fit: BoxFit.fill,
          // ),
          child: Column(
            children: [
              // Align(
              //   alignment: Alignment.topCenter,
              //   child: Image.asset(
              //     'images/foka_bay.png',
              //     width: 200,
              //     height: 100,
              //     fit: BoxFit.contain,
              //   ),
              // ),
              // Padding(
              //     padding: const EdgeInsets.only(top: 8.0),
              //     child: SizedBox(
              //       height: 35,
              //       width: 150,
              //       child: ButtonTheme(
              //           //minWidth: 200.0,
              //           //   height:32.h,
              //           shape: RoundedRectangleBorder(
              //               borderRadius: BorderRadius.circular(8.0),
              //               side: const BorderSide(color: Color(0xFF71B3E3))),
              //           child: RaisedButton(
              //               color: Colors.white,
              //               child: Text("Add workshop",
              //                   style: TextStyle(
              //                       fontSize: 18,
              //                       color: Color(0xFF71B3E3),
              //                       fontWeight: FontWeight.w500)),
              //               onPressed: () async {})),
              //     )),
              workShopProvider.listWorkshops.length != null &&
                      workShopProvider.listWorkshops.length > 0
                  ? w > 800
                      ? Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width * 0.2,
                            // right: MediaQuery.of(context).size.width * 0.18,
                            //   top: 40
                          ),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.75,
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: MediaQuery.removePadding(
                              removeTop: true,
                              removeBottom: true,
                              context: context,
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 5),
                                child: ListView.builder(
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 16.0),
                                      child: cardworkShop(workShopProvider
                                          .listWorkshops[index]),
                                    );
                                  },
                                  itemCount:
                                      workShopProvider.listWorkshops.length,
                                  scrollDirection: Axis.vertical,
                                  primary: false,
                                  shrinkWrap: true,
                                ),
                              ),
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8.0, bottom: 8.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.75,
                            //    color: Color(0xffE5E5E5),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2),
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 4),
                                child: MediaQuery.removePadding(
                                  removeTop: true,
                                  removeBottom: true,
                                  context: context,
                                  child: ListView.builder(
                                    itemBuilder: (context, index) {
                                      return cardWorkShopMobile(workShopProvider
                                          .listWorkshops[index]);
                                    },
                                    itemCount:
                                        workShopProvider.listWorkshops.length,
                                    scrollDirection: Axis.vertical,
                                    primary: false,
                                    shrinkWrap: true,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                  : Container(),
            ],
          ),
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "images/deafult_event_background.jpeg",
                height: 210,
                width: 210,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 20),
              Flexible(
                  child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                              workShopModel.eventName != null
                                  ? workShopModel.eventName.toString()
                                  : '',
                              style: TextStyle(
                                  fontSize: 32,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
                              maxLines: 2,
                              softWrap: true),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.edit_outlined,
                          ),
                          iconSize: 65,
                          color: Color(0xff71B3E3),
                          //  splashColor: Colors.purple,
                          onPressed: () async {
                            await workShopProvider
                                .setSelectedEvent(workShopModel);
                            Navigator.of(context)
                                .pushNamed(EditWorkshopPage.route);
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
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
                            fontSize: 32,
                            color: Colors.black,
                            fontWeight: FontWeight.w400)),
                    SizedBox(height: 10),
                    Text(
                        DateFormat.jm().format(dateFormat
                            .parse(workShopModel.datetime.toString())),
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                            fontWeight: FontWeight.w400)),
                    SizedBox(height: 20),
                    SizedBox(
                      height: 50,
                      width: 200,
                      child: ButtonTheme(
                        //minWidth: 200.0,
                        //   height:32.h,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            side: const BorderSide(color: Color(0xFF71B3E3))),
                        child: RaisedButton(
                            color: Color(0xFF71B3E3),
                            child: Text("Users",
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500)),
                            onPressed: () async {
                              await workShopProvider
                                  .setSelectedEvent(workShopModel);
                              Navigator.of(context).pushNamed(
                                RegisteredUsers.route,
                              );
                            }),
                      ),
                    ),
                  ],
                ),
              ))
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Image.asset(
                  "images/deafult_event_background.jpeg",
                  height: 120,
                  width: 120,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 10),
              Flexible(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(bottom: 6.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: Text(
                              workShopModel.eventName != null
                                  ? workShopModel.eventName.toString()
                                  : '',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              maxLines: 2,
                              softWrap: true,
                            )),
                            const SizedBox(width: 5),
                            IconButton(
                              icon: Icon(
                                Icons.edit_outlined,
                              ),
                              iconSize: 40,
                              color: Color(0xff71B3E3),
                              //  splashColor: Colors.purple,
                              onPressed: () async {
                                await workShopProvider
                                    .setSelectedEvent(workShopModel);
                                Navigator.of(context)
                                    .pushNamed(EditWorkshopPage.route);
                              },
                            ),
                          ])),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6.0),
                    child: Text(
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
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6.0),
                    child: Text(
                        DateFormat.jm().format(dateFormat
                            .parse(workShopModel.datetime.toString())),
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w400)),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 35,
                    width: 150,
                    child: ButtonTheme(
                        //minWidth: 200.0,
                        //   height:32.h,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            side: const BorderSide(color: Color(0xFF71B3E3))),
                        child: RaisedButton(
                            color: Color(0xFF71B3E3),
                            child: Text("Users",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500)),
                            onPressed: () async {
                              await workShopProvider
                                  .setSelectedEvent(workShopModel);
                              Navigator.of(context)
                                  .pushNamed(RegisteredUsers.route);
                            })),
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    workShopProvider = Provider.of<WorkShopProvider>(context, listen: false);
    workShopProvider.getAllEvents();

    setState(() {});
  }

  Future callWorkShops() async {
    await workShopProvider.getAllEvents();
    // sleep(const Duration(seconds: 15));
    //  userAddressProvider.faillRegions();
    //   userAddressProvider.faillCities();
    //setState(() {});
  }
}
