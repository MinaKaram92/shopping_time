import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shopping_time/constants.dart';
import 'package:shopping_time/core/utils/app_text_styles.dart';
import 'package:shopping_time/features/account_feature/presentation/view_models/account_cubit.dart';

class AccountUserDetails extends StatelessWidget {
  const AccountUserDetails({Key? key, required this.cubit}) : super(key: key);

  final AccountCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40.0,
            backgroundColor: Colors.transparent,
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl: cubit.user!.image ?? noProfileImage,
              ),
            ),
          ),
          const SizedBox(
            width: 16.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cubit.user!.name,
                style: AppTextStyles.textStyle18Bold,
              ),
              Text(
                cubit.user!.email,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
