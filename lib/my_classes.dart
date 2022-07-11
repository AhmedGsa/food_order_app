import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'food.dart';

class FoodCard extends StatelessWidget {
  String foodName;
  String price;
  String img;
  Color? backgroundColor = Colors.yellow;
  Color? fontColor = Colors.black;
  FoodCard(
      {required this.foodName,
      required this.price,
      required this.img,
      this.backgroundColor,
      this.fontColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 140,
          height: 205,
          padding: EdgeInsets.symmetric(vertical: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 75,
                width: 75,
                child: Center(
                    child: Image.asset(
                  "images/$img",
                  width: 50,
                  height: 50,
                )),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text("$foodName",
                  style: GoogleFonts.notoSans(
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                      color: fontColor)),
              Text("$price\$",
                  style: GoogleFonts.notoSans(
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                      color: fontColor))
            ],
          ),
          decoration: BoxDecoration(
              color: backgroundColor, borderRadius: BorderRadius.circular(20)),
        ),
        SizedBox(
          width: 20,
        )
      ],
    );
  }
}

class FoodInfo extends StatelessWidget {
  String oldPrice;
  String newPrice;
  String foodName;
  int rating;
  String img;

  FoodInfo(
      {required this.foodName,
      required this.newPrice,
      required this.oldPrice,
      required this.rating,
      required this.img});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 250,
                child: Row(
                  children: [
                    Container(
                      height: 65,
                      width: 65,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Center(
                          child: Image(
                        image: AssetImage("images/$img"),
                        width: 40,
                        height: 40,
                      )),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "$foodName",
                          style: GoogleFonts.notoSans(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                        SmoothStarRating(
                            allowHalfRating: false,
                            onRated: (v) {},
                            starCount: rating,
                            rating: rating.toDouble(),
                            size: 18,
                            isReadOnly: true,
                            color: Color.fromARGB(255, 228, 208, 31),
                            borderColor: Color.fromARGB(255, 228, 208, 31),
                            spacing: 0.0),
                        Row(
                          children: [
                            Text(
                              "\$$newPrice",
                              style: GoogleFonts.notoSans(
                                  color: Colors.deepOrange,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text("\$$oldPrice",
                                style: GoogleFonts.notoSans(
                                    fontSize: 15,
                                    color: Colors.grey,
                                    decoration: TextDecoration.lineThrough))
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              FloatingActionButton(
                onPressed: (() {}),
                child: Icon(
                  Icons.add,
                  size: 40,
                ),
                backgroundColor: Colors.orange,
              )
            ],
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}

class FoodTab extends StatelessWidget {
  List<String> foodList;
  FoodTab({required this.foodList});
  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];
    for (var name in foodList) {
      list.add(food[name]);
    }
    return Scaffold(
      body: ListView(
        children: list,
      ),
    );
  }
}
