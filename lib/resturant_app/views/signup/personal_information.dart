import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:food_delivery_app/resturant_app/views/home/resturant_home.dart';
import 'package:food_delivery_app/resturant_app/views/signup/components/personal_inputs.dart';
import 'package:food_delivery_app/resturant_app/views/signup/components/personal_radio_buttons.dart';
import 'package:food_delivery_app/resturant_app/views/signup/components/personal_sceent_dropdown.dart';
import 'package:food_delivery_app/resturant_app/views/signup/components/drop_down_list_values.dart';

class PersonalInformations extends StatefulWidget {
  @override
  _PersonalInformationsState createState() => _PersonalInformationsState();
}

class _PersonalInformationsState extends State<PersonalInformations> {
  String providerValue = "Resturant";
  List<DropdownMenuItem> getProviderList() {
    List<DropdownMenuItem<String>> list = [];
    for (var i = 0; i < providerType.length; i++) {
      String currency = providerType[i];
      var newList = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      list.add(newList);
    }
    return list;
  }

  String segments = "Regular Resturant";
  List<DropdownMenuItem> getSegmentList() {
    List<DropdownMenuItem<String>> list = [];
    for (var i = 0; i < segmentsResturants.length; i++) {
      String currency = segmentsResturants[i];
      var newList = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      list.add(newList);
    }
    return list;
  }

  String cuisine = "Cuisine";
  List<DropdownMenuItem> getCuisineList() {
    List<DropdownMenuItem<String>> list = [];
    for (var i = 0; i < cuisineList.length; i++) {
      String currency = cuisineList[i];
      var newList = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      list.add(newList);
    }
    return list;
  }

  int doYouHaveFranchise = 0;
  void doYouHaveFranchiseValueChange(val) {
    setState(() {
      doYouHaveFranchise = val;
      print(doYouHaveFranchise);
    });
  }

  int doYouHaveDeliveryService = 0;
  void doYouHaveDeliveryServiceValueChange(val) {
    setState(() {
      doYouHaveDeliveryService = val;
      print(doYouHaveDeliveryService);
    });
  }

  int doYouHaveOtherApplications = 0;
  void doYouHaveOtherApplicationsValueChange(val) {
    setState(() {
      doYouHaveOtherApplications = val;
      print(doYouHaveOtherApplications);
    });
  }

  int areYouTheOwner = 0;
  void areYouTheOwnerValueChange(val) {
    setState(() {
      areYouTheOwner = val;
      print(areYouTheOwner);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "New Partner Registration",
                  style: kTopLebelStyle,
                ),
                SizedBox(
                  height: 10,
                ),
                PersonalInputs(
                  hintText: "Business Name",
                  keyBordType: TextInputType.name,
                  onTap: (val) {
                    print(val);
                  },
                ),
                DropDownMenue(
                  title: "Vertical",
                  items: getProviderList(),
                  value: providerValue,
                  onchanged: (val) {
                    setState(() {
                      providerValue = val;
                    });
                  },
                ),
                DropDownMenue(
                  title: "Vertical Segment \nResturants",
                  items: getSegmentList(),
                  value: segments,
                  onchanged: (val) {
                    setState(() {
                      segments = val;
                    });
                  },
                ),
                DropDownMenue(
                  title: "Cuisine",
                  items: getCuisineList(),
                  onchanged: (val) {
                    setState(() {
                      cuisine = val;
                    });
                  },
                  value: cuisine,
                ),
                PersonalInputs(
                  hintText: "City",
                  keyBordType: TextInputType.text,
                  onTap: (val) {
                    print(val);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                PersonalInputs(
                  hintText: "Business Address",
                  keyBordType: TextInputType.streetAddress,
                  onTap: (val) {
                    print(val);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                PersonalInputs(
                  hintText: "First Name",
                  keyBordType: TextInputType.name,
                  onTap: (val) {
                    print(val);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                PersonalInputs(
                  hintText: "Last Name",
                  keyBordType: TextInputType.name,
                  onTap: (val) {
                    print(val);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                PersonalInputs(
                  hintText: "Contact Number",
                  keyBordType: TextInputType.number,
                  onTap: (val) {
                    print(val);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                PersonalInputs(
                  hintText: "Email",
                  keyBordType: TextInputType.emailAddress,
                  onTap: (val) {
                    print(val);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                PersonalInputs(
                  hintText: "Commercial Registration",
                  keyBordType: TextInputType.text,
                  onTap: (val) {
                    print(val);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                PersonalInputs(
                  hintText: "Number of branches",
                  keyBordType: TextInputType.number,
                  onTap: (val) {
                    print(val);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                PersonalRadioButtons(
                  title: "Do You Part of a franchise?",
                  grupValue: doYouHaveFranchise,
                  radio1Value: 0,
                  radio2Value: 1,
                  radio1ValueOnChange: (val) {
                    setState(() {
                      doYouHaveFranchise = val;
                    });
                  },
                  radio2ValueOnChange: (val) {
                    setState(() {
                      doYouHaveFranchise = val;
                    });
                  },
                ),
                PersonalRadioButtons(
                  title: "Do You have a delivery service?",
                  grupValue: doYouHaveDeliveryService,
                  radio1Value: 0,
                  radio2Value: 1,
                  radio1ValueOnChange: (val) {
                    setState(() {
                      doYouHaveDeliveryService = val;
                    });
                  },
                  radio2ValueOnChange: (val) {
                    setState(() {
                      doYouHaveDeliveryService = val;
                    });
                  },
                ),
                PersonalRadioButtons(
                  title: "Are you on other delivery applications?",
                  grupValue: doYouHaveOtherApplications,
                  radio1Value: 0,
                  radio2Value: 1,
                  radio1ValueOnChange: (val) {
                    setState(() {
                      doYouHaveOtherApplications = val;
                    });
                  },
                  radio2ValueOnChange: (val) {
                    setState(() {
                      doYouHaveOtherApplications = val;
                    });
                  },
                ),
                PersonalRadioButtons(
                  title: "Are you the owner?",
                  grupValue: areYouTheOwner,
                  radio1Value: 0,
                  radio2Value: 1,
                  radio1ValueOnChange: (val) {
                    setState(() {
                      areYouTheOwner = val;
                    });
                  },
                  radio2ValueOnChange: (val) {
                    setState(() {
                      areYouTheOwner = val;
                    });
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 50,
                  color: kThemeColor,
                  minWidth: MediaQuery.of(context).size.width,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResturantHomePage(),
                      ),
                    );
                  },
                  child: Text(
                    "Submit Form",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
