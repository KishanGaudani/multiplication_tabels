// ignore_for_file: avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'Global.dart';

class first extends StatefulWidget {
  const first({super.key});

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  List ind = List.generate(10, (index) => index + 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Multipliction Tables",
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              ...Global.number
                  .map(
                    (num) => Row(
                      children: [
                        Column(
                          children: [
                            ...ind
                                .map(
                                  (t) => Column(
                                    children: [
                                      (t < 10)
                                          ? Text(
                                              "$num * 0$t = ${int.parse(num) * t}",
                                            )
                                          : Text(
                                              "$num * $t = ${int.parse(num) * t}",
                                            ),
                                    ],
                                  ),
                                )
                                .toList(),
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ],
          ),
        ],
      ),
    );
  }
}
