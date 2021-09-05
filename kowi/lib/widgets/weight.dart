import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class Weight extends StatefulWidget {
  const Weight({Key? key}) : super(key: key);

  @override
  _WeightState createState() => _WeightState();
}

class _WeightState extends State<Weight> {

  bool pound = true;
  double weight = 59.0;

  changeToP() {
    pound = true;
    setState(() {});
  }

  changeToK() {
    pound = false;
    setState(() {});
  }

  onWeightChanged(newWeight) {
    weight = double.parse(newWeight.toString());
    setState(() {});
    debugPrint("Weight: $weight");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Text("Weight", style: Theme.of(context).textTheme.headline3,)),
            if (pound) OutlinedButton(onPressed: changeToK, child: const Text("Kg")),
            if (!pound) ElevatedButton(onPressed: changeToK, child: const Text("Kg")),
            const SizedBox(width: 10.0,),
            if (pound) ElevatedButton(onPressed: changeToP, child: const Text("Pound")),
            if (!pound) OutlinedButton(onPressed: changeToP, child: const Text("Pound")),
          ],
        ),
        SfSlider(
          value: weight,
          onChanged: onWeightChanged,
          min: 40.0,
          max: 160.0,
          interval: 20.0,
          stepSize: 0.1,
          minorTicksPerInterval: 1,
          showTicks: true,
          showDividers: true,
          showLabels: true,
          enableTooltip: true,
          tooltipShape: const SfPaddleTooltipShape(),
        ),
        OutlinedButton(onPressed: null, child: Text(weight.toStringAsFixed(1))),
      ],
    );
  }
}
