import 'package:flutter/material.dart';

import '../../shared/shared_component/component.dart';

class explore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            SizedBox(height: 10),
            greytext("mon,5th september 2022",10),
            blacktext("Explore", 15),
              SizedBox(height: 10),
            searchfield(),
              SizedBox(height: 10),
              Row(
                children: [
                  
                ],
              )
        ],
      ),
          ),
    );
  }
}