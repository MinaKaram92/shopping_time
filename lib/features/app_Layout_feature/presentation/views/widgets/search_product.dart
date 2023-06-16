import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_time/constants.dart';
import 'package:shopping_time/features/app_Layout_feature/presentation/view_models/home_layout_cubit/app_layout_cubit.dart';

class SearchProduct extends StatelessWidget {
  const SearchProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[400],
          borderRadius: BorderRadius.circular(16.0),
        ),
        width: double.infinity,
        height: 60.0,
        child: TextFormField(
          controller: BlocProvider.of<AppLayoutCubit>(context).searchController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: const BorderSide(width: 1.0, color: Colors.grey)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: const BorderSide(width: 1.0, color: Colors.grey)),
            hintText: 'Search',
            suffixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search, color: Color(appSecondaryColor)),
            ),
          ),
        ),
      ),
    );
  }
}
