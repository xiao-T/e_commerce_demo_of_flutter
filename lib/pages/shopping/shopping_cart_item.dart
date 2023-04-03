// shopping cart item
import 'package:e_mall_demo/models/shopping_cart.dart';
import 'package:e_mall_demo/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShoppingCartItem extends StatefulWidget {
  ShoppingCartItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  var item;
  @override
  State<ShoppingCartItem> createState() => _ShoppingCartItemState();
}

class _ShoppingCartItemState extends State<ShoppingCartItem> {
  bool _checked = true;
  String _imageUrl = '';
  final double _translateX = 0.0;

  @override
  void initState() {
    setState(() {
      _checked = widget.item['selected'];
      _imageUrl = widget.item['url'];
    });
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ShoppingCartItem oldWidget) {
    setState(() {
      _checked = widget.item['selected'];
      _imageUrl = widget.item['url'];
    });
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final shoppingCartProvider = context.watch<ShoppingCartModel>();
    final textTheme = Theme.of(context).textTheme;
    final smallStyle =
        textTheme.displaySmall?.merge(const TextStyle(color: Colors.black38));

    final product = widget.item;
    return Dismissible(
      key: Key(product['id']),
      background: Container(
        padding: EdgeInsets.only(right: gap['l']!),
        alignment: Alignment.centerRight,
        child: const Icon(
          Icons.delete,
          color: Colors.red,
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (DismissDirection direction) {
        shoppingCartProvider.delete(product);
      },
      child: Transform.translate(
        offset: Offset(0 - _translateX, 0),
        child: Container(
          padding:
              EdgeInsets.symmetric(horizontal: gap['l']!, vertical: gap['l']!),
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
                      shoppingCartProvider.updateSingleProduct(
                        value,
                        product,
                      );
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
                                'Size: ${product["size"]}',
                                style: smallStyle,
                              ),
                              Text(
                                'Qty: ${product["qty"]}',
                                style: smallStyle,
                              ),
                            ],
                          ),
                          Text(
                            '¥${product["price"]}',
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
        ),
      ),
    );
  }
}
