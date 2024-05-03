import 'package:flutter/material.dart';

class TopsListViewWidget extends StatefulWidget {
  final BoxConstraints constraints;
  const TopsListViewWidget(this.constraints, {super.key});

  @override
  State<TopsListViewWidget> createState() => _TopsListViewWidgetState();
}

class _TopsListViewWidgetState extends State<TopsListViewWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      reverse: true,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 15),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromARGB(255, 144, 142, 145),
                ),
                width: widget.constraints.maxWidth * 0.8,
                height: widget.constraints.maxHeight * 0.3,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.red,
                ),
                width: widget.constraints.maxWidth * 0.8,
                height: 150,
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 15),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromARGB(255, 144, 142, 145),
                ),
                width: widget.constraints.maxWidth * 0.8,
                height: widget.constraints.maxHeight * 0.3,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.red,
                ),
                width: widget.constraints.maxWidth * 0.8,
                height: 150,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
