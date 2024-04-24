import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart'; 
// ignore_for_file: must_be_immutable
class OrderScreen extends StatelessWidget {
  OrderScreen({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController noteOneController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.colorScheme.onPrimary,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        // Handle back button pressed
                      },
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      "Order",
                      style: theme.textTheme.headlineMedium,
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                CustomTextFormField(
                  controller: nameController,
                  hintText: "Event name*",
                ),
                SizedBox(height: 20.0),
                CustomTextFormField(
                  controller: noteOneController,
                  hintText: "Type the note here...",
                  maxLines: 4,
                ),
                SizedBox(height: 20.0),
                InkWell(
                  onTap: () {
                    _selectDate(context);
                  },
                  child: IgnorePointer(
                    child: TextFormField(
                      controller: dateController,
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: 'Date',
                        suffixIcon: Icon(Icons.calendar_today),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                _buildRowSearching(
                  context,
                  timeType: "Start time",
                  controller: startTimeController,
                ),
                SizedBox(height: 20.0),
                _buildRowSearching(
                  context,
                  timeType: "End time",
                  controller: endTimeController,
                ),
                SizedBox(height: 20.0),
                CustomElevatedButton(
                  height: 60.0,
                  text: "Order",
                  onPressed: () {
                    // Handle order button pressed
                  },
                  buttonStyle: CustomButtonStyles.outlineBlueTL30,
                  buttonTextStyle: CustomTextStyles.titleMediumOnPrimary18,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );
    if (picked != null) {
      // Format date without time
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      final String formattedDate = formatter.format(picked);
      dateController.text = formattedDate;
    }
  }


  Widget _buildRowSearching(BuildContext context, {required String timeType, required TextEditingController controller}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 11.0, vertical: 13.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.blueGrey[50],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            timeType,
            style: TextStyle(
              color: Colors.blueGrey[300],
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 8.0),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  _selectTime(context, timeType, controller);
                },
                child: Container(
                  height: 32.0,
                  width: 32.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.blueGrey[300],
                  ),
                  child: Icon(
                    Icons.access_time,
                    size: 18.0,
                  ),
                ),
              ),
              SizedBox(width: 8.0),
              Expanded(
                child: TextFormField(
                  controller: controller,
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: 'Select time',
                  ),
                  onTap: () {
                    _selectTime(context, timeType, controller);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _selectTime(BuildContext context, String timeType, TextEditingController controller) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      // Format time in 24-hour format
      final hour = picked.hour.toString().padLeft(2, '0');
      final minute = picked.minute.toString().padLeft(2, '0');
      controller.text = '$hour:$minute';
    }
  }
}
