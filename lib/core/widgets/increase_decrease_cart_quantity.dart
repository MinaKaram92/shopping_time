import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_time/constants.dart';
import 'package:shopping_time/features/cart_feature/data/models/cart_model.dart';
import 'package:shopping_time/features/cart_feature/presentation/view_models/cart_cubit.dart';
import 'package:shopping_time/features/cart_feature/presentation/view_models/cart_states.dart';

class IncreaseDecreaseCartQantity extends StatelessWidget {
  const IncreaseDecreaseCartQantity(
      {Key? key,
      required this.cartModel,
      this.width,
      this.height,
      this.quantitySize})
      : super(key: key);

  final CartModel cartModel;
  final double? width;
  final double? height;
  final double? quantitySize;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartStates>(
      builder: (context, state) {
        final cubit = BlocProvider.of<CartCubit>(context);
        return Container(
          decoration: BoxDecoration(
              color: Colors.grey[400], borderRadius: BorderRadius.circular(16)),
          width: width,
          height: height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: cubit.isQuantityDecreasable(cartModel)
                      ? () => cubit.decreaseQuantity(cartModel)
                      : null,
                  icon: Icon(
                    Icons.remove,
                    color: cubit.isQuantityDecreasable(cartModel)
                        ? const Color(appSecondaryColor)
                        : Colors.grey.shade600,
                  ),
                ),
                const Spacer(),
                Text(
                  '${cartModel.quantity}',
                  style: TextStyle(fontSize: quantitySize),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    cubit.increaseQuantity(cartModel);
                  },
                  icon: const Icon(
                    Icons.add,
                    color: Color(appSecondaryColor),
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
