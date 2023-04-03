// product base info for PDP
import 'package:e_mall_demo/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final Map<String, String> fakeProduct = {
  'price': '¥143.43',
  'desc':
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
  'title':
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s'
};

class ProductBaseInfo extends StatelessWidget {
  ProductBaseInfo({
    Key? key,
    required this.id,
    required this.updateSize,
  }) : super(key: key);

  String? id = '';
  Function updateSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(left: gap['l']!, right: gap['l']!),
      child: Column(
        children: [
          BasePanel(id: id),
          SizePanel(callback: updateSize),
          const DescPanel(),
        ],
      ),
    );
  }
}

// base infor panel.
// include: title, price, id etc.
class BasePanel extends StatelessWidget {
  BasePanel({
    Key? key,
    required this.id,
  }) : super(key: key);

  String? id;
  @override
  Widget build(BuildContext context) {
    return InfoPanel(
      title: fakeProduct['title']!,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () async {
              await Clipboard.setData(
                ClipboardData(text: id),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Copy successfully'),
                ),
              );
            },
            child: Row(
              children: [
                Text(
                  'ID: $id',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(
                  width: gap['s']!,
                ),
                const Icon(
                  Icons.copy,
                  size: 12.0,
                  color: Colors.black38,
                ),
              ],
            ),
          ),
          Text(
            fakeProduct['price']!,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}

// colors panel
class SizePanel extends StatefulWidget {
  SizePanel({
    Key? key,
    required this.callback,
  }) : super(key: key);

  Function callback;
  @override
  State<SizePanel> createState() => _SizePanelState();
}

class _SizePanelState extends State<SizePanel> {
  final _sizes = [
    'x',
    'm',
    'l',
    'xl',
    'xxl',
  ];

  final double _itemHeight = 35.0;

  String _defaultSize = '';

  List<Widget> _createSizeItem() {
    List<Widget> items = [];
    Color defaultColor;
    items = _sizes.map((size) {
      if (size == _defaultSize) {
        defaultColor = Colors.deepOrange;
      } else {
        defaultColor = Colors.black26;
      }
      return GestureDetector(
        onTap: () {
          setState(() {
            _defaultSize = size;
          });
          widget.callback(size);
        },
        child: Container(
          margin: EdgeInsets.only(right: gap['m']!),
          alignment: Alignment.center,
          height: _itemHeight,
          width: _itemHeight,
          padding: EdgeInsets.all(gap['s']!),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(gap['m']!),
            border: Border.all(
              color: defaultColor,
            ),
          ),
          child: Text(
            size.toUpperCase(),
            softWrap: false,
            style: TextStyle(
              fontSize: 14.0,
              color: defaultColor,
              overflow: TextOverflow.visible,
            ),
          ),
        ),
      );
    }).toList();
    return items;
  }

  @override
  void initState() {
    setState(() {
      _defaultSize = _sizes.elementAt(0);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InfoPanel(
      title: 'Size',
      child: SizedBox(
        width: double.infinity,
        height: _itemHeight,
        child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: _createSizeItem()),
      ),
    );
  }
}

// desc panel
class DescPanel extends StatelessWidget {
  const DescPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InfoPanel(
      title: 'Description',
      child: Text(
        fakeProduct['desc']!,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}

class InfoPanel extends StatelessWidget {
  InfoPanel({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  String title = '';
  Widget child;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: gap['m']!,
        bottom: gap['m']!,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleMedium?.merge(
                  const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
          ),
          SizedBox(
            height: gap['m']!,
          ),
          child,
        ],
      ),
    );
  }
}
