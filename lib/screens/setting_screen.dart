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
    double heightSize = MediaQuery.of(context).copyWith().size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Notification Settings"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.black,
      body: Container(
        height: heightSize,
        decoration: const BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topRight, end: Alignment.bottomLeft, colors: [
          Color.fromARGB(255, 10, 87, 151),
          Color.fromARGB(255, 47, 125, 50),
        ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Theme(
                data: ThemeData(brightness: Brightness.dark),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(32.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 33),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 50,
                        ),
                        SwitchListTile(
                            title: const Text(
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
                                const SizedBox(
                                  height: 35,
                                ),
                                const Text(
                                  "Language",
                                  style: TextStyle(fontSize: 24, color: Colors.white),
                                ),
                                LanguageChooseWidget(),
                              ],
                            ),
                            Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
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
          ],
        ),
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
          title: const Text("1/Day"),
        ),
        RadioListTile<int>(
          value: 2,
          groupValue: radioButtonAralik,
          onChanged: (value) {
            setState(() {
              radioButtonAralik = value!;
            });
          },
          title: const Text("2/Day"),
        ),
        RadioListTile<int>(
          value: 3,
          groupValue: radioButtonAralik,
          onChanged: (value) {
            setState(() {
              radioButtonAralik = value!;
            });
          },
          title: const Text("3/Day"),
        ),
        RadioListTile<int>(
          value: 4,
          groupValue: radioButtonAralik,
          onChanged: (value) {
            setState(() {
              radioButtonAralik = value!;
            });
          },
          title: const Text("4/Day"),
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
        title: const Text(
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
          title: const Text("English"),
        ),
        RadioListTile<int>(
          value: 2,
          groupValue: radioButtonDil,
          onChanged: (value) {
            setState(() {
              radioButtonDil = value!;
            });
          },
          title: const Text("Turkish"),
        )
      ],
    );
  }
}
