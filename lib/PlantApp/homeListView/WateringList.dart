import 'dart:ui';

import 'package:assignments/PlantApp/homeListView/productmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class WateringPlantsList extends StatelessWidget {
  final List<Data> datas = [
    Data(
        image:
        'assets/images/Philodendron.png',
        name: 'Filodendro atom',
        stringdata: '250ml'),
    Data(
        image:
        'assets/images/Monstera.png',
        name: 'Monstera Deliciosa',
        stringdata: '500ml'),
    Data(
        image:
        'assets/images/Chlorophytum.png',
        name: 'Chlorophytum ',
        stringdata: '500ml'),
    Data(
        image:
        'assets/images/Kentiapalm.png',
        name: 'Kentiapalm ',
        stringdata: '250ml'),
    Data(
        image:
        'assets/images/Peperomia.png',
        name: 'Peperomia Obtusifolia ',
        stringdata: '250ml'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.settings_outlined),
        title: Text(
          'Water Today',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.add_circle_outline,
              color: Colors.blueGrey,
            ),
          )
        ],
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              // Define the routes for different screens
              String routeName;
              switch (index) {
                case 0:
                  routeName = 'Plant1';
                  break;
                case 1:
                  routeName = 'Plant2';
                  break;
                case 2:
                  routeName = 'Plant3';
                  break;
                case 3:
                  routeName = 'Plant4';
                  break;
                case 4:
                  routeName = 'Plant5';
                  break;

              // Add more cases for other screens
                default:
                // Handle default case
                  routeName = '/';
              }
              // Navigate to the selected screen
              Navigator.pushNamed(context, routeName);
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: 203,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8K98MME_fpRSN_NjTR-7SKTWKFtnkO7c2DYSiJioyEw&s",
                    ),
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(datas[index].image ?? ''),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          datas[index].name ?? '',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.water_drop_outlined),
                            Text(datas[index].stringdata ?? ''),
                          ],
                        ),
                      ],
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white70,
                      radius: 14,
                      child: Icon(
                        Icons.water_drop_outlined,
                        size: 25,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          if ((index + 1) % 4 == 0) {
            return Text(
              'Fri, February 7',
              style: TextStyle(
                fontSize: 28,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            );
          } else {
            return Container();
          }
        },
        itemCount: datas.length,
      ),
    );
  }
}