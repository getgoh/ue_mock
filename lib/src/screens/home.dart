import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ue_mock/constants.dart';

class Home extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final segmentedControlIndex = useState(0);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            backgroundColor: Colors.white,
            expandedHeight: MediaQuery.of(context).size.height * 0.1,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              centerTitle: true,
              title: CupertinoSlidingSegmentedControl(
                thumbColor: Colors.black,
                backgroundColor: Colors.white,
                groupValue: segmentedControlIndex.value,
                onValueChanged: (int value) {
                  segmentedControlIndex.value = value;
                },
                children: {
                  0: Text(
                    'Delivery',
                    style: segmentedControlIndex.value == 0
                        ? kHomeSegmentedControlSelectedTextStyle
                        : kHomeSegmentedControlIdleTextStyle,
                  ),
                  1: Text(
                    'Pickup',
                    style: segmentedControlIndex.value == 1
                        ? kHomeSegmentedControlSelectedTextStyle
                        : kHomeSegmentedControlIdleTextStyle,
                  ),
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
