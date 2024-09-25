import 'package:flutter/material.dart';

import '../utils/app_color.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    required this.onTap,
    required this.onChanged,
    this.enabled,
    this.autoFocus,
    this.controller,
  });

  final VoidCallback onTap;
  final Function(String string) onChanged;
  final bool? enabled;
  final bool? autoFocus;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: greyColor,
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),

        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: controller,

                onChanged: onChanged,
                enabled: enabled,
                autofocus: autoFocus ?? true,

                cursorColor: Colors.white54,
                style: const TextStyle(
                  color: Colors.white54,
                  fontWeight: FontWeight.w500
                ),

                decoration: const InputDecoration(

                  hintText: 'Search movies, shows...',
                  hintStyle: TextStyle(
                      color: Colors.white54,
                      fontWeight: FontWeight.w500
                  ),

                  enabledBorder: InputBorder.none,

                  focusedBorder: InputBorder.none,
                ),
              ),
            ),

            const Icon(
              Icons.search,
              color: Colors.white54,
            ),

            const SizedBox(width: 15),

            const Icon(
              Icons.clear,
              color: Colors.white54,
            )
          ],
        ),
      ),
    );
  }
}
