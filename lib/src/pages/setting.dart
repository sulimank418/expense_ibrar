// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:expense/src/resources/allData.dart';
import 'package:expense/src/resources/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  var enableorDisable = "Disable";
  // currency sybmbols
  var pound = "";
  var dollar = "";
  var euro = "";
  var india = "";
  var jpy = "";
  var sek = "";
  var pak = "";
  var nigeria = "";
  void currency() {
    Locale locale = Localizations.localeOf(context);
    var gbp =
        NumberFormat.simpleCurrency(locale: locale.toString(), name: "GBP");
    var eur =
        NumberFormat.simpleCurrency(locale: locale.toString(), name: "EUR");
    var dlr = NumberFormat.simpleCurrency(locale: locale.toString());
    var ind =
        NumberFormat.simpleCurrency(locale: locale.toString(), name: "IND");
    var japan =
        NumberFormat.simpleCurrency(locale: locale.toString(), name: "JPY");
    var swedish =
        NumberFormat.simpleCurrency(locale: locale.toString(), name: "SEK");
    var pkr =
        NumberFormat.simpleCurrency(locale: locale.toString(), name: "PKR");
    var ngn =
        NumberFormat.simpleCurrency(locale: locale.toString(), name: "NGN");
    pound = gbp.currencySymbol;
    euro = eur.currencySymbol;
    dollar = dlr.currencySymbol;
    india = ind.currencySymbol;
    jpy = japan.currencySymbol;
    sek = swedish.currencySymbol;
    pak = pkr.currencySymbol;
    nigeria = ngn.currencySymbol;
  }

  @override
  void didChangeDependencies() {
    // ignore: todo
    super.didChangeDependencies();
    currency();
    CurrencyChanger.testercurrency
        .add(CurrencyPicker(countrySymbol: dollar, selectedCurrency: false));
    CurrencyChanger.testercurrency
        .add(CurrencyPicker(countrySymbol: euro, selectedCurrency: false));
    CurrencyChanger.testercurrency
        .add(CurrencyPicker(countrySymbol: india, selectedCurrency: false));
    CurrencyChanger.testercurrency
        .add(CurrencyPicker(countrySymbol: jpy, selectedCurrency: false));
    CurrencyChanger.testercurrency
        .add(CurrencyPicker(countrySymbol: sek, selectedCurrency: false));
    CurrencyChanger.testercurrency
        .add(CurrencyPicker(countrySymbol: pound, selectedCurrency: false));
    CurrencyChanger.testercurrency
        .add(CurrencyPicker(countrySymbol: pak, selectedCurrency: false));
    CurrencyChanger.testercurrency
        .add(CurrencyPicker(countrySymbol: nigeria, selectedCurrency: false));
  }

