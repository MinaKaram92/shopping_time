import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopping_time/core/constants/constants.dart';
import 'package:shopping_time/features/account_feature/presentation/view_models/account_cubit.dart';
import 'package:shopping_time/features/account_feature/presentation/view_models/account_states.dart';

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccountCubit, AccountStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = BlocProvider.of<AccountCubit>(context);
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundColor: Colors.transparent,
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: cubit.user!.image ?? noProfileImage,
                  ),
                ),
              ),
              Positioned(
                bottom: 10.0,
                right: -12.0,
                child: CircleAvatar(
                  radius: 20.0,
                  backgroundColor: Colors.grey.shade600,
                  child: IconButton(
                    icon:
                        const Icon(Icons.edit, color: Color(appSecondaryColor)),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                  onPressed: () async {
                                    await cubit
                                        .updateProfilePhoto(ImageSource.camera);
                                  },
                                  icon: const Icon(Icons.camera_alt),
                                ),
                                const SizedBox(
                                  width: 24.0,
                                ),
                                IconButton(
                                    onPressed: () async {
                                      await cubit.updateProfilePhoto(
                                          ImageSource.gallery);
                                    },
                                    icon: const Icon(Icons.photo_library)),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
