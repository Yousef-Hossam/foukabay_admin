import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:foukabay_admin/Models/customers.dart';
import 'package:foukabay_admin/provider/workshop_provider.dart';
import 'package:provider/provider.dart';

class RegisteredUsers extends StatefulWidget {
  static const String route = '/registered';

  const RegisteredUsers({Key? key}) : super(key: key);

  @override
  State<RegisteredUsers> createState() => _RegisteredUsersState();
}

class _RegisteredUsersState extends State<RegisteredUsers>
    with AfterLayoutMixin {
  int x = 0;
  late WorkShopProvider workShopProvider;

  // DateFormat dateFormat = new DateFormat('dd-MM-yyyy hh:mm a');
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   callWorkShops();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    x = 0;
    workShopProvider = Provider.of<WorkShopProvider>(context, listen: true);
    print(
        "length" + workShopProvider.listRegisteredCustomers.length.toString());
    for (int i = 0; i < workShopProvider.listRegisteredCustomers.length; i++) {
      x = x +
          workShopProvider
              .listRegisteredCustomers[i].customer!.noOfAttendancies!
              .toInt();
    }

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
              workShopProvider.listRegisteredCustomers.length != null &&
                      workShopProvider.listRegisteredCustomers.length > 0
                  ? w > 800
                      ? Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width * 0.2,
                            // right: MediaQuery.of(context).size.width * 0.18,
                            //   top: 40
                          ),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.8,
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: MediaQuery.removePadding(
                              removeTop: false,
                              removeBottom: false,
                              context: context,
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 5),
                                child: ListView.builder(
                                  // gridDelegate:
                                  //     SliverGridDelegateWithFixedCrossAxisCount(
                                  //         crossAxisCount: w > 750 ? 1 : 1,
                                  //         crossAxisSpacing: 5.0,
                                  //         mainAxisSpacing: 5.0,
                                  //         childAspectRatio: 3.8 / 2),
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 16.0),
                                      child: cardworkShop(workShopProvider
                                          .listRegisteredCustomers[index]),
                                    );
                                  },
                                  itemCount: workShopProvider
                                      .listRegisteredCustomers.length,
                                  scrollDirection: Axis.vertical,
                                  primary: false,
                                  shrinkWrap: true,
                                ),
                              ),
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.7,
                            //    color: Color(0xffE5E5E5),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4),
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 2),
                                child: ListView.builder(
                                  itemBuilder: (context, index) {
                                    return cardWorkShopMobile(workShopProvider
                                        .listRegisteredCustomers[index]);
                                  },
                                  itemCount: workShopProvider
                                      .listRegisteredCustomers.length,
                                  scrollDirection: Axis.vertical,
                                  primary: false,
                                  shrinkWrap: true,
                                ),
                              ),
                            ),
                          ),
                        )
                  : Container(),

              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  color: Colors.white,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Total registered to attend :  ${x}',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget cardworkShop(RegisterUsersWorkshop customer) {
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
              SizedBox(width: 20),
              Text(
                  customer.customer!.firstName != null
                      ? 'Name : ' + customer.customer!.firstName.toString()
                      : 'Name ',
                  style: TextStyle(
                      fontSize: 26,
                      color: Colors.black,
                      fontWeight: FontWeight.w700)),
              SizedBox(height: 10),
              Text('Phone : ' + customer.customer!.mobileNumber.toString(),
                  style: TextStyle(
                      fontSize: 26,
                      color: Colors.black,
                      fontWeight: FontWeight.w400)),
              SizedBox(height: 10),
              Text(
                  'No. of atte : ' +
                      customer.customer!.noOfAttendancies.toString(),
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.w400)),
              SizedBox(height: 10),
              Text('Unit num : ' + customer.customer!.unitNumber.toString(),
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.w400)),
              SizedBox(height: 10),
              Text('Email : ' + customer.customer!.email.toString(),
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.w400)),
            ],
          ),
        ),
      ),
    );
  }

  Widget cardWorkShopMobile(RegisterUsersWorkshop customer) {
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
              SizedBox(width: 5),
              Padding(
                  padding: const EdgeInsets.only(bottom: 6.0),
                  child: Text(
                    customer.customer!.firstName != null
                        ? 'Name : ' + customer.customer!.firstName.toString()
                        : 'Name',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    maxLines: 1,
                    softWrap: true,
                  )),
              Padding(
                padding: const EdgeInsets.only(bottom: 6.0),
                child: Text(
                    'Phone : ' + customer.customer!.mobileNumber.toString(),
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w500)),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 6.0),
                child: Text(
                    'No. of atte : ' +
                        customer.customer!.noOfAttendancies.toString(),
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w500)),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 6.0),
                child: Text(
                    'Unit  : ' + customer.customer!.unitNumber.toString(),
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w500)),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 6.0),
                child: Text('Email : ' + customer.customer!.email.toString(),
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w500)),
              ),
              // SizedBox(
              //   height: 35,
              //   width: 120,
              //   child: ButtonTheme(
              //     //minWidth: 200.0,
              //     //   height:32.h,
              //       shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(12.0),
              //           side: const BorderSide(color: Color(0xFF71B3E3))),
              //       child: RaisedButton(
              //           color: Color(0xFF71B3E3),
              //           child: Text("Details",
              //               style: TextStyle(
              //                   fontSize: 18,
              //                   color: Colors.white,
              //                   fontWeight: FontWeight.w500)),
              //           onPressed: () async {
              //             await workShopProvider
              //                 .setSelectedEvent(workShopModel);
              //             Navigator.of(context).pushNamed(
              //                 DescriptionPage.route,
              //                 arguments: workShopModel);
              //           })),
              // )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    workShopProvider = Provider.of<WorkShopProvider>(context, listen: false);
    workShopProvider.getAllCustomersByEventId();

    setState(() {});
  }

  Future callWorkShops() async {
    await workShopProvider.getAllCustomersByEventId();
    // sleep(const Duration(seconds: 15));
    //  userAddressProvider.faillRegions();
    //   userAddressProvider.faillCities();
    //setState(() {});
  }
}
