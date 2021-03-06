import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class YellowDatePicker extends StatefulWidget {
  final String labelText;
  final TextEditingController textEditingController;

  const YellowDatePicker({
    Key? key,
    required this.labelText,
    required this.textEditingController,
  }) : super(key: key);

  @override
  _YellowDatePickerState createState() => _YellowDatePickerState();
}

class _YellowDatePickerState extends State<YellowDatePicker> {
  DateTime _birthDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      width: 300,
      child: TextFormField(
        readOnly: true,
        onTap: () {
          setState(() {
            _selectDate(context);
          });
        },
        textAlignVertical: TextAlignVertical.center,
        controller: widget.textEditingController,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onFieldSubmitted: (_) {},
        validator: (value) {},
        cursorColor: const Color(0xFF1A4859),
        decoration: InputDecoration(
          hintText: DateFormat('dd/MM/yyyy').format(_birthDate),
          hintStyle: const TextStyle(
            color: Color(0xFF1A4859),
          ),
          labelText: '${widget.labelText}*',
          floatingLabelStyle: const TextStyle(
            color: Color(0xFF1A4859),
            fontSize: 21,
            fontWeight: FontWeight.w600,
          ),
          isDense: true,
          errorMaxLines: 1,
          errorText: null,
          errorStyle: const TextStyle(
            color: Colors.transparent,
            fontSize: 0,
          ),
          alignLabelWithHint: true,
          focusColor: const Color(0xFFA9915D),
          labelStyle: const TextStyle(
            color: Color(0xFF1A4859),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFA9915D),
              width: 3.0,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.all(Radius.circular(21)),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFA9915D),
              width: 3.0,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.all(Radius.circular(21)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFA9915D),
              width: 3.0,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.all(Radius.circular(21)),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red.shade700,
              width: 3.0,
              style: BorderStyle.solid,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(21)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red.shade700,
              width: 3.0,
              style: BorderStyle.solid,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(21)),
          ),
        ),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final datePick = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
    if (datePick != null && datePick != _birthDate) {
      setState(() {
        _birthDate = datePick;
      });
    }
  }
}
