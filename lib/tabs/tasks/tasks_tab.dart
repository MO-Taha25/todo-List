import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/app_theme.dart';
import 'package:todo/tabs/tasks/task_item.dart';
import 'package:todo/tabs/tasks/task_provider.dart';

class TasksTab extends StatefulWidget {
  const TasksTab({super.key});

  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
  bool shouldGotTask = true;
  @override
  Widget build(BuildContext context) {
    double Sizhight = MediaQuery.sizeOf(context).height;
    TaskProvider taskProvider = Provider.of<TaskProvider>(context);

    if (shouldGotTask) {
      taskProvider.gitTask();
      shouldGotTask = false;
    }

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
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppTheme.white,
                      ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: Sizhight * .15),
              child: EasyInfiniteDateTimeLine(
                firstDate: DateTime.now().subtract(const Duration(days: 365)),
                focusDate: taskProvider.selectedDate,
                lastDate: DateTime.now().add(const Duration(days: 365)),
                onDateChange: (selectedDate) {
                  taskProvider.changeSelectedDate(selectedDate);
                },
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
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    dayNumStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    dayStrStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                  todayStyle: DayStyle(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      color: Theme.of(context).colorScheme.onPrimary,
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
            itemBuilder: (_, index) => TaskItem(taskProvider.taskList[index]),
            itemCount: taskProvider.taskList.length,
          ),
        )
      ],
    );
  }
}
