import 'package:assignments/homeListView/productmodel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WateringPlants_list extends StatelessWidget {
  var datas = [
    Data(image: 'https://lalitenterprise.com/cdn/shop/products/Sellum-plant.webp?v=1669542129', name: 'Filodendro atom', stringdata: '250ml'),
    Data(image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTptS9_DoeG4LFvjw2RgCj3E1Eq1z0qPAqZMTIq7x1cKQ&s', name: 'Monstera Deliciosa', stringdata: '500ml'),
    Data(image: 'https://m.media-amazon.com/images/I/61Mgr2Q7yML._AC_UF1000,1000_QL80_.jpg', name: 'Chlorophytum ', stringdata: '500ml'),
    Data(image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRSj7lfQuH4gygpUumpiOJMgi-VzT4DP04a89s8XdJJvw&s', name: 'Kentiapalm ', stringdata: '250ml'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.settings_outlined),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add_circle_outlined),
            color: Colors.blueGrey,
            onPressed: () {},
          ),
        ],
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
                          style: GoogleFonts.lato(fontSize: 20),
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
            if (index == 2) {
              return Text(
                'Fri, February 7',
                style: GoogleFonts.sahitya(color: Colors.black),
              );
            } else {
              return Container();
            }
          },
          itemCount: datas.length),
    );
  }
}
