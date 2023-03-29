// carousel for home page

import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_mall_demo/utils.dart';
import 'package:flutter/material.dart';

class Carousel extends StatelessWidget {
  Carousel({Key? key}) : super(key: key);

  final List _assets = [
    {'url': 'https://picsum.photos/id/27/800/450', 'id': '1'},
    {'url': 'https://picsum.photos/id/33/800/450', 'id': '2'},
    {'url': 'https://picsum.photos/id/32/800/450', 'id': '3'},
    {'url': 'https://picsum.photos/id/34/800/450', 'id': '4'},
    {'url': 'https://picsum.photos/id/33/800/450', 'id': '5'},
  ];
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        enlargeCenterPage: true,
        enlargeStrategy: CenterPageEnlargeStrategy.zoom,
        aspectRatio: 16 / 9,
        autoPlay: true,
      ),
      items: _assets.map((asset) {
        return Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: gap['s']!),
          decoration: const BoxDecoration(
            color: Colors.red,
          ),
          child: Stack(
            children: [
              Image(
                height: double.infinity,
                fit: BoxFit.cover,
                image: NetworkImage(
                  asset['url'],
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  alignment: Alignment.bottomLeft,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black12,
                        Colors.black,
                      ],
                    ),
                  ),
                  padding: EdgeInsets.all(gap['m']!),
                  child: Text(
                    'No. ${asset["id"]}',
                    style: Theme.of(context).textTheme.titleMedium!.merge(
                          const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
