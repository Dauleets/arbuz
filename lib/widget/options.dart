import 'package:flutter/material.dart';
import 'package:flutter_application_2/misc/colors.dart';
import 'package:flutter_application_2/screen/order_page.dart';
import 'package:flutter_switch/flutter_switch.dart';

class ResponsiveButton extends StatelessWidget {
  final double width;
  final double height;
  ResponsiveButton({Key? key, required this.width, required this.height})
      : super(key: key);
  bool isElaveted = false;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: OutlineButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => OrderScreen()));
        },
        borderSide: BorderSide.none,
        child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.redArbuzColor),
            child: Center(
                child: Text(
              "Купить сейчас",
              style: TextStyle(color: AppColors.whiteColor, fontSize: 16.0),
            ))),
      ),
    );
  }
}

class AmountButtuns extends StatefulWidget {
  const AmountButtuns({Key? key}) : super(key: key);

  @override
  _AmountButtunsState createState() => _AmountButtunsState();
}

class _AmountButtunsState extends State<AmountButtuns> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List.generate(3, (index) {
        return InkWell(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Container(
            margin: const EdgeInsets.only(right: 10),
            child: AppButtons(
              size: 60,
              color: selectedIndex == index
                  ? AppColors.whiteColor
                  : AppColors.blackColor,
              backgroundColor: selectedIndex == index
                  ? AppColors.blackColor
                  : AppColors.buttonBackground,
              borderColor: selectedIndex == index
                  ? AppColors.blackColor
                  : AppColors.buttonBackground,
              text: (index + 1).toString(),
            ),
          ),
        );
      }),
    );
  }
}

class AppButtons extends StatelessWidget {
  bool? isIcon;
  final Color color;
  final Color backgroundColor;
  String? text;
  IconData? icon;
  double size;
  final Color borderColor;

  AppButtons(
      {Key? key,
      this.isIcon = false,
      this.text = "HI",
      this.icon,
      required this.size,
      required this.color,
      required this.backgroundColor,
      required this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
            border: Border.all(color: borderColor, width: 1.0),
            borderRadius: BorderRadius.circular(15),
            color: backgroundColor),
        child: isIcon == false
            ? Center(
                child: Text(
                text!,
                style: TextStyle(color: color),
              ))
            : Center(
                child: Icon(
                icon,
                color: color,
              )));
  }
}

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  static const menuItems = <String>[
    'неспелый(-10%)',
    'спелый',
    'уже сорван (-2%)',
  ];
  final List<DropdownMenuItem<String>> _dropDownMenuItems = menuItems
      .map(
        (String value) => DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: TextStyle(fontSize: 15.0),
          ),
        ),
      )
      .toList();
  String? _btn2SelectedVal;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "статус арбуза:",
        textAlign: TextAlign.start,
        style: TextStyle(
            fontSize: 18.0,
            color: AppColors.blackColor,
            fontWeight: FontWeight.bold),
      ),
      trailing: DropdownButton(
        value: _btn2SelectedVal,
        hint: const Text('Выбрать'),
        onChanged: (String? newValue) {
          if (newValue != null) {
            setState(() => _btn2SelectedVal = newValue);
          }
        },
        iconEnabledColor: AppColors.redArbuzColor,
        dropdownColor: AppColors.buttonBackground,
        iconDisabledColor: AppColors.whiteColor,
        focusColor: AppColors.redArbuzColor,
        iconSize: 30.0,
        style: TextStyle(color: AppColors.redArbuzColor),
        underline: Container(
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: AppColors.redArbuzColor))),
        elevation: 10,
        items: _dropDownMenuItems,
      ),
    );
  }
}

class Slider_Status extends StatefulWidget {
  // final Widget child;
  const Slider_Status({
    Key? key,
  }) : super(key: key);

  @override
  _Slider_StatusState createState() => _Slider_StatusState();
}

