// shopping cart item
import 'package:e_mall_demo/utils.dart';
import 'package:flutter/material.dart';

class ShoppingCartItem extends StatefulWidget {
  const ShoppingCartItem({Key? key}) : super(key: key);

  @override
  State<ShoppingCartItem> createState() => _ShoppingCartItemState();
}

class _ShoppingCartItemState extends State<ShoppingCartItem> {
  bool _checked = true;
  final _imageUrl = getRandomImageUrl();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final smallStyle =
        textTheme.displaySmall?.merge(const TextStyle(color: Colors.black38));
    return Container(
      padding: EdgeInsets.symmetric(horizontal: gap['l']!, vertical: gap['l']!),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            width: 2.0,
            color: Theme.of(context).scaffoldBackgroundColor,
            style: BorderStyle.solid,
          ),
        ),
      ),
      child: SizedBox(
        height: 80.0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Transform.scale(
              scale: 0.8,
              child: Checkbox(
                value: _checked,
                onChanged: (value) {
                  print(value);
                  setState(() {
                    _checked = value!;
                  });
                  print('select product in shopping cart');
                },
              ),
            ),
            Image(
              width: 80.0,
              height: 80.0,
              fit: BoxFit.cover,
              image: NetworkImage(
                _imageUrl,
              ),
            ),
            SizedBox(
              width: gap['m']!,
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Size: l',
                            style: smallStyle,
                          ),
                          Text(
                            'Qty: 1',
                            style: smallStyle,
                          ),
                        ],
                      ),
                      Text(
                        '¥24343.43',
                        style: textTheme.labelMedium,
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
