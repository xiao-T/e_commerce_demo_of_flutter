// hot words component on home page
import 'package:e_mall_demo/utils.dart';
import 'package:flutter/material.dart';
import 'package:e_mall_demo/styles.dart';

class HotWords extends StatelessWidget {
  HotWords({Key? key}) : super(key: key);

  final List _hotWords = <String>[
    '🧥 全新风衣系列',
    '👕 Polo 衫·T 恤衫',
    '🎩 明星同款',
    '🧥 摩登衬衫',
    '🩳 奢华童装',
    '🧣 配饰精选',
    '👝 换新包款',
    '🎁 彩妆·香氛'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        padding:
            EdgeInsets.symmetric(vertical: gap['l']!, horizontal: gap['m']!),
        color: const Color.fromRGBO(0, 0, 0, 0.1),
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: gap['m']!),
              child: Text(
                '热门搜索',
                style: Styles.title,
                textAlign: TextAlign.center,
              ),
            ),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: gap['m']!,
              runSpacing: gap['m']!,
              children: _hotWords
                  .map(
                    (hotWord) => GestureDetector(
                      onTap: () {
                        // print(hotWord);
                      },
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: gap['m']!, vertical: gap['s']!),
                          child: Text(
                            hotWord,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            )
          ],
        ));
  }
}
