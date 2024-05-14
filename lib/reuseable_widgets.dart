import 'package:flutter/material.dart';


class ProductContainer extends StatelessWidget {
  const ProductContainer({
    super.key,
    required this.productImage,
    required this.productName,
    required this.productPrice,
  });

  final String productImage;
  final String productName;
  final String productPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 180,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      alignment: Alignment.bottomLeft,
      decoration: BoxDecoration(
          color: Colors.grey.shade400,
          borderRadius: BorderRadius.circular(14),
        image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken),
            image: NetworkImage(productImage))
      ),
      child: Container(
          margin: EdgeInsets.only(bottom: 14,left: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(productName , style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14,color: Colors.white),),
              Text(productPrice , style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12, color: Colors.white),),
            ],
          )),
    );
  }
}
