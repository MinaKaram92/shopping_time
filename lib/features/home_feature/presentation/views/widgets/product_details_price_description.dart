import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopping_time/core/constants/constants.dart';
import 'package:shopping_time/core/models/product_model/product_model.dart';
import 'package:shopping_time/core/utils/app_text_styles.dart';
import 'package:shopping_time/features/home_feature/presentation/view_models/product_details_cubit/product_details_cubit.dart';
import 'package:shopping_time/features/home_feature/presentation/view_models/product_details_cubit/product_details_states.dart';

class ProductDetailsPriceDescription extends StatelessWidget {
  const ProductDetailsPriceDescription({Key? key, required this.productModel})
      : super(key: key);
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubit, ProductDetailsStates>(
      builder: (context, state) {
        final cubit = BlocProvider.of<ProductDetailsCubit>(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                r'$' '${productModel.price!}',
                style: AppTextStyles.textStyle24Bold,
              ),
            ),
            Row(
              children: const [
                Icon(
                  FontAwesomeIcons.truck,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Prices incl. VAT.',
                  ),
                ),
                Text('plus shipping costs'),
              ],
            ),
            const SizedBox(
              height: 16.0,
            ),
            Text(
              productModel.description!,
              maxLines: cubit.isReadMore ? null : 3,
              overflow: cubit.isReadMore
                  ? TextOverflow.visible
                  : TextOverflow.ellipsis,
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  cubit.readMore();
                },
                child: Text(
                  cubit.isReadMore ? 'Read less' : 'Read more',
                  style: const TextStyle(
                    color: Color(appSecondaryColor),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
