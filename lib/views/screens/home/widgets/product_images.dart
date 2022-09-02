import 'package:flutter/material.dart';
import 'package:homework/ProductController.dart';
class ProductImages extends StatefulWidget {
  final String? baseUrl;
  final String? imagePath;
  final ProductController? controller;
  const ProductImages({Key? key, this.baseUrl, this.imagePath, this.controller}) : super(key: key);

  @override
  _ProductImagesState createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 320,
          width: 400,
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: Colors.orange.withOpacity(.3),
          ),
          child: Hero(tag:1,
            child: FadeInImage(width: 200, height: 150, fit: BoxFit.cover,
                        placeholder: const NetworkImage('https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty.jpg'),
                        image: NetworkImage('${widget.baseUrl}/${widget.controller?.productImages[selectedImage]}'),
                        placeholderErrorBuilder: (b, o, s) {
                          return Image.network('https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty.jpg');
                        }),

            // Image.asset("widget.product.images[selectedImage]"),
          ),
        ),
        // SizedBox(height: getProportionateScreenWidth(20)),
        Positioned(bottom: 0,
          child: Row(
            children: List.generate(4,
                  (index) => Center(child: buildSmallProductPreview(index)))),
        )
      ]);
  }

  GestureDetector buildSmallProductPreview(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          padding: const EdgeInsets.all(5),
          height: 65,
          width: 65,
          decoration: BoxDecoration(
            color: Colors.white,
            // borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: Colors.orange.withOpacity(selectedImage == index ? 1 : 0)),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: FadeInImage(width: 195, height: 195, fit: BoxFit.cover,
                placeholder: const NetworkImage('https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty.jpg'),
                image: NetworkImage('${widget.baseUrl}/${widget.controller?.productImages[selectedImage]}'),
                placeholderErrorBuilder: (b, o, s) {
                  return Image.network('https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty.jpg');
                }),
          ),
        ),
      ),
    );
  }
}
