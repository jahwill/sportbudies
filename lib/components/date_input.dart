import 'package:flutter/material.dart';
import 'package:sportbudies/export.dart';

class DateInput extends StatefulWidget {
  const DateInput(
      {this.onChanged, Key? key, this.title, this.initialDateInString})
      : super(key: key);
  final ValueChanged<DateTime?>? onChanged;
  final String? title;
  final String? initialDateInString;

  @override
  State<DateInput> createState() => _DateInputState();
}

class _DateInputState extends State<DateInput> {
  late TextEditingController _ctrl;

  @override
  void initState() {
    super.initState();
    DateTime convertDate = DateTime.now();
    if (widget.initialDateInString != null) {
      convertDate = DateTime.parse(widget.initialDateInString.toString());
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _ctrl = TextEditingController(
            text: StringHelper.dateShortMDD(context).format(convertDate));
      });
    }
    _ctrl = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectDate(context),
      splashColor: Colors.transparent,
      child: CustomFormTextInput(
        hintText: widget.title ?? 'Select Date',
        enabled: false,
        controller: _ctrl,
      ),
    );
  }

  selectDate(BuildContext context) async {
    AppHelper.unFocus();
    DateTime? date = await showDialog(
      context: context,
      builder: (BuildContext context) => DatePickerDialog(
        firstDate: DateTime(1910),
        initialDate: DateTime.now(),
        lastDate: DateTime(2050),
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        confirmText: 'SELECT',
      ),
      useSafeArea: false,
    );
    if (date != null) {
      widget.onChanged!(date);
      _ctrl.text = StringHelper.dateShortMDD(this.context).format(date);
    }
  }
}
