import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'my_classes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController ctrl;
  @override
  void initState() {
    super.initState();
    ctrl = TabController(
      length: 4,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: (() {}), icon: Icon(Icons.menu_rounded)),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.lightBlueAccent,
                    image: DecorationImage(
                        image: AssetImage("images/tuxedo.png"),
                        fit: BoxFit.contain),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 3),
                        blurRadius: 6,
                        spreadRadius: 4,
                        color: Colors.grey.withOpacity(0.3),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text("SEARCH FOR",
                style: GoogleFonts.notoSans(
                    fontWeight: FontWeight.w800, fontSize: 27)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text("FOOD",
                style: GoogleFonts.notoSans(
                    fontWeight: FontWeight.w800, fontSize: 27)),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            margin: EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(15)),
            child: TextField(
              decoration: InputDecoration(
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                hintText: "Search",
                hintStyle: GoogleFonts.notoSans(fontSize: 14.0),
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text("Recommended",
                style: GoogleFonts.notoSans(
                    fontWeight: FontWeight.w600, fontSize: 20)),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 205,
            child: ListView(
                padding: EdgeInsets.only(left: 30),
                scrollDirection: Axis.horizontal,
                children: [
                  FoodCard(
                    foodName: "Burger",
                    img: "burger.png",
                    price: "7",
                    backgroundColor: Color(0xFFFFE9C6),
                    fontColor: Color(0xFFDA9551),
                  ),
                  FoodCard(
                    foodName: "Chips",
                    img: "fries.png",
                    price: "4",
                    backgroundColor: Color(0xFFC2E3FE),
                    fontColor: Color(0xFF6A8CAA),
                  ),
                  FoodCard(
                    foodName: "Donuts",
                    img: "doughnut.png",
                    price: "2",
                    backgroundColor: Color(0xFFD7FADA),
                    fontColor: Color(0xFF56CC7E),
                  )
                ]),
          ),
          TabBar(
            padding: EdgeInsets.only(left: 15),
            isScrollable: true,
            labelColor: Colors.black,
            labelStyle:
                GoogleFonts.notoSans(fontWeight: FontWeight.w700, fontSize: 17),
            unselectedLabelColor: Colors.grey,
            unselectedLabelStyle:
                GoogleFonts.notoSans(fontWeight: FontWeight.w500, fontSize: 13),
            indicatorColor: Colors.transparent,
            tabs: [
              Tab(
                child: Text("FEATURED"),
              ),
              Tab(
                child: Text("COMBOS"),
              ),
              Tab(
                child: Text("FAVORITES"),
              ),
              Tab(
                child: Text("RECOMMENDED"),
              ),
            ],
            controller: ctrl,
          ),
          Container(
            height: MediaQuery.of(context).size.height -550,
            child: TabBarView(controller: ctrl, children: [
              FoodTab(foodList: ["burger","pizza","hotdog","donuts"],),
              FoodTab(foodList: ["pizza","fries","popcorn","cheese"],),
              FoodTab(foodList: ["tacos","burger","pizza"],),
              FoodTab(foodList: ["sandwich","tacos","hotdog","fries"],)
            ]),
          )
        ],
      ),
    );
  }
}