class _Slider_StatusState extends State<Slider_Status> {
  double _value = 0;
  Color _statusColor = AppColors.redArbuzColor;
  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackHeight: 10.0,
        trackShape: RoundedRectSliderTrackShape(),
        activeTrackColor: AppColors.redArbuzColor,
        inactiveTrackColor: AppColors.subtitleColor,
        thumbShape: RoundSliderThumbShape(
          enabledThumbRadius: 14.0,
          pressedElevation: 8.0,
        ),
        thumbColor: AppColors.redArbuzColor,
        overlayColor: AppColors.redArbuzColor.withOpacity(0.2),
        overlayShape: RoundSliderOverlayShape(overlayRadius: 32.0),
        tickMarkShape: RoundSliderTickMarkShape(),
        activeTickMarkColor: AppColors.redArbuzColor,
        inactiveTickMarkColor: Colors.white,
        valueIndicatorShape: PaddleSliderValueIndicatorShape(),
        valueIndicatorColor: AppColors.redArbuzColor.withOpacity(0.5),
        valueIndicatorTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
        ),
      ),
      child: Slider(
        min: 0.0,
        max: 100.0,
        value: _value,
        divisions: 80,
        label: '${_value.round()}',
        onChanged: (value) {
          setState(() {
            _value = value;
          });
        },
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    void _showSnackBar(String text, String ans) {
      final SnackBar snackBar = SnackBar(
          duration: const Duration(milliseconds: 500),
          backgroundColor:
              ans.compareTo('Yes') == 0 ? Colors.green : Colors.red,
          content: Row(
            children: <Widget>[
              Icon(
                ans.compareTo('Yes') == 0 ? Icons.favorite : Icons.watch_later,
                color: ans.compareTo('Yes') == 0 ? Colors.pink : Colors.yellow,
                size: 24.0,
                semanticLabel: text,
              ),
              Text(text)
            ],
          ));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    // Simple Dialog

    Future<void> _simpleDialog() async {
      switch (await showDialog(
          context: context,
          builder: (BuildContext context) {
            return SimpleDialog(
              title: const Text('Simple Dialog, Is it nice?'),
              children: <Widget>[
                SimpleDialogOption(
                  onPressed: () {
                    Navigator.pop(context, 'Yes');
                  },
                  child: const Text('Yes'),
                ),
                SimpleDialogOption(
                  onPressed: () {
                    Navigator.pop(context, 'No');
                  },
                  child: const Text('No'),
                ),
              ],
            );
          })) {
        case 'Yes':
          _showSnackBar('Thanks!', 'Yes');
          break;
        case 'No':
          _showSnackBar('Oh! No... Try to provide you best', 'No');
          break;
      }
    }

    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Theme(
            data: ThemeData(
              disabledColor: AppColors.redArbuzColor,
              hintColor: AppColors.redArbuzColor,
              primarySwatch: Colors.red,
            ),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Ввидите свое имя",
                  labelStyle: TextStyle(fontSize: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 1),
                  )),
              cursorColor: AppColors.redArbuzColor,
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Theme(
            data: ThemeData(
              disabledColor: AppColors.redArbuzColor,
              hintColor: AppColors.redArbuzColor,
              primarySwatch: Colors.red,
            ),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Напишите адрес доставки ",
                  labelStyle: TextStyle(fontSize: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 1),
                  )),
              cursorColor: AppColors.redArbuzColor,
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            height: 40,
            width: 200,
            child: ElevatedButton(
              style: ButtonStyle(
                shadowColor: MaterialStateProperty.all(
                    Theme.of(context).colorScheme.onSurface),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
                backgroundColor: MaterialStateProperty.all(
                    Color.fromARGB(255, 255, 78, 102)),
              ),
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  _simpleDialog();
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}

class MySwitch extends StatefulWidget {
  const MySwitch({Key? key}) : super(key: key);

  @override
  _MySwitchState createState() => _MySwitchState();
}

class _MySwitchState extends State<MySwitch> {
  bool status = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Порезать дольками:",
          textAlign: TextAlign.start,
          style: TextStyle(
              fontSize: 18.0,
              color: AppColors.blackColor,
              fontWeight: FontWeight.bold),
        ),
        FlutterSwitch(
          width: 50.0,
          height: 25.0,
          valueFontSize: 30.0,
          toggleSize: 20.0,
          value: status,
          borderRadius: 10.0,
          padding: 5.0,
          activeColor: AppColors.redArbuzColor,
          showOnOff: false,
          onToggle: (val) {
            setState(() {
              status = val;
            });
          },
        ),
      ],
    );
  }
}

