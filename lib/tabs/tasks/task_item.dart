import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:todo/app_theme.dart';
import 'package:todo/firebase_functions.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/tabs/setting/setting_provider.dart';
import 'package:todo/tabs/tasks/task_provider.dart';

class TaskItem extends StatefulWidget {
  TaskItem(this.task);
  TaskModel task;

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Slidable(
        startActionPane: ActionPane(
          motion: ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (_) {
                FirebaseFunctions.deleteTaskFromFirebase(widget.task.id)
                    .timeout(
                  Duration(microseconds: 100),
                  onTimeout: () {
                    Provider.of<TaskProvider>(context, listen: false).gitTask();
                  },
                ).catchError(
                  (_) {
                    Fluttertoast.showToast(
                        msg: "Add Task is wrong",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 5,
                        backgroundColor: AppTheme.rad);
                  },
                );
              },
              backgroundColor: const Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
            SlidableAction(
              onPressed: (_) {
                FirebaseFunctions.editTaskFromFirebase(
                        widget.task.id, widget.task.title)
                    .timeout(
                  Duration(microseconds: 100),
                  onTimeout: () {
                    Provider.of<TaskProvider>(context, listen: false).gitTask();
                  },
                ).catchError(
                  (_) {
                    Fluttertoast.showToast(
                        msg: "Add Task is wrong",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 5,
                        backgroundColor: AppTheme.rad);
                  },
                );
              },
              backgroundColor: Color(0xFF21B7CA),
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: 'Edit',
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 62,
                width: 4,
                margin: EdgeInsetsDirectional.only(end: 12),
                decoration: BoxDecoration(
                  color: AppTheme.primary,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                widget.task.isDone!
                    ? Text(
                        widget.task.title,
                        style: textTheme.titleMedium
                            ?.copyWith(color: AppTheme.green),
                      )
                    : Text(
                        widget.task.title,
                        style: textTheme.titleMedium
                            ?.copyWith(color: AppTheme.primary),
                      ),
                Text(
                  widget.task.description,
                  style: textTheme.titleSmall?.copyWith(fontSize: 14),
                ),
              ]),
              Spacer(),
              widget.task.isDone!
                  ? Text(
                      'Doen ! ',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: AppTheme.green),
                    )
                  : ElevatedButton(
                      onPressed: () {
                        widget.task.isDone = !widget.task.isDone!;
                        setState(() {});
                      },
                      child: Icon(
                        Icons.check_sharp,
                        color: AppTheme.white,
                        size: 32,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
