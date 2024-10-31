import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'mainpage.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => SettingsPage2();
}

class SettingsPage2 extends State<SettingsPage> {
  int _selectedOption = 1;
   String? _selectedTimezone;
  final List<String> _timezoneOptions = [
    "UTC-12:00",
    "UTC-11:00",
    "UTC-10:00",
    "UTC-09:00",
    "UTC-08:00",
    "UTC-07:00",
    "UTC-06:00",
    "UTC-05:00",
    "UTC-04:00",
    "UTC-03:00",
    "UTC-02:00",
    "UTC-01:00",
    "UTC±00:00",
    "UTC+01:00",
    "UTC+02:00",
    "UTC+03:00",
    "UTC+04:00",
    "UTC+05:00",
    "UTC+06:00",
    "UTC+07:00",
    "UTC+08:00",
    "UTC+09:00",
    "UTC+10:00",
    "UTC+11:00",
    "UTC+12:00",
    "UTC+13:00",
    "UTC+14:00",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: "Menu",
          onPressed: () {
            Navigator.pop(context);
          },
        ),
          title: const Text("Settings"),
        ),
        body: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            child: ListView(
              children: [
                Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Display currency",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            RadioListTile(
              title: Text("Ringgit Malaysia (RM)"),
              value: 1,
              groupValue: _selectedOption,
              onChanged: (int? value) {
                setState(() {
                  _selectedOption = value!;
                });
              },
            ),
            RadioListTile(
              title: Text("US Dollar (\$)"),
              value: 2,
              groupValue: _selectedOption,
              onChanged: (int? value) {
                setState(() {
                  _selectedOption = value!;
                });
              },
            ),
            RadioListTile(
              title: Text("Euro (€)"),
              value: 3,
              groupValue: _selectedOption,
              onChanged: (int? value) {
                setState(() {
                  _selectedOption = value!;
                });
              },
            ),
          ],
        ),
                const Divider(),
                Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Date and Time",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            DropdownButton<String>(
              isExpanded: true,
              value: _selectedTimezone,
              hint: Text("Select a timezone"),
              items: _timezoneOptions.map((String timezone) {
                return DropdownMenuItem<String>(
                  value: timezone,
                  child: Text(timezone),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedTimezone = newValue;
                });
              },
            ),
            SizedBox(height: 20),
            if (_selectedTimezone != null)
              Text(
                "Selected Timezone: $_selectedTimezone",
                style: TextStyle(fontSize: 16),
              ),
            ],
         ),
                const Divider(),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [ 
                    Text(
                      "Miscellaneous",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),
                      ),
                    _SingleSection(
                      children: [
                        _CustomListTile(
                            title: "Help & Feedback",
                            icon: Icons.help_outline_rounded),
                        _CustomListTile(
                            title: "About", icon: Icons.info_outline_rounded),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
  }
}

class _CustomListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget? trailing;
  const _CustomListTile(
      {Key? key, required this.title, required this.icon, this.trailing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: Icon(icon),
      trailing: trailing,
      onTap: () {},
    );
  }
}

class _SingleSection extends StatelessWidget {
  final String? title;
  final List<Widget> children;
  const _SingleSection({
    Key? key,
    this.title,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title!,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        Column(
          children: children,
        ),
      ],
    );
  }
}
