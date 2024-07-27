import 'package:flutter/material.dart';

class TopBarPictureWidget extends StatelessWidget {
  final String imageSrc;
  final BoxConstraints constraints;
  const TopBarPictureWidget(this.constraints,
      {super.key, required this.imageSrc});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: constraints.maxHeight * 0.37,
          decoration: const BoxDecoration(
              color: Color.fromRGBO(48, 24, 172, 1),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              )),
          child: Image.network(imageSrc),
        ),
        Card(
          margin: const EdgeInsets.only(top: 15, left: 10),
          shape: const CircleBorder(),
          child: IconButton(
              onPressed: () => Navigator.of(context).pop(true),
              icon: const Icon(
                Icons.arrow_back_ios_rounded,
                color: Color.fromRGBO(48, 24, 172, 1),
              )),
        ),
      ],
    );
  }
}