// forradiobutton
  int? selectRadio;

  // for General:
  @override
  void initState() {
    super.initState();

    CurrencyChanger.isCurrencySelect
        ? _controller.text = CurrencyChanger.textfieldData
        : _controller.text = "";
    selectRadio = 0;
  }

  Widget forGeneral() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "General",
            style: TextStyle(color: Colors.green),
          ),
          ListTile(
            onTap: () {
              showThemeDialog(context);
            },
            contentPadding: EdgeInsets.only(left: 10.0, right: 0.0),
            title: Text(
              "Theme",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: Text("light"),
          ),
          ListTile(
            onTap: () async {
              await showInformationDialog(context);
            },
            contentPadding: EdgeInsets.only(left: 10.0, right: 0.0),
            title: Text(
              "Currency",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          const ListTile(
            contentPadding: EdgeInsets.only(left: 10.0, right: 0.0),
            title:
                Text("Grouping", style: TextStyle(fontWeight: FontWeight.w500)),
            subtitle: Text("Month"),
          )
        ],
      ),
    );
  }

  // for Manage
  Widget forManage() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Manage",
            style: TextStyle(color: Colors.green),
          ),
          ListTile(
            onTap: () {},
            contentPadding: EdgeInsets.only(left: 10.0, right: 0.0),
            title: Text(
              "Categories",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          ListTile(
            onTap: () {},
            contentPadding: EdgeInsets.only(left: 10.0, right: 0.0),
            title: Text(
              "Regular Expenses and Income",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          ListTile(
            onTap: () {},
            contentPadding: EdgeInsets.only(left: 10.0, right: 0.0),
            title: Text(
              "Backup/Restore your data",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          ListTile(
            onTap: () {},
            contentPadding: EdgeInsets.only(left: 10.0, right: 0.0),
            title: Text("Spreadsheet export",
                style: TextStyle(fontWeight: FontWeight.w500)),
            subtitle: Text("Export your record to a spreadsheet."),
          )
        ],
      ),
    );
  }

  // for Income Management
  Widget forIncomeManagement() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const Text(
            "Income Management",
            style: TextStyle(color: Colors.green),
          ),
          ListTile(
            onTap: () {
              setState(() {
                CurrencyChanger.isCheckedManagement =
                    !CurrencyChanger.isCheckedManagement;
                if (CurrencyChanger.isCheckedManagement == true) {
                  enableorDisable = "Enable";
                } else {
                  enableorDisable = "Disable";
                }
              });
            },
            contentPadding: EdgeInsets.only(left: 10.0, right: 0.0),
            title: const Text("Income Management",
                style: TextStyle(fontWeight: FontWeight.w500)),
            subtitle: Text("Income management is $enableorDisable"),
            trailing: Checkbox(
                value: CurrencyChanger.isCheckedManagement,
                onChanged: (value) {
                  setState(() {
                    CurrencyChanger.isCheckedManagement = value!;
                    if (CurrencyChanger.isCheckedManagement == true) {
                      enableorDisable = "Enable";
                    } else {
                      enableorDisable = "Disable";
                    }
                  });
                }),
          ),
          ListTile(
            onTap: () {
              setState(() {
                CurrencyChanger.isCheckedExpenses =
                    !CurrencyChanger.isCheckedExpenses;
              });
            },
            contentPadding: EdgeInsets.only(left: 10.0, right: 0.0),
            enabled: CurrencyChanger.isCheckedManagement,
            title: const Text("Carry over expenses",
                style: TextStyle(fontWeight: FontWeight.w500)),
            trailing: Checkbox(
                value: CurrencyChanger.isCheckedExpenses,
                onChanged: (value) {
                  if (CurrencyChanger.isCheckedManagement) {
                    setState(() {
                      CurrencyChanger.isCheckedExpenses = value!;
                    });
                  }
                }),
          )
        ],
      ),
    );
  }

  // for Daily Reminder

  Widget forDailyReminder() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const Text(
            "Daily Reminder",
            style: TextStyle(color: Colors.green),
          ),
          ListTile(
            onTap: () {
              setState(() {
                CurrencyChanger.isDailyReminderOn =
                    !CurrencyChanger.isDailyReminderOn;
              });
            },
            contentPadding: EdgeInsets.only(left: 10.0, right: 0.0),
            title: const Text("Daily Reminder",
                style: TextStyle(fontWeight: FontWeight.w500)),
            trailing: Checkbox(
                value: CurrencyChanger.isDailyReminderOn,
                onChanged: (value) {
                  setState(() {
                    CurrencyChanger.isDailyReminderOn = value!;
                  });
                }),
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 10.0, right: 0.0),
            enabled: CurrencyChanger.isDailyReminderOn,
            title: const Text("Time of day"),
            subtitle: const Text("18:00"),
          ),
          ListTile(
            onTap: () {
              setState(() {
                CurrencyChanger.isSmartReminderOn =
                    !CurrencyChanger.isSmartReminderOn;
              });
            },
            contentPadding: EdgeInsets.only(left: 10.0, right: 0.0),
            enabled: CurrencyChanger.isDailyReminderOn,
            title: const Text("Smart reminder",
                style: TextStyle(fontWeight: FontWeight.w500)),
            subtitle: const Text(
                "Remind me only when I did not record an expense for the current day."),
            trailing: Checkbox(
                value: CurrencyChanger.isSmartReminderOn,
                onChanged: (value) {
                  if (CurrencyChanger.isDailyReminderOn) {
                    setState(() {
                      CurrencyChanger.isSmartReminderOn = value!;
                    });
                  }
                }),
          )
        ],
      ),
    );
  }

  // for About
  Widget forAbout() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const Text(
            "About",
            style: TextStyle(color: Colors.green),
          ),
          ListTile(
            onTap: () {},
            contentPadding: EdgeInsets.only(left: 10.0, right: 0.0),
            title: Text(
              "Rate App",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          ListTile(
            onTap: () {},
            contentPadding: EdgeInsets.only(left: 10.0, right: 0.0),
            title: Text(
              "Quick Start",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          ListTile(
            onTap: () {},
            contentPadding: EdgeInsets.only(left: 10.0, right: 0.0),
            title: Text(
              "About Us",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          ListTile(
            onTap: () {},
            contentPadding: EdgeInsets.only(left: 10.0, right: 0.0),
            title: Text(
              "Promotion Code",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          ListTile(
            onTap: () {},
            contentPadding: EdgeInsets.only(left: 10.0, right: 0.0),
            title: Text(
              "Open Source License",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  // ftn for radiobuttons
  setSelectedRadio(int val) {
    setState(() {
      selectRadio = val;
    });
  }
  

  @override
  Widget build(BuildContext context) => Scaffold(
          body: SafeArea(
              child: ListView(
        children: [
          // for general
          forGeneral(),
          // for Manage
          forManage(),
          // for incomemanagement
          forIncomeManagement(),
          // for DailyReminder
          forDailyReminder(),
          // for About
          forAbout(),
        ],
      )));

  // buildLogout()=>SettingsItem(
  // DialogBox
  bool tf = false;
  Future<void> showInformationDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return SingleChildScrollView(
              child: AlertDialog(
                actionsPadding: EdgeInsets.only(bottom: 20),
                title: const Text("Currency"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "CANCEL",
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "OK",
                      style: TextStyle(color: Colors.green),
                    ),
                  )
                ],
                content: Column(
                  children: [
                    SizedBox(
                      height: 120,
                      child: GridView.count(
                          crossAxisCount: 4,
                          crossAxisSpacing: 4.0,
                          mainAxisSpacing: 8.0,
                          children: List.generate(
                              CurrencyChanger.testercurrency.length, (index) {
                            return TextButton(
                                onPressed: () {
                                  setState(() {
                                    a = CurrencyChanger
                                        .testercurrency[index].countrySymbol;
                                    currencyTester.switchValue(a);
                                    FocusScope.of(context).unfocus();
                                    CurrencyChanger.isCurrencySelect = false;
                                    _controller.clear();
                                  });
                                },
                                style: ButtonStyle(
                                    backgroundColor: CurrencyChanger
                                            .testercurrency[index]
                                            .selectedCurrency
                                        ? MaterialStateProperty.all<Color>(
                                            Colors.grey)
                                        : MaterialStateProperty.all<Color>(
                                            Colors.transparent)),
                                child: Text(
                                  CurrencyChanger
                                      .testercurrency[index].countrySymbol,
                                  style: TextStyle(fontSize: 16),
                                ));
                          })),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(4),
                      ],
                      onChanged: (text) {
                        CurrencyChanger.isCurrencySelect = true;
                        setState(() {
                          CurrencyChanger.textfieldData = _controller.text;
                          a = _controller.text;
                          for (var i = 0;
                              i < CurrencyChanger.testercurrency.length;
                              i++) {
                            CurrencyChanger.testercurrency[i].selectedCurrency =
                                false;
                          }

                          currencyTester.switchValue(a);
                        });
                      },
                      controller: _controller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.green)),
                        hintText: "Enter Your Custom Currency",
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
        });
  }

  // show theme dialog
  showThemeDialog(BuildContext context) {
    return showDialog(
      
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: ((context, setState) {
              return SingleChildScrollView(
                child: AlertDialog(
                  title: Text("Theme"),
                  content: Column(children: [
                    RadioListTile(
                        title: Text("Light"),
                        value: 1,
                        groupValue: selectRadio,
                        onChanged: (val) {
                          setState(() {
                            setSelectedRadio(val as int);
                            objTheme.switchTheme(val);
                          });
                        }),
                    RadioListTile(
                        title: Text("Dark"),
                        value: 2,
                        groupValue: selectRadio,
                        onChanged: (val) {
                          setState(() {
                            setSelectedRadio(val as int);
                            objTheme.switchTheme(val);
                          });
                        }),
                  ]),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Ok"))
                  ],
                ),
              );
            
            }),
          );
        });
  }

// for textfield
  // ignore: prefer_final_fields
  TextEditingController _controller = TextEditingController();
  // just for testing given values of currency symbol assign to a
  var a = "";
}
