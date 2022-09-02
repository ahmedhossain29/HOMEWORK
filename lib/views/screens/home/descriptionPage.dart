import 'package:flutter/material.dart';
import 'package:homework/views/screens/home/Bullet.dart';

class Description extends StatelessWidget {
  //const Description({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Introduction",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Features :",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        SizedBox(
          child: Column(
            children: <Widget>[
              ListTile(
                leading: MyBullet(),
                title:
                    const Text('Oppo A57 comes with 6.56 inches HD+ screen. '),
              ),
              ListTile(
                leading: MyBullet(),
                title:
                    const Text(' It has a Full-View waterdrop notch design.'),
              ),
              ListTile(
                leading: MyBullet(),
                title: const Text(
                    ' The back camera is of dual 13+2 MP with LED flash, PDAF, f/2.2 aperture, depth sensor etc.'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
