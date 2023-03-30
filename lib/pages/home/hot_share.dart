// hot share for home page
import 'package:e_mall_demo/common/simple_masonry_view.dart';
import 'package:e_mall_demo/styles.dart';
import 'package:e_mall_demo/utils.dart';
import 'package:flutter/material.dart';

class HotShare extends StatelessWidget {
  HotShare({Key? key}) : super(key: key);

  final List _products = [
    {
      'url': 'https://picsum.photos/id/27/600/400',
      'content': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
      'like': 123,
    },
    {
      'url': 'https://picsum.photos/id/33/400/600',
      'content':
          'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      'like': '3432',
    },
    {
      'url': 'https://picsum.photos/id/32/800/400',
      'content': 'tristique',
      'like': '3432',
    },
    {
      'url': 'https://picsum.photos/id/34/400/200',
      'content':
          'Massa enim nec dui nunc. Tempus quam pellentesque nec nam aliquam sem et.',
      'like': '3432',
    },
    {
      'url': 'https://picsum.photos/id/33/400/600',
      'content':
          'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      'like': '3432',
    },
    {
      'url': 'https://picsum.photos/id/27/600/400',
      'content': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
      'like': 123,
    },
    {
      'url': 'https://picsum.photos/id/33/400/600',
      'content':
          'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      'like': '3432',
    },
    {
      'url': 'https://picsum.photos/id/32/800/400',
      'content': 'tristique',
      'like': '3432',
    },
    {
      'url': 'https://picsum.photos/id/34/400/200',
      'content':
          'Massa enim nec dui nunc. Tempus quam pellentesque nec nam aliquam sem et.',
      'like': '3432',
    },
    {
      'url': 'https://picsum.photos/id/33/400/600',
      'content':
          'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      'like': '3432',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: gap['l']!, bottom: gap['l']!),
      child: Column(
        children: [
          Text(
            '热门分享',
            style: Styles.title,
          ),
          SizedBox(
            height: gap['l']!,
          ),
          Container(
            padding: EdgeInsets.only(
              left: gap['l']!,
              right: gap['l']!,
            ),
            child: SimpleMasonryView(
              countOfColumn: 2,
              items: _products,
              itemBuilder: (dynamic item) {
                return Container(
                  clipBehavior: Clip.hardEdge,
                  margin: EdgeInsets.only(
                    bottom: gap['l']!,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(gap['m']!),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromRGBO(0, 0, 0, 0.2),
                        blurRadius: gap['s']!,
                        offset: Offset(0, gap['s']!),
                      ),
                    ],
                  ),
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image(
                          width: double.infinity,
                          fit: BoxFit.fitWidth,
                          image: NetworkImage(item['url']),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            left: gap['s']!,
                            top: gap['s']!,
                            right: gap['s']!,
                          ),
                          child: Text(
                            item['content'],
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.all(gap['s']!),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.local_fire_department,
                                  color: Theme.of(context).primaryColor,
                                  size: 12.0,
                                ),
                                Text(
                                  item['like'].toString(),
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
