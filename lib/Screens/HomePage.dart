import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'ResultPageBMI.dart';

class HomePageBMI extends StatefulWidget {
  const HomePageBMI({super.key});

  @override
  State<HomePageBMI> createState() => _HomePageBMIState();
}

class _HomePageBMIState extends State<HomePageBMI> {
  var weight = 60.0;
  var height = 170.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Text(
                  'BMI Calculator',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'PoppinsBold',
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                SfSlider(
                  min: 0.0,
                  max: 150.0,
                  value: weight,
                  interval: 20.0,
                  showTicks: true,
                  showLabels: true,
                  enableTooltip: true,
                  activeColor: Colors.blue.shade900,
                  onChanged: (dynamic value) {
                    setState(() {
                      weight = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: Text(
                    'Weight: ${weight.toStringAsFixed(1)} Kg',
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'PoppinsSemiBold',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Expanded(
                      flex: 5,
                      child: Image(
                        image: AssetImage('images/img.png'),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 500,
                        child: SfSlider.vertical(
                          min: 100.0,
                          max: 250.0,
                          value: height,
                          interval: 20,
                          showTicks: true,
                          showLabels: true,
                          enableTooltip: true,
                          minorTicksPerInterval: 1,
                          onChanged: (dynamic value) {
                            setState(() {
                              height = value;
                            });
                          },
                        ),
                      ),
                    )
                  ],
                ),
                Center(
                  child: Text(
                    'Height: ${height.toStringAsFixed(1)} cm',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontFamily: 'PoppinsSemiBold',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                FilledButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                      elevation: MaterialStateProperty.all(8.0),
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                          horizontal: 100.0,
                          vertical: 10.0,
                        ),
                      ),
                    ),
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultPageBMI(
                            weight: weight,
                            height: height,
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      'Calculate',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins',
                      ),
                    ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