class DataItem extends StatefulWidget {
  const DataItem({Key? key}) : super(key: key);

  @override
  _DataItemState createState() => _DataItemState();
}

class _DataItemState extends State<DataItem> {
  void _timerDialog() {
    final DateTime now = DateTime.now();
    showTimePicker(
            context: context,
            initialTime: TimeOfDay(hour: now.hour, minute: now.minute))
        .then((TimeOfDay? onValue) {
      _showSnackBar(onValue?.format(context) ?? '', 'ok');
    });
  }

  void _showSnackBar(String text, String ans) {
    final SnackBar snackBar = SnackBar(
        duration: const Duration(milliseconds: 500),
        backgroundColor: ans.compareTo('Yes') == 0 ? Colors.green : Colors.red,
        content: Row(
          children: <Widget>[
            Icon(
              ans.compareTo('Yes') == 0 ? Icons.favorite : Icons.watch_later,
              color: ans.compareTo('Yes') == 0 ? Colors.pink : Colors.yellow,
              size: 24.0,
              semanticLabel: text,
            ),
            Text(text)
          ],
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "Выберите дату",
          textAlign: TextAlign.start,
          style: TextStyle(
              fontSize: 18.0,
              color: AppColors.blackColor,
              fontWeight: FontWeight.bold),
        ),
        ElevatedButton(
          style: ButtonStyle(
            shadowColor: MaterialStateProperty.all(
                Theme.of(context).colorScheme.onSurface),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50))),
            backgroundColor:
                MaterialStateProperty.all(Color.fromARGB(255, 255, 78, 102)),
          ),
          onPressed: () {
            _timerDialog();
          },
          child: Container(
            height: 40,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                "Изминить",
                style: TextStyle(
                    color: AppColors.buttonBackground.withOpacity(0.8),
                    fontSize: 15.0),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class TwoDataItem extends StatefulWidget {
  const TwoDataItem({Key? key}) : super(key: key);

  @override
  _TwoDataItemState createState() => _TwoDataItemState();
}

class _TwoDataItemState extends State<TwoDataItem> {
  void _datePickerDialog() {
      final DateTime now = DateTime.now();
      showDatePicker(
              context: context,
              initialDate: now,
              firstDate: DateTime(2000),
              lastDate: DateTime(2050))
          .then((DateTime? onValue) {
        _showSnackBar('$onValue', 'ok');
      });
    }

  void _showSnackBar(String text, String ans) {
    final SnackBar snackBar = SnackBar(
        duration: const Duration(milliseconds: 500),
        backgroundColor: ans.compareTo('Yes') == 0 ? Colors.green : Colors.red,
        content: Row(
          children: <Widget>[
            Icon(
              ans.compareTo('Yes') == 0 ? Icons.favorite : Icons.watch_later,
              color: ans.compareTo('Yes') == 0 ? Colors.pink : Colors.yellow,
              size: 24.0,
              semanticLabel: text,
            ),
            Text(text)
          ],
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "Выберите время",
          textAlign: TextAlign.start,
          style: TextStyle(
              fontSize: 18.0,
              color: AppColors.blackColor,
              fontWeight: FontWeight.bold),
        ),
        ElevatedButton(
          style: ButtonStyle(
            shadowColor: MaterialStateProperty.all(
                Theme.of(context).colorScheme.onSurface),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50))),
            backgroundColor:
                MaterialStateProperty.all(Color.fromARGB(255, 255, 78, 102)),
          ),
          onPressed: () {
            _datePickerDialog();
          },
          child: Container(
            height: 40,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                "Выбрать",
                style: TextStyle(
                    color: AppColors.buttonBackground.withOpacity(0.8),
                    fontSize: 15.0),
              ),
            ),
          ),
        )
      ],
    );
  }
}

