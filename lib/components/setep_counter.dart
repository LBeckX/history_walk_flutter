import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:history_walk/models/step_storage_model.dart';

import '../models/step_model.dart';

class StepCounter extends StatefulWidget {
  const StepCounter({super.key});

  @override
  State<StepCounter> createState() => _StepCounterState();
}

class _StepCounterState extends State<StepCounter> {
  late StepStorageModel _stepStorageModel;
  late StepModel _stepModel;
  late String _steps = '0';
  late String _pedestrianStatus = 'no status';
  late DateStepList dateStepList = [];

  @override
  initState() {
    super.initState();
    _stepStorageModel = StepStorageModel();
    _stepModel = StepModel();
    _setActualDateStepList();
    _initStepTracking();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(_steps, style: const TextStyle(fontSize: 24)),
          const SizedBox(height: 10),
          Text(_pedestrianStatus, style: const TextStyle(fontSize: 24)),
          SizedBox(
              height: 160,
              child: ListView.separated(
                  itemCount: dateStepList.length,
                  scrollDirection: Axis.vertical,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 25),
                  itemBuilder: (context, index) {
                    return Container(
                      color: const Color(0x22000000),
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(dateStepList[index].date ?? ''),
                          Text(dateStepList[index].steps.toString() ?? ''),
                        ],
                      ),
                    );
                  })),
        ],
      ),
    );
  }

  Future<void> _initStepTracking() async {
    if (await _stepModel.requestActivityPermissions()) {
      log('Has activity permission');
      _stepModel.initStepCount(onStep: _onStep, onStepError: _onStepError);
      _stepModel.initPedestrianStatus(
          onPedestrianStatusCallback: _onPedestrianStatus,
          onPedestrianStatusError: _onPedestrianStatusError);
      return;
    }
    log('No activity permission');
  }

  Future<void> _setActualDateStepList() async {
    final tempDateStepList = await _stepStorageModel.counterDate;
    setState(() {
      dateStepList = tempDateStepList;
    });
  }

  _onStep(String step) {
    setState(() {
      final stepsInt = int.parse(step);
      _steps = step;
      _stepStorageModel.setSteps(stepsInt);
      _stepStorageModel.setDateSteps(stepsInt);
    });
  }

  _onStepError(String error) {
    setState(() {
      _steps = error;
      log('set step error $_steps');
    });
  }

  _onPedestrianStatus(String status) {
    setState(() {
      _pedestrianStatus = status;
    });
  }

  _onPedestrianStatusError(String error) {
    setState(() {
      _pedestrianStatus = error;
      log('set pedestrian status error $_pedestrianStatus');
    });
  }
}
