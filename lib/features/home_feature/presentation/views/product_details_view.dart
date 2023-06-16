import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_time/constants.dart';
import 'package:shopping_time/core/models/product_model/product_model.dart';
import 'package:shopping_time/core/widgets/custom_app_bar.dart';
import 'package:shopping_time/features/home_feature/presentation/view_models/product_details_cubit/product_details_cubit.dart';
import 'package:shopping_time/features/home_feature/presentation/views/widgets/product_details_view_body.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({Key? key, required this.productModel})
      : super(key: key);
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductDetailsCubit(productModel: productModel),
      child: Scaffold(
        backgroundColor: const Color(appPrimaryColor),
        appBar: CustomAppBar(
          appBar: AppBar(),
          title: productModel.title!,
          leading: const BackButton(),
          centerTitle: false,
          actionIcon: Icons.share,
          actionPressed: () {},
        ),
        body: ProductDetailsViewBody(productModel: productModel),
      ),
    );
  }
}
