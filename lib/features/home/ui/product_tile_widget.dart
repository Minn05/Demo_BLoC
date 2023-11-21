import 'package:flutter/material.dart';

import '../models/home_product_model.dart';

class ProDuctTileWidget extends StatelessWidget {
  final ProductModel productModel;

  const ProDuctTileWidget({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(color: Colors.grey.shade100),
      child: Column(
        children: [
          Text(productModel.name),
          Text(productModel.description),
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(productModel.imageUrl))),
          )
        ],
      ),
    );
  }
}
