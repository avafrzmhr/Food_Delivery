import 'package:flutter/material.dart';

class TopBarPictureWidget extends StatelessWidget {
  final String imageSrc;
  final BoxConstraints constraints;
  const TopBarPictureWidget(this.constraints,
      {super.key, required this.imageSrc});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Card(
        //   margin: const EdgeInsets.only(top: 15, left: 10),
        //   shape: const CircleBorder(),
        //   child: IconButton(
        //       onPressed: () => Navigator.of(context).pop(true),
        //       icon: const Icon(
        //         size: 20,
        //         Icons.arrow_back_ios_rounded,
        //         color: Color.fromRGBO(48, 24, 172, 1),
        //       )),
        // ),
        SizedBox(
          width: constraints.maxWidth * 0.04,
        ),
        Container(
          padding: const EdgeInsets.only(top: 15),
          height: constraints.maxHeight * 0.37,
          width: constraints.maxWidth * 0.75,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          )),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.network(
              imageSrc,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
