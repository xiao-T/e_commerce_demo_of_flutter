// skills for profile

import 'package:e_mall_demo/utils.dart';
import 'package:flutter/material.dart';

class Skills extends StatelessWidget {
  const Skills({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: gap['xl']!,
        horizontal: gap['l']!,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Skills',
            style: Theme.of(context).textTheme.bodySmall?.merge(
                  const TextStyle(
                    fontSize: 18.0,
                  ),
                ),
          ),
          SizedBox(
            height: gap['l']!,
          ),
          SkillBar(title: 'React', value: 0.88),
          SkillBar(
            title: 'Vue',
            value: 0.8,
          ),
          SkillBar(
            title: 'Svelte',
            value: 0.75,
          ),
          SkillBar(
            title: 'Flutter',
            value: 0.6,
          ),
          SkillBar(
            title: 'CSS',
            value: 0.95,
          ),
        ],
      ),
    );
  }
}

class SkillBar extends StatefulWidget {
  String title = '';
  double value = 0.0;
  SkillBar({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  State<SkillBar> createState() => _SkillBarState();
}

class _SkillBarState extends State<SkillBar> with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..addListener(() {
        if (_animationController.value >= widget.value) {
          _animationController.stop();
        }
        setState(() {});
      });
    _animationController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: gap['m']!),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title),
          SizedBox(
            height: gap['s']!,
          ),
          LinearProgressIndicator(
            backgroundColor: Colors.black12,
            value: _animationController.value,
            minHeight: gap['l']!,
          )
        ],
      ),
    );
  }
}
