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
      height: setResponseSize(320.0),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: setResponseSize(230.0),
            clipBehavior: Clip.hardEdge,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(userInfoProvider.profile['avatar']!),
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
            child: SizedBox(
              height: setResponseSize(230.0),
            ),
          ),
          Positioned(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.bottomRight,
                  width: setResponseSize(70.0),
                  height: setResponseSize(70.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(setResponseSize(70.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black38,
                        blurRadius: gap['m']!,
                        offset: const Offset(0, 0),
                      ),
                    ],
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(userInfoProvider.profile['avatar']!),
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
