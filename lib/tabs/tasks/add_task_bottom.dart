import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/app_theme.dart';
import 'package:todo/default_elevated_botton.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/widget/default_text_from_feld.dart';

class AddTaskBottom extends StatefulWidget {
  const AddTaskBottom({super.key});

  @override
  State<AddTaskBottom> createState() => _AddTaskBottomState();
}

class _AddTaskBottomState extends State<AddTaskBottom> {
  TextEditingController textEditingController = TextEditingController();

  TextEditingController descriptionEditingController = TextEditingController();
  DateTime selectDate = DateTime.now();
  DateFormat dateFormat = DateFormat('dd/MM/yyyy');
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.5,
      padding: const EdgeInsets.all(20),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Text(
              'Add new Tasks',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            DefaultTextFromField(
              controller: textEditingController,
              hintext: 'Enter task title',
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please Enter task title';
                }
                return null;
              },
            ),
            SizedBox(
              height: 5,
            ),
            DefaultTextFromField(
              controller: descriptionEditingController,
              hintext: 'Enter description title',
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please Enter description title';
                }
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Select Date',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: AppTheme.black,
                  ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () async {
                DateTime? datetime = await showDatePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(Duration(days: 365)),
                  initialEntryMode: DatePickerEntryMode.calendarOnly,
                  initialDate: selectDate,
                );
                if (datetime != null) {
                  selectDate = datetime;
                  setState(() {});
                }
              },
              child: Text(
                dateFormat.format(selectDate).toString(),
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: AppTheme.black),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            DefaultElevatedBottom(
              label: 'Add',
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  addText();
                }
                ;
              },
            ),
          ],
        ),
      ),
    );
  }

  void addText() {
    TaskModel taskModel = TaskModel(
      title: textEditingController.text,
      description: descriptionEditingController.text,
      date: selectDate,
    );
  }
}
