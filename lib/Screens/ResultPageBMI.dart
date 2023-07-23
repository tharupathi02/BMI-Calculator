import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ResultPageBMI extends StatefulWidget {
  var weight = 0.0;
  var height = 0.0;

  ResultPageBMI({Key? key, required this.weight, required this.height})
      : super(key: key);

  @override
  State<ResultPageBMI> createState() => _ResultPageBMIState();
}

class _ResultPageBMIState extends State<ResultPageBMI> {
  var result = 0.0;
  var resultText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Final Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  calculateBMI().toString(),
                  style: const TextStyle(
                    fontSize: 75.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'kg/m2',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black38,
                        fontFamily: 'PoppinsSemiBold',
                      ),
                    ),
                    Text(
                      calculateResult().toString(),
                      style: const TextStyle(
                        fontSize: 25.0,
                        color: Colors.black,
                        fontFamily: 'PoppinsSemiBold',
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Divider(
              height: 20,
              thickness: 5,
              indent: 20,
              endIndent: 20,
              color: Colors.black12,
            ),
            const SizedBox(
              height: 20.0,
            ),
            SfRadialGauge(
              axes: <RadialAxis>[
                RadialAxis(
                  minimum: 16,
                  maximum: 40,
                  ranges: <GaugeRange>[
                    GaugeRange(
                        startValue: 16, endValue: 18.5, color: Colors.blue),
                    GaugeRange(
                        startValue: 18.5, endValue: 25.0, color: Colors.orange),
                    GaugeRange(
                        startValue: 25.0, endValue: 40, color: Colors.red),
                  ],
                  pointers: <GaugePointer>[NeedlePointer(value: result)],
                  annotations: <GaugeAnnotation>[
                    GaugeAnnotation(
                        widget: Text(
                            '${double.parse(result.toStringAsFixed(1)).toString()} kg/m2',
                            style: const TextStyle(
                                fontSize: 25, fontFamily: 'PoppinsSemibold')),
                        angle: 90,
                        positionFactor: 0.5),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Container(
                      height: 15.0,
                      width: 15.0,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    const Text(
                      'Underweight',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontFamily: 'Poppins',
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 15.0,
                      width: 15.0,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        color: Colors.orange,
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    const Text(
                      'Normal',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontFamily: 'Poppins',
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 15.0,
                      width: 15.0,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    const Text(
                      'Overweight',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontFamily: 'Poppins',
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  double calculateBMI() {
    result = (((widget.weight / widget.height) / widget.height) * 10000);
    return double.parse(result.toStringAsFixed(1));
  }

  String calculateResult() {
    if (result < 18.5) {
      return 'Underweight';
    } else if (result > 18.5 && result < 25.0) {
      return 'Normal';
    } else if (result > 25.0 && result < 30.0) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }
}
