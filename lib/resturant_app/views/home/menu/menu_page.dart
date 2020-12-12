import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:food_delivery_app/resturant_app/views/home/menu/components/offer.dart';
import 'package:food_delivery_app/resturant_app/views/home/menu/components/offer_card.dart';

import 'components/add_menu_inputs.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  String cardLebel;

  String startPrice;

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  var user;

  void checkUserId() {
    var firebaseUser = auth.currentUser.uid;
    setState(() {
      user = firebaseUser;
      print(user);
    });
  }

  void addCard() async {
    print("this userid got  $user");
    await firestore
        .collection('resturants')
        .doc(user)
        .collection('itemCard')
        .doc(cardLebel)
        .set({
      'menuCardName': cardLebel,
      'startPrice': startPrice,
    });
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      context: context,
      builder: (BuildContext bc) {
        return Container(
          child: new Wrap(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Add New Menu Field",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: AddMenuInputs(
                              hintText: "Lebel Name",
                              onTap: (val) {
                                setState(() {
                                  cardLebel = val;
                                });
                              },
                            ),
                          ),
                          Expanded(
                            child: AddMenuInputs(
                              hintText: "Minimum Price",
                              onTap: (val) {
                                setState(() {
                                  startPrice = val;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      MaterialButton(
                        color: kThemeColor,
                        onPressed: () {
                          addCard();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MenuPage(),
                            ),
                          );
                        },
                        child: Text("Done"),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    checkUserId();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Menu"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: firestore
                  .collection('resturants')
                  .doc(user)
                  .collection('itemCard')
                  .get(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (ctx, i) {
                      print(snapshot.data.docs.length);
                      print(snapshot.data.docs[i].data()['startPrice']);
                      return OfferCard(
                        title:
                            snapshot.data.docs[i].data()['menuCardName'] == null
                                ? "Loading.."
                                : snapshot.data.docs[i].data()['menuCardName'],
                        price: "from SR ${snapshot.data.docs[i].data()['startPrice']}" ==
                                null
                            ? "Loading.."
                            : "from SR ${snapshot.data.docs[i].data()['startPrice']}",
                        children: [],
                      );
                    },
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            OfferCard(
              title: "New Arrival",
              price: "from SR 500.00",
              children: [
                Offer(
                  title: "Asian Dish",
                  discription:
                      "small asian pizza now available in our resturant",
                  image: "images/food.png",
                ),
                Offer(
                  title: "Pakistani Food",
                  discription: "Pakistani Sweet dish with testy swalish",
                  image: "images/engRest.jpg",
                ),
              ],
            ),
            OfferCard(
              title: "Pizza's",
              price: "from SR 140.00",
              children: [
                Offer(
                  title: "American Pizza",
                  discription:
                      "American pizza and get more spicy any 6 inch pizza ",
                  image: "images/pizza.jpg",
                ),
                Offer(
                  title: "Asian Pizza",
                  discription: "Asian Pizza and get more spicy pizza ",
                  image: "images/pizza1.png",
                ),
                Offer(
                  title: "Italiano Pizza",
                  discription: "Italiano Pizza  any 6 inch pizza ",
                  image: "images/pizza2.jpg",
                ),
              ],
            ),
            OfferCard(
              title: "Vegitarians",
              price: "from SR 140.00",
              children: [
                Offer(
                  title: "Mix Vegitable",
                  discription: "6 Mix vagitables with spicy mod",
                  image: "images/arabicRest.jpg",
                ),
                SizedBox(
                  height: 5,
                ),
                Offer(
                  title: "Mix Vegitable",
                  discription: "6 Mix vagitables with spicy mod",
                  image: "images/safariRest.jpg",
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Add More Menu Fields",
                    textAlign: TextAlign.center,
                  ),
                  MaterialButton(
                    color: kThemeColor,
                    onPressed: () {
                      _settingModalBottomSheet(context);
                    },
                    child: Text(
                      "Add",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
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
