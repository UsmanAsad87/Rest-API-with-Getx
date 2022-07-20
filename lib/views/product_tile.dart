import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:rest_api_with_getx/models/product.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Image.network(
                    product.imageLink,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Obx(
                        () {
                      return CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                            icon: product.isFavorite.value
                                ? Icon(Icons.favorite_rounded,color: Colors.orange,)
                                : Icon(Icons.favorite_border,color: Colors.black,),
                            onPressed:(){
                              product.isFavorite.toggle();
                            }
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8,),
            Text(
              product.name,
              maxLines: 2,
              style: const TextStyle(
                fontFamily: 'avenir',
                fontWeight: FontWeight.w800,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8,),
            if(product.rating != null)
              Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 2),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      product.rating.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                    const Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            const SizedBox(height: 8,),
            Text(
              '\$${product.price}',
              style: const TextStyle(fontSize: 32,fontFamily: 'avenir'),
            )
          ],
        ),
      ),
    );
  }
}
