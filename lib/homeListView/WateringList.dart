import 'dart:ui';

import 'package:assignments/homeListView/productmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class WateringPlants_list extends StatelessWidget {
  var datas = [
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
        leading: const Icon(Icons.settings_outlined),
        // title: const Text(
        //   'Water Today',
        //   style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        // ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add_circle_outline,
                color: Colors.blueGrey,
              ))
        ],
        title: const Text('Water Today',
        style:TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
      ),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: 200,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8K98MME_fpRSN_NjTR-7SKTWKFtnkO7c2DYSiJioyEw&s")),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      topLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.network('${datas[index].image}'),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          datas[index].name!,
                          style: GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Icon(Icons.water_drop_outlined),
                            Text(
                              datas[index].stringdata!,
                              style: GoogleFonts.sahitya(),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const CircleAvatar(
                      backgroundColor: Colors.white70,
                      radius: 20,
                      child: Icon(
                        Icons.water_drop_outlined,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            if ((index + 1) % 4 == 0) {
              return Text(
                'Fri, February 7',
                style: GoogleFonts.sahitya(fontSize: 28,color: Colors.black, fontWeight:FontWeight.bold),
              );
            } else {
              return Container();
            }
          },
          itemCount: datas.length),
    );
  }
}