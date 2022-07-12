import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

int? radioButtonDil; //dil seçimi
int? radioButtonAralik; //aralık seçimi
bool? valueNotification;

class _SettingsPageState extends State<SettingsPage> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();

    setState(() {
      if (valueNotification == null) {
        valueNotification = true;
      }

      if (radioButtonDil == null) {
        radioButtonDil = 2;
      }

      if (radioButtonAralik == null) {
        radioButtonAralik = 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          setState(() {
            Navigator.pop(context);
          });
        },
        child: Icon(
          Icons.sunny,
          color: Colors.white,
          size: 40,
        ),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topRight, end: Alignment.bottomLeft, colors: [
          Color.fromARGB(255, 10, 87, 151),
          Color.fromARGB(255, 47, 125, 50),
        ])),
        child: Theme(
            data: ThemeData(brightness: Brightness.dark),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(32.0),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 33),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 50,
                    ),
                    SwitchListTile(
                        title: Text(
                          "Notifications",
                        ),
                        value: valueNotification!,
                        onChanged: (val) {
                          setState(() {
                            if (valueNotification == false) {
                              valueNotification = true;
                            } else {
                              valueNotification = false;
                            }
                          });
                        }),
                    Column(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 35,
                            ),
                            Text(
                              "Language",
                              style: TextStyle(fontSize: 24, color: Colors.white),
                            ),
                            LanguageChooseWidget(),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Notification Frequency",
                              style: TextStyle(fontSize: 24, color: Colors.white),
                            ),
                            AralikSecimiWidget(),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}

class AralikSecimiWidget extends StatefulWidget {
  AralikSecimiWidget({Key? key}) : super(key: key);

  @override
  State<AralikSecimiWidget> createState() => _AralikSecimiWidgetState();
}

class _AralikSecimiWidgetState extends State<AralikSecimiWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile<int>(
          value: 1,
          groupValue: radioButtonAralik,
          onChanged: (value) {
            setState(() {
              radioButtonAralik = value!;
            });
          },
          title: Text("1/Day"),
        ),
        RadioListTile<int>(
          value: 2,
          groupValue: radioButtonAralik,
          onChanged: (value) {
            setState(() {
              radioButtonAralik = value!;
            });
          },
          title: Text("2/Day"),
        ),
        RadioListTile<int>(
          value: 3,
          groupValue: radioButtonAralik,
          onChanged: (value) {
            setState(() {
              radioButtonAralik = value!;
            });
          },
          title: Text("3/Day"),
        ),
        RadioListTile<int>(
          value: 4,
          groupValue: radioButtonAralik,
          onChanged: (value) {
            setState(() {
              radioButtonAralik = value!;
            });
          },
          title: Text("4/Day"),
        ),
      ],
    );
  }
}

class BildirimSwitchWidget extends StatefulWidget {
  BildirimSwitchWidget({Key? key}) : super(key: key);

  @override
  State<BildirimSwitchWidget> createState() => _BildirimSwitchWidgetState();
}

class _BildirimSwitchWidgetState extends State<BildirimSwitchWidget> {
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
        title: Text(
          "Bildirimler",
        ),
        value: valueNotification!,
        onChanged: (val) {
          setState(() {
            if (valueNotification == false) {
              valueNotification = true;
            } else {
              valueNotification = false;
            }
          });
        });
  }
}

class LanguageChooseWidget extends StatefulWidget {
  LanguageChooseWidget({Key? key}) : super(key: key);

  @override
  State<LanguageChooseWidget> createState() => _LanguageChooseWidgetState();
}

class _LanguageChooseWidgetState extends State<LanguageChooseWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile<int>(
          value: 1,
          groupValue: radioButtonDil,
          onChanged: (value) {
            setState(() {
              radioButtonDil = value!;
            });
          },
          title: Text("English"),
        ),
        RadioListTile<int>(
          value: 2,
          groupValue: radioButtonDil,
          onChanged: (value) {
            setState(() {
              radioButtonDil = value!;
            });
          },
          title: Text("Turkish"),
        )
      ],
    );
  }
}
