// header for profile
import 'dart:ui';

import 'package:e_mall_demo/models/user_info.dart';
import 'package:e_mall_demo/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'edit_form.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final userInfoProvider = context.watch<UserInfoModel>();
    return SizedBox(
      height: 370.0,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: 290.0,
            clipBehavior: Clip.hardEdge,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage('https://picsum.photos/id/137/600/400'),
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
            child: const SizedBox(
              height: 290.0,
            ),
          ),
          Positioned(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.bottomRight,
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
                      image:
                          NetworkImage('https://picsum.photos/id/137/600/400'),
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(gap['s']!),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          blurRadius: gap['m']!,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (_) {
                            return const EditForm();
                          },
                        );
                      },
                      child: AbsorbPointer(
                        child: Icon(
                          Icons.edit_square,
                          size: gap['l']!,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: gap['l']!,
                ),
                Text(
                  userInfoProvider.profile['username']!,
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
                  userInfoProvider.profile['email']!,
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
          ),
        ],
      ),
    );
  }
}
