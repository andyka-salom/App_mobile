import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';

class OrderScreen extends StatelessWidget {
  OrderScreen({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController noteOneController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: theme.colorScheme.onBackground),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "Order",
          style: theme.textTheme.headlineMedium?.copyWith(color: theme.colorScheme.onBackground),
        ),
        backgroundColor: theme.colorScheme.background,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCard(
                children: [
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
                ],
              ),
              SizedBox(height: 20.0),
              _buildCard(
                children: [
                  _buildDatePicker(context),
                ],
              ),
              SizedBox(height: 20.0),
              _buildCard(
                children: [
                  _buildTimePicker(context, "Start time", startTimeController),
                  SizedBox(height: 20.0),
                  _buildTimePicker(context, "End time", endTimeController),
                ],
              ),
              SizedBox(height: 30.0),
              CustomElevatedButton(
                height: 60.0,
                text: "Order",
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Handle order button pressed
                  }
                },
                buttonStyle: CustomButtonStyles.outlineBlueTL30,
                buttonTextStyle: CustomTextStyles.titleMediumOnPrimary18,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard({required List<Widget> children}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 3,
      shadowColor: Colors.grey.withOpacity(0.2),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }

  Widget _buildDatePicker(BuildContext context) {
    return InkWell(
      onTap: () {
        _selectDate(context);
      },
      child: IgnorePointer(
        child: TextFormField(
          controller: dateController,
          readOnly: true,
          decoration: InputDecoration(
            hintText: 'Date',
            suffixIcon: Icon(Icons.calendar_today, color: theme.colorScheme.primary),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTimePicker(BuildContext context, String timeType, TextEditingController controller) {
    return InkWell(
      onTap: () {
        _selectTime(context, timeType, controller);
      },
      child: IgnorePointer(
        child: TextFormField(
          controller: controller,
          readOnly: true,
          decoration: InputDecoration(
            hintText: timeType,
            suffixIcon: Icon(Icons.access_time, color: theme.colorScheme.primary),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
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
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      final String formattedDate = formatter.format(picked);
      dateController.text = formattedDate;
    }
  }

  Future<void> _selectTime(BuildContext context, String timeType, TextEditingController controller) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      final hour = picked.hour.toString().padLeft(2, '0');
      final minute = picked.minute.toString().padLeft(2, '0');
      controller.text = '$hour:$minute';
    }
  }
}
