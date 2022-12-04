import 'package:draggable_scrollable_sheet/properties_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Stack(
        children: [
          const Positioned.fill(
            child: PropertyPage(),
          ),
          Positioned.fill(
            child: _getDraggableScrollableSheet(),
          ),
        ],
      ),
    );
  }

  SizedBox _getDraggableScrollableSheet() {
    return SizedBox.expand(
      child: DraggableScrollableSheet(
        minChildSize: 0.1,
        maxChildSize: 0.8,
        initialChildSize: 0.1,
        builder: (BuildContext context, ScrollController scrollController) {
          return SingleChildScrollView(

            controller: scrollController,
            child: Container(
              margin: EdgeInsets.only(
                top: 0.05 * getSize(context).height,
              ),
              height: 0.75 * getSize(context).height,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(30.0),
                  topLeft: Radius.circular(30.0),
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5.0,
                    spreadRadius: 20.0,
                    offset: const Offset(0.0, 5.0),
                    color: Colors.black.withOpacity(0.1),
                  )
                ],
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 0.025 * getSize(context).height),
                  Row(
                    children: [
                      const Spacer(),
                      Container(
                        height: 4,
                        width: 0.2 * getSize(context).width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.grey,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  SizedBox(height: 0.025 * getSize(context).height),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, top: 8.0, bottom: 8.0),
                    child: Text("Your Properties",
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontWeight: FontWeight.w600)),
                  ),
                  Expanded(
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: listImages.length,
                      itemBuilder: (context, index) =>
                          _buildVerticalItem(context, index),
                      padding: const EdgeInsets.only(left: 10.0, bottom: 10.0),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
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
            height: 0.25 * getSize(context).height,
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

  Size getSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }
}
