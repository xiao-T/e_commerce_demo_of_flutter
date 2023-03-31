// header for profile
import 'package:e_mall_demo/utils.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const String eMail = '270199332 at qq.com';
    return Stack(
      // clipBehavior: Clip.none,
      alignment: const Alignment(0.0, 1.8),
      children: [
        Container(
          height: 290.0,
          width: double.infinity,
          padding: const EdgeInsets.only(bottom: 50.0),
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage('https://picsum.photos/id/137/600/400'),
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 80.0,
              height: 80.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    blurRadius: gap['m']!,
                    offset: const Offset(0, 0),
                  ),
                ],
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage('https://picsum.photos/id/137/600/400'),
                ),
              ),
            ),
            Text(
              'XiaoT',
              style: Theme.of(context).textTheme.headlineSmall?.merge(
                    TextStyle(
                      shadows: [
                        Shadow(
                          color: Colors.black26,
                          blurRadius: gap['m']!,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                  ),
            ),
            SelectableText(
              eMail,
              style: Theme.of(context).textTheme.bodyLarge?.merge(
                    TextStyle(
                      shadows: [
                        Shadow(
                          color: Colors.black26,
                          blurRadius: gap['m']!,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
