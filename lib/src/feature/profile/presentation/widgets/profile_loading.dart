import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/widget/common_button.dart';
import '../../../../core/widget/common_text_field.dart';

class ProfileLoading extends StatelessWidget {
  const ProfileLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Align(
              alignment: Alignment.bottomRight,
              child: PopupMenuButton(
                color: Colors.white,
                itemBuilder: (context) => [],
              ),
            ),
            Center(
              child: Shimmer.fromColors(
                highlightColor: Colors.white,
                baseColor: Colors.grey.withOpacity(0.2),
                child: CircleAvatar(
                  radius: 56,
                  backgroundColor: Colors.grey.withOpacity(0.6),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Center(
              child: SizedBox(
                width: 250,
                height: 40,
                child: Shimmer.fromColors(
                  highlightColor: Colors.white,
                  baseColor: Colors.grey.withOpacity(0.2),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(8)
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text("Enter your information\nto make changes"),
            const SizedBox(height: 50),
            CommonTextField(
              onTap: (){},
              readOnly: true,
              labelText: "Email",
              hintText: "example@gmail.com",
            ),
            const SizedBox(height: 20),
            const CommonTextField(
              labelText: "First Name",
              hintText: "Enter your first name",
            ),
            const SizedBox(height: 20),
            const CommonTextField(
              labelText: "Last Name",
              hintText: "Enter your last name",
            ),
            const SizedBox(height: 50),
            CommonButton(
              onPressed: (){},
              text: "Save changes"
            )
          ],
        ),
      ),
    );
  }
}