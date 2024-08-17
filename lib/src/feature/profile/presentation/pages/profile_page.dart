import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pdp_quiz_app_with_my_backand/src/core/routes/app_route_name.dart';
import 'package:pdp_quiz_app_with_my_backand/src/core/widget/common_button.dart';
import 'package:pdp_quiz_app_with_my_backand/src/core/widget/common_snacbar.dart';
import 'package:pdp_quiz_app_with_my_backand/src/core/widget/common_text_field.dart';
import 'package:pdp_quiz_app_with_my_backand/src/core/widget/svg_icon.dart';
import 'package:pdp_quiz_app_with_my_backand/src/feature/profile/controller/profile_controller.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/storage/app_storage.dart';
import '../widgets/profile_loading.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Provider.of<ProfileController>(context, listen: false);
    controller.fetchData();
    return Consumer<ProfileController>(
      builder: (context, controller, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: !controller.isLoading ? ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              const SizedBox(height: 30),
              Align(
                alignment: Alignment.bottomRight,
                child: PopupMenuButton(
                  color: Colors.white,
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      onTap: () => controller.pickAndUploadImage(context),
                      child: Text(
                        controller.profileModel!.profileImageUrl != null
                            ? "Rasmni o'zgartirish"
                            : "Rasm qo'yish"
                      ),
                    ),
                    if(controller.profileModel!.profileImageUrl != null)
                    PopupMenuItem(
                      onTap: () => controller.deleteProfilerImage(context),
                      child: const Text("Rasmni o'chirish"),
                    ),
                    PopupMenuItem(
                      onTap: () => controller.logout(),
                      child: const Text("Logout"),
                    ),
                    PopupMenuItem(
                      onTap: () async => context.push(AppRouteName.chatPage, extra: await AppStorage.load(StorageKey.uid)),
                      child: const Text("Help center"),
                    ),
                  ],
                ),
              ),
              Center(
                child: Consumer<ProfileController>(
                  builder: (context, controller, child) {
                    return !controller.isLoadingProfileImage ? CircleAvatar(
                      radius: 56,
                      backgroundColor: Colors.transparent,
                      backgroundImage: controller.profileModel!.profileImageUrl != null ? NetworkImage(controller.profileModel!.profileImageUrl!) : null,
                      child: controller.profileModel!.profileImageUrl == null ? const SvgIcon(SvgIcons.profilePageIcon) : null,
                    ) : Shimmer.fromColors(
                      highlightColor: Colors.white,
                      baseColor: Colors.grey.withOpacity(0.2),
                      child: CircleAvatar(
                        radius: 56,
                        backgroundColor: Colors.grey.withOpacity(0.6),
                      )
                    );
                  }
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text("User Name"),
              ),
              Center(
                child: Text(
                  "${controller.profileModel!.firstname} ${controller.profileModel!.lastname ?? ""}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text("Enter your information\nto make changes"),
              const SizedBox(height: 50),
              CommonTextField(
                onTap: (){
                  controller.emailFocusNode.unfocus();
                  CommonSnackBar(
                    context: context,
                    contentText: "Emailni o'zgartirish mumkin emas"
                  );
                },
                readOnly: true,
                labelText: "Email",
                hintText: "example@gmail.com",
                focusNode: controller.emailFocusNode,
                controller: controller.emailController,
              ),
              const SizedBox(height: 20),
              CommonTextField(
                labelText: "First Name",
                hintText: "Enter your first name",
                textInputAction: TextInputAction.next,
                controller: controller.firstNameController,
              ),
              const SizedBox(height: 20),
              CommonTextField(
                labelText: "Last Name",
                hintText: "Enter your last name",
                controller: controller.lastNameController,
              ),
              const SizedBox(height: 50),
              CommonButton(
                text: "Save changes",
                onPressed: () => controller.saveChanges(context)
              )
            ],
          ) :  const ProfileLoading()
        );
      }
    );
  }
}
