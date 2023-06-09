import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_time/core/models/product_model/product_model.dart';
import 'package:shopping_time/core/utils/app_text_styles.dart';
import 'package:shopping_time/features/home_view_feature/presentation/view_models/cubits/product_details_cubit/product_details_cubit.dart';
import 'package:shopping_time/features/home_view_feature/presentation/view_models/cubits/product_details_cubit/product_details_states.dart';
import 'package:shopping_time/features/home_view_feature/presentation/views/widgets/product_details_add_to_favorite_cart.dart';
import 'package:shopping_time/features/home_view_feature/presentation/views/widgets/product_details_price_description.dart';
import 'package:shopping_time/features/home_view_feature/presentation/views/widgets/product_details_product_image.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({Key? key, required this.productModel})
      : super(key: key);
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubit, ProductDetailsStates>(
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 16.0, bottom: 16.0),
                        child: Text(
                          productModel.title!,
                          style: AppTextStyles.textStyle24Reg,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.0),
                            topRight: Radius.circular(16.0),
                          ),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ProductDetailsImage(productModel: productModel),
                              ProductDetailsPriceDescription(
                                  productModel: productModel),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const AddProductToFavoriteOrCart(),
          ],
        );
      },
    );
  }
}
