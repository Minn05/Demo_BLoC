import 'package:flutter/material.dart';
import '../../home/models/home_product_model.dart';
import '../bloc/cart_bloc.dart';

class CartTileWidget extends StatelessWidget {
  final ProductModel productModel;
  final CartBloc cartBloc;

  const CartTileWidget({
    Key? key,
    required this.productModel,
    required this.cartBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.grey.shade100,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.35,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(productModel.imageUrl))),
          ),
          Text(
            productModel.name,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(productModel.description),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$ ' + productModel.price.toString(),
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //wishlist
                  IconButton(
                      onPressed: () {
                        // cartBloc.add(HomeProductWishlistButtonClickedEvent(
                        //     clickedProduct: productModel));
                      },
                      icon: const Icon(Icons.favorite_border)),
                  //Cart
                  IconButton(
                      onPressed: () {
                        cartBloc.add(CartRemoveFromCartEvent(
                            productModel: productModel));
                      },
                      icon: const Icon(Icons.shopping_bag_rounded)),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
