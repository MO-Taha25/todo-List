import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo/app_theme.dart';
import 'package:todo/tabs/tasks/task_item.dart';

class TasksTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double Sizhight = MediaQuery.sizeOf(context).height;
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: Sizhight * 0.20,
              color: AppTheme.primary,
            ),
            PositionedDirectional(
              start: 20,
              child: SafeArea(
                child: Text(
                  'ToDo List',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppTheme.white,
                      ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: Sizhight * .15),
              child: EasyInfiniteDateTimeLine(
                firstDate: DateTime.now().subtract(Duration(days: 365)),
                focusDate: DateTime.now(),
                lastDate: DateTime.now().add(Duration(days: 365)),
                showTimelineHeader: false,
                dayProps: EasyDayProps(
                  height: 100,
                  width: 60,
                  dayStructure: DayStructure.dayStrDayNum,
                  activeDayStyle: DayStyle(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      color: AppTheme.white,
                    ),
                    dayNumStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primary,
                    ),
                    dayStrStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primary,
                    ),
                  ),
                  inactiveDayStyle: DayStyle(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      color: AppTheme.white,
                    ),
                    dayNumStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.black,
                    ),
                    dayStrStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (_, index) => TaskItem(),
            itemCount: 10,
          ),
        )
      ],
    );
  }
}
