// base info for profile
import 'package:e_mall_demo/utils.dart';
import 'package:flutter/material.dart';

class BaseInfo extends StatelessWidget {
  const BaseInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        BaseInfoCard(title: 'Location', value: '🇨🇳 Guangzhou'),
        BaseInfoCard(title: 'Profession', value: '👨🏻‍💻 Front-End'),
        BaseInfoCard(title: 'Status', value: '🏡 WFH'),
      ],
    );
  }
}

class BaseInfoCard extends StatelessWidget {
  String title = '';
  String value = '';
  BaseInfoCard({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        SizedBox(
          height: gap['m']!,
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
