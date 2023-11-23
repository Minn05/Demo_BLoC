// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:demobloc/features/wishlist/bloc/wishlist_bloc.dart';
import '../../home/models/home_product_model.dart';

class WishlistTileWidget extends StatelessWidget {
  final ProductModel productModel;
  final WishlistBloc wishlistBloc;

  const WishlistTileWidget({
    Key? key,
    required this.productModel,
    required this.wishlistBloc,
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
                        wishlistBloc.add(WishlistRemoveFromWishlistEvent(
                            productModel: productModel));
                      },
                      icon: const Icon(Icons.favorite)),
                  //Cart
                  IconButton(
                      onPressed: () {
                        // WishlistBloc.add(WishlistRemoveFromWishlistEvent(
                        //     productModel: productModel));
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
