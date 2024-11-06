import 'package:flutter/material.dart';
import 'package:todo/app_theme.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            height: 62,
            width: 4,
            margin: const EdgeInsets.all(12),
            color: AppTheme.primary,
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Play Basketball',
              style: textTheme.bodySmall?.copyWith(color: AppTheme.primary),
            ),
            Text(
              'Text Descriptions ',
              style: textTheme.bodySmall?.copyWith(fontSize: 14),
            ),
          ]),
          const SizedBox(
            width: 10,
          ),
          Container(
            height: 34,
            width: 69,
            decoration: BoxDecoration(
              color: AppTheme.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.check_sharp,
              color: AppTheme.white,
              size: 32,
            ),
          ),
        ],
      ),
    );
  }
}
