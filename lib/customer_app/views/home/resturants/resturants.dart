import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants.dart';
import 'components/resturant_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Resturants extends StatefulWidget {
  @override
  _ResturantsState createState() => _ResturantsState();
}

class _ResturantsState extends State<Resturants> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  String name;
  String description;
  String image;
  String stars;
  String startFrom;
  String deliveryFee;
  bool isLoaded = false;
  @override
  void initState() {
    super.initState();
    if (isLoaded == false) {
      _getUserD();
    }
    if (isLoaded == true) {
      print("data loaded");
    }
    // print("User id is $userr");
  }

  // assigning user value to local veriables
  // void _assignData(_name, _description, _image, _startFrom, _deliveryFree) {
  //   name = _name;
  //   image = _image;
  //   description = _description;
  //   startFrom = _startFrom;
  //   deliveryFee = _deliveryFree;
  //   setState(() {});
  // }

  // getting user info
  Future<dynamic> _getUserD() async {
    await firestore.collection('resturants').get().then((value) {
      // var data = value.();
      print(value);
      // String _name = data['name'];
      // String _description = data['description'];
      // String _deliveryFee = data['delivery_fee'];
      // String _startFrom = data['start_from'];
      // String _image = data['image'];
      // _assignData(_name, _description, _image, _deliveryFee, _startFrom);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                      bottom: 36 + 20.0,
                    ),
                    margin: EdgeInsets.only(bottom: 10 * 1.5),
                    height: MediaQuery.of(context).size.height / 4,
                    decoration: BoxDecoration(
                        color: kThemeColor,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(50),
                            bottomLeft: Radius.circular(50))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          kGetTranslated(context, 'resturants'),
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Icon(
                          Icons.food_bank,
                          color: Colors.white,
                          size: 50,
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      height: 54,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 10),
                                blurRadius: 50,
                                color: Colors.black.withOpacity(0.30))
                          ]),
                      child: Center(
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: kGetTranslated(context, 'search_resturants'),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              suffixIcon: Icon(Icons.search)),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [Text(kGetTranslated(context, 'nearby_resturants'))],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  // FutureBuilder(
                  //   future: firestore.collection('resturants').get(),
                  //   builder: (BuildContext context, AsyncSnapshot snapshot) {
                  //     print(snapshot.data.lenght);
                  //     print("InsideFutureBuilder");
                  //     if (snapshot.hasData) {
                  //       return Text(snapshot.data.docs.data()['name']);
                  //     } else {
                  //       return Center(
                  //         child: CircularProgressIndicator(),
                  //       );
                  //     }
                  //   },
                  // ),
                  ResturantCard(
                    title: "Arabic Resturant",
                    subtitle:
                        "Camel Korma, Meat korma, Kabaab, salad , suit pasti, naaan",
                    image: "images/arabicRest.jpg",
                    minRate: "99",
                    deleveryFee: "50",
                  ),
                  ResturantCard(
                    title: "Safari Resturant",
                    subtitle:
                        "Camel Korma, Meat korma, Kabaab, salad , suit pasti, naaan",
                    image: "images/safariRest.jpg",
                    minRate: "80",
                    deleveryFee: "100",
                  ),
                  ResturantCard(
                    title: "Fast Food",
                    subtitle:
                        "Camel Korma, Meat korma, Kabaab, salad , suit pasti, naaan",
                    image: "images/fastFoodRest.jpg",
                    minRate: "99",
                    deleveryFee: "50",
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
