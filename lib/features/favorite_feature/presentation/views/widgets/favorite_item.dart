import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopping_time/constants.dart';
import 'package:shopping_time/core/functions.dart';
import 'package:shopping_time/core/models/product_model/product_model.dart';
import 'package:shopping_time/core/utils/app_text_styles.dart';
import 'package:shopping_time/core/widgets/cart_favorite_Product_image.dart';
import 'package:shopping_time/core/widgets/slide_left_background.dart';
import 'package:shopping_time/core/widgets/slide_right_background.dart';
import 'package:shopping_time/features/cart_feature/presentation/view_models/cart_cubit.dart';
import 'package:shopping_time/features/favorite_feature/presentation/view_models/favorite_cubit.dart';
import 'package:shopping_time/features/favorite_feature/presentation/view_models/favorite_states.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({Key? key, required this.productModel}) : super(key: key);
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteStates>(
      builder: (context, state) {
        final cubit = BlocProvider.of<FavoriteCubit>(context);
        return Dismissible(
          key: Key('${productModel.id}'),
          secondaryBackground: const SlideLeftBackground(),
          background: const SlideRightBackground(
            slideRightIcon: FontAwesomeIcons.cartPlus,
            slideRightText: 'Move To Cart',
          ),
          onDismissed: (direc) {
            if (direc == DismissDirection.endToStart) {
              cubit.removeProductFromFavorites(productModel);
            } else if (direc == DismissDirection.startToEnd) {
              cubit.removeProductFromFavorites(productModel);
              BlocProvider.of<CartCubit>(context)
                  .addProductToCart(productModel);
            }
          },
          confirmDismiss: (direc) async {
            if (direc == DismissDirection.endToStart) {
              return await showDialog(
                  context: context,
                  builder: (context) {
                    return showAlertDialog(context,
                        content:
                            'Are you sure you want to remove this item from favorites?',
                        okPressed: () {
                      Navigator.of(context).pop(true);
                    });
                  });
            } else if (direc == DismissDirection.startToEnd) {
              return await showDialog(
                  context: context,
                  builder: (context) {
                    return showAlertDialog(
                      context,
                      content:
                          'Are you sure you want to move this item to cart?',
                      okPressed: () {
                        Navigator.of(context).pop(true);
                      },
                    );
                  });
            }
          },
          child: Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height * 1.2 / 5,
            child: Row(
              children: [
                CartFavoriteProductImage(productModel: productModel),
                const SizedBox(
                  width: 24.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 45.0,
                        child: Text(
                          productModel.title!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        r'$' '${productModel.price!}',
                        style: AppTextStyles.textStyle18Reg,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
