import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CustomAppBar extends StatelessWidget {
  final String? title;
  CustomAppBar({required this.title});

  @override
  // AppBar().preferredSize.height provide us the height that appy on our app bar
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(padding:const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            SizedBox(height: 40, width: 40,
              child: TextButton(
                style: TextButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
                  primary: Colors.black,
                  backgroundColor: Colors.yellow,
                  padding: EdgeInsets.zero,
                ),
                onPressed: () => Get.back(),
                child: const Icon(Icons.arrow_back_ios_new_rounded, size: 15)
              )),
            const Spacer(),
            Text(title!,   style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20) ),
            const Spacer(),
            IconButton(onPressed: (){}, icon: const Icon(Icons.favorite, size: 30, color: Colors.red))

          ]),
      ) );
  }
}
