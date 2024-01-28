import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/slider_provider.dart';
import 'package:provider/provider.dart';

class SliderExample extends StatefulWidget {
  const SliderExample({super.key});

  @override
  State<SliderExample> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  double opacityvalue = 0.5;
  @override
  void initState() {
    super.initState();
    // Implement some initialization operations here.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider Example'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<SliderProvider>(
            builder: (context, value, child) {
              return Slider(
                  min: 0,
                  max: 1,
                  value: value.opacityValue,
                  onChanged: (val) {
                    value.setOpacity(val);
                  });
            },
          ),
          Consumer<SliderProvider>(
            builder: (context, value, child) {
              return  Row(
            children: [
              Expanded(
                  child: Container(
                height: 50,
                color: Colors.amber.withOpacity(value.opacityValue),
                child: const Center(child: Text('Container 1')),
              )
              ),
              Expanded(
                  child: Container(
                height: 50,
                color: Colors.green.withOpacity(value.opacityValue),
                child: const Center(child: Text('Container 1')),
              )),
            ],
          );
            },
          ),
          
         
        ],
      ),
    );
  }
}
