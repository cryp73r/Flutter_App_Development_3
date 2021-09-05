import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class Height extends StatefulWidget {
  const Height({Key? key}) : super(key: key);

  @override
  _HeightState createState() => _HeightState();
}

class _HeightState extends State<Height> {

  bool meter = true;
  double height = 172.0;

  changeToM() {
    meter = true;
    setState(() {});
  }

  changeToF() {
    meter = false;
    setState(() {});
  }

  onHeightChanged(newHeight) {
    height = double.parse(newHeight.toString());
    setState(() {});
    debugPrint("Height: $height");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Text("Height", style: Theme.of(context).textTheme.headline3,)),
            if (meter) OutlinedButton(onPressed: changeToF, child: const Text("Feet")),
            if (!meter) ElevatedButton(onPressed: changeToF, child: const Text("Feet")),
            const SizedBox(width: 10.0,),
            if (meter) ElevatedButton(onPressed: changeToM, child: const Text("Meters")),
            if (!meter) OutlinedButton(onPressed: changeToM, child: const Text("Meters")),
          ],
        ),
        SfSlider(
          value: height,
          onChanged: onHeightChanged,
          min: 100.0,
          max: 300.0,
          interval: 50.0,
          stepSize: 0.1,
          minorTicksPerInterval: 4,
          showTicks: true,
          showDividers: true,
          showLabels: true,
          enableTooltip: true,
          tooltipShape: const SfPaddleTooltipShape(),
        ),
        OutlinedButton(onPressed: null, child: Text(height.toStringAsFixed(1))),
      ],
    );
  }
}
