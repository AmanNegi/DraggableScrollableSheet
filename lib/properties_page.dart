/*
This file is part of the FlutterUIKit Library
(https://github.com/AmanNegi/flutter_30_days)
 */

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PropertyPage extends StatefulWidget {
  const PropertyPage({Key? key}) : super(key: key);
  @override
  PropertyPageState createState() => PropertyPageState();
}

class PropertyPageState extends State<PropertyPage> {
  Color mainColor = const Color(0XFFEEF3F7);
  double height = 0, width = 0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      width = constraints.maxWidth;
      height = constraints.maxHeight;
      return Theme(
        data: ThemeData(
            fontFamily: GoogleFonts.poppins().fontFamily,
            scaffoldBackgroundColor: mainColor,
            primaryColor: Colors.black87),
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).padding.top + 10),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.all(5.0),
                        child: const Icon(Icons.sort),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    "Discover\nProperties",
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontWeight: FontWeight.w700, color: Colors.black),
                  ),
                ),
                SizedBox(height: 0.05 * height),
                _buildSearchBar(),
                const SizedBox(height: 10),
                SizedBox(
                  height: 0.325 * height,
                  child: ListView.builder(
                    padding: const EdgeInsets.only(left: 10.0),
                    scrollDirection: Axis.horizontal,
                    itemCount: listImages.length,
                    itemBuilder: (context, index) => _buildItem(context, index),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15.0, top: 8.0, bottom: 8.0),
                  child: Text("Recommended Properties",
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontWeight: FontWeight.w600)),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: listImages.length,
                  itemBuilder: (context, index) =>
                      _buildVerticalItem(context, index),
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(left: 10.0, bottom: 10.0),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  _buildVerticalItem(BuildContext context, int index) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(8.0),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              blurRadius: 5.0,
              offset: const Offset(0.0, 3.0),
              color: Colors.black.withOpacity(0.05),
              spreadRadius: 2.0,
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 0.25 * height,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(listImages[index], fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "White Smith Villa",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  Text("Meriose Venue",
                      style: Theme.of(context).textTheme.caption),
                ],
              ),
              const Spacer(),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 4.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: const Color(0xFFFFCFA9),
                ),
                child: const Text(
                  "\$250/mo",
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _buildItem(BuildContext context, int index) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(8.0),
      width: 0.5 * width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              blurRadius: 5.0,
              offset: const Offset(0.0, 3.0),
              color: Colors.black.withOpacity(0.05),
              spreadRadius: 2.0,
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                listImages[index],
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "White Smith Villa",
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          Text("Meriose Venue", style: Theme.of(context).textTheme.caption),
        ],
      ),
    );
  }

  _buildSearchBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            offset: const Offset(3.0, 3.0),
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 4.0,
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 4.0),
      child: Row(
        children: [
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search",
                  contentPadding: EdgeInsets.only(left: 20.0)),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(10.0)),
            child: const Icon(Icons.search, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

List<String> listImages = [
  "https://images.unsplash.com/photo-1512917774080-9991f1c4c750?crop&w=1050&q=80",
  "https://images.unsplash.com/photo-1472224371017-08207f84aaae?crop&w=1350&q=80",
  "https://images.unsplash.com/photo-1523217582562-09d0def993a6?crop&w=1050&q=80",
  "https://images.unsplash.com/photo-1577552568192-467a12a7f376?crop&w=1050&q=80"
];
