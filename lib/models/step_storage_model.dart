import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

typedef StepCallback = void Function(int count);

class DateStep {
  String? date;
  int? steps;

  DateStep({this.date, this.steps});

  @override
  String toString() {
    return 'DateStep Date: ${date.toString()}, Steps: $steps';
  }

  DateStep.fromJson(Map<String, dynamic> json)
      : date = json['d'],
        steps = json['s'];

  Map<String, dynamic> toJson() {
    return {
      'd': date,
      's': steps,
    };
  }
}

typedef DateStepList = List<DateStep>;

class StepStorageModel {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<int> counter;
  late Future<DateStepList> counterDate;

  StepStorageModel() {
    counter = _prefs.then((SharedPreferences prefs) {
      return prefs.getInt('counter') ?? 0;
    });

    counterDate = _prefs.then((SharedPreferences prefs) async {
      log(prefs.getString('counter_date')!);
      Iterable i = jsonDecode(prefs.getString('counter_date') ?? '[]');

      final DateStepList dateStepList =
          DateStepList.from(i.map((e) => DateStep.fromJson(e)));

      log('Actual DateStepList = $dateStepList');

      return dateStepList;
    });
  }

  Future<int> setSteps(int steps) async {
    final SharedPreferences prefs = await _prefs;
    return counter = prefs.setInt('counter', steps).then((bool success) {
      return steps;
    });
  }

  Future<DateStepList> setDateSteps(int steps) async {
    final SharedPreferences prefs = await _prefs;
    final DateTime now = DateTime.now();
    final DateTime today = DateTime(now.year, now.month, now.day);
    final DateStepList actualCounterDates = await counterDate;
    int actualObjectIndex = actualCounterDates.indexWhere(
        (element) => DateTime.parse(element.date!).compareTo(today) == 0);

    if (actualObjectIndex < 0) {
      final dateStep = DateStep(date: today.toString(), steps: steps);
      actualCounterDates.add(dateStep);
      return prefs
          .setString('counter_date', jsonEncode(actualCounterDates))
          .then((value) => actualCounterDates);
    }

    actualCounterDates[actualObjectIndex].steps = steps;

    log('Save actual list = $actualCounterDates');

    return prefs
        .setString('counter_date', jsonEncode(actualCounterDates))
        .then((value) => actualCounterDates);
  }
}
