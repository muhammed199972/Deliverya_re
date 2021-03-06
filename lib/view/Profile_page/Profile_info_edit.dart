import 'package:bot_toast/bot_toast.dart';
import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/General/Dialogs.dart';
import 'package:delivery_food/controller/Auth_controller.dart';
import 'package:delivery_food/controller/Profile_controller.dart';
import 'package:delivery_food/view/Profile_page/Component/OptionProfile.dart';
import 'package:delivery_food/view/Profile_page/Component/TextField.dart';
import 'package:delivery_food/view/Virefy_pages/Component/Buttons.dart';
import 'package:delivery_food/view/Virefy_pages/Component/TextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileInfoEdit extends StatelessWidget {
  ProfileInfoEdit({Key? key}) : super(key: key);
  var controller = Get.find<ProfileController>();
  final _phoneController = TextEditingController();
  final _confirmPassController = TextEditingController();
  final _newpassController = TextEditingController();
  final _oldpassController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  var formkey1 = GlobalKey<FormState>();
  var formkey2 = GlobalKey<FormState>();
  var status = StatusCode();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteappbarColor,
        elevation: 1,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: AppColors.blackColor,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          'personalinfo'.tr,
          style: TextStyle(color: AppColors.blackColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.bottomSheet(
                        Container(
                            padding: EdgeInsets.only(
                                top: Defaults.defaultPadding * 2,
                                bottom: Defaults.defaultPadding * 2),
                            height: size.height * 0.191,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.darkgreyColor,
                                  offset: Offset(0, -2),
                                  blurRadius: 5,
                                  spreadRadius: 2,
                                )
                              ],
                            ),
                            child: Column(
                              children: [
                                Center(
                                  child: InkWell(
                                      onTap: () {
                                        controller.postImg(ImageSource.camera);
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                              'assets/svg/cam.svg'),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Camera',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: AppColors.mainColor),
                                          ),
                                        ],
                                      )),
                                ),
                                Divider(
                                  color: AppColors.darkgreytextColor,
                                ),
                                Center(
                                  child: InkWell(
                                      onTap: () {
                                        controller.postImg(ImageSource.gallery);
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                              'assets/svg/galary.svg'),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Galary',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: AppColors.mainColor),
                                          ),
                                        ],
                                      )),
                                ),
                              ],
                            )),
                      );
                    },
                    child: GetBuilder<ProfileController>(
                      builder: (c) {
                        return Stack(
                          children: [
                            c.file.path != ''
                                ? Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFFDADADA),
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: AppColors.mainColor,
                                        width: 1,
                                      ),
                                      image: DecorationImage(
                                          image: FileImage(c.file),
                                          fit: BoxFit.cover),
                                    ),
                                    width: size.width * 0.17,
                                    height: size.height * 0.1,
                                    margin: EdgeInsets.only(
                                        bottom: 0, left: 17, top: 10, right: 8),
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFFDADADA),
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: AppColors.mainColor,
                                        width: 1,
                                      ),
                                      image: DecorationImage(
                                          image: NetworkImage(controller
                                                      .profile.value.avatar ==
                                                  null
                                              ? status.imgdefault
                                              : '${status.urlimage + controller.profile.value.avatar}'),
                                          fit: BoxFit.cover),
                                    ),
                                    width: size.width * 0.17,
                                    height: size.height * 0.1,
                                    margin: Constansbox.box.read('lang') == 'en'
                                        ? EdgeInsets.only(
                                            bottom: 0,
                                            left: 17,
                                            top: 10,
                                            right: 8)
                                        : EdgeInsets.only(
                                            bottom: 0,
                                            left: 8,
                                            top: 10,
                                            right: 17),
                                  ),
                            Positioned(
                              top: 9,
                              left: Constansbox.box.read('lang') == 'en'
                                  ? 70
                                  : 50,
                              right: 0,
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  color: AppColors.mainColor,
                                  shape: BoxShape.circle,
                                ),
                                child: Container(
                                  child: Icon(
                                    Icons.edit,
                                    size: 15,
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 28,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: Column(
                  children: [
                    TextFieldProfwidget(
                      controller: controller.firstnameController,
                      validator: validateName,
                      lebel: 'username'.tr,
                    ),
                    Container(
                      height: 50,
                      margin: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.whiteColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 3,
                          ),
                        ],
                      ),
                      child: Obx(() => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                child: Text(
                                  controller.gender.value == ''
                                      ? 'gender'.tr
                                      : controller.gender.value,
                                  style: TextStyle(fontSize: 17),
                                ),
                              ),
                              PopupMenuButton(
                                  icon: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: AppColors.darkgreytextColor
                                        .withOpacity(0.5),
                                    size: 25,
                                  ),
                                  elevation: 1,
                                  itemBuilder: (context) => [
                                        PopupMenuItem(
                                          child: Text("male".tr,
                                              style: size.width >= 600
                                                  ? Styles.defualttab
                                                  : Styles.defualtmobile),
                                          value: 1,
                                          onTap: () {
                                            controller.gender.value = 'Male'.tr;
                                          },
                                        ),
                                        PopupMenuItem(
                                          child: Text("female".tr,
                                              style: size.width >= 600
                                                  ? Styles.defualttab
                                                  : Styles.defualtmobile),
                                          value: 2,
                                          onTap: () {
                                            controller.gender.value =
                                                'Female'.tr;
                                          },
                                        ),
                                      ]),
                            ],
                          )),
                    ),
                    Obx(() => OptionProfile(
                          padd: 0,
                          size: size,
                          txt: controller.date.value == ''
                              ? (controller.profile.value.date == null
                                  ? 'datebirth'.tr
                                  : controller.profile.value.date
                                      .toString()
                                      .substring(0, 10))
                              : controller.date.value,
                          iconarrow: Icon(
                            Icons.arrow_forward_ios_rounded,
                          ),
                          ontap: () {
                            DatePicker.showDatePicker(
                              context,
                              minTime: DateTime(1920, 1, 1),
                              maxTime: DateTime(2018, 12, 30),
                              onConfirm: (time) {
                                controller.date.value =
                                    time.toString().substring(0, 10);
                              },
                            );
                          },
                        )),
                    OptionProfile(
                      padd: 0,
                      size: size,
                      txt: controller.profile.value.phone.toString(),
                      iconarrow: Icon(
                        Icons.arrow_forward_ios_rounded,
                      ),
                      ontap: () {
                        Get.bottomSheet(
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: Defaults.defaultPadding * 3,
                                vertical: Defaults.defaultPadding * 2),
                            height: size.height * 0.3,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.darkgreyColor,
                                  offset: Offset(0, -2),
                                  blurRadius: 5,
                                  spreadRadius: 2,
                                )
                              ],
                            ),
                            child: Form(
                              key: formkey1,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    TextFieldwidget(
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        LengthLimitingTextInputFormatter(14),
                                      ],
                                      txttype: TextInputType.number,
                                      validator: validateMobile,
                                      controller: _phoneController,
                                      lebel: '',
                                      // prefixtxt: '+963',
                                      icon: Get.find<AuthController>()
                                          .showCountryCode(),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: size.width / 4,
                                      ),
                                      child: ButtonWidget2(
                                        size: size,
                                        txt: 'submit'.tr,
                                        onTap: () {
                                          if (formkey1.currentState!.validate())
                                            DialogsUtils.showdialogVirefy(
                                                m: 'enter code');
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(17.0),
                child: TextButton(
                    onPressed: () {
                      Get.bottomSheet(
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: Defaults.defaultPadding * 2.5,
                              vertical: Defaults.defaultPadding / 2),
                          height: size.height * 0.5,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.darkgreyColor,
                                offset: Offset(0, -2),
                                blurRadius: 5,
                                spreadRadius: 2,
                              )
                            ],
                          ),
                          child: SingleChildScrollView(
                            child: Form(
                              key: formkey2,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Obx(() => TextFieldwidget(
                                        txttype: TextInputType.visiblePassword,
                                        validator: validatePass,
                                        controller: _oldpassController,
                                        lebel: 'oldpassword'.tr,
                                        prefixtxt: '',
                                        icon: Icon(
                                          Icons.vpn_key_outlined,
                                          color: AppColors.darkgreytextColor,
                                        ),
                                        ispassword: controller.ispass1.value,
                                        suffixIcon: controller.ispass1.value
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        suffixPressed: () {
                                          controller.ispass1.value =
                                              !controller.ispass1.value;
                                        },
                                      )),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Obx(() => TextFieldwidget(
                                        txttype: TextInputType.visiblePassword,
                                        validator: validatePass,
                                        controller: _newpassController,
                                        lebel: 'newpassword'.tr,
                                        prefixtxt: '',
                                        icon: Icon(
                                          Icons.vpn_key_outlined,
                                          color: AppColors.darkgreytextColor,
                                        ),
                                        ispassword: controller.ispass2.value,
                                        suffixIcon: controller.ispass2.value
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        suffixPressed: () {
                                          controller.ispass2.value =
                                              !controller.ispass2.value;
                                        },
                                      )),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Obx(() => TextFieldwidget(
                                        txttype: TextInputType.visiblePassword,
                                        validator: validatePass,
                                        controller: _confirmPassController,
                                        lebel: 'confirmpassword'.tr,
                                        prefixtxt: '',
                                        icon: Icon(
                                          Icons.vpn_key_outlined,
                                          color: AppColors.darkgreytextColor,
                                        ),
                                        ispassword: controller.ispass3.value,
                                        suffixIcon: controller.ispass3.value
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        suffixPressed: () {
                                          controller.ispass3.value =
                                              !controller.ispass3.value;
                                        },
                                      )),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size.width / 4,
                                        vertical: 25),
                                    child: ButtonWidget2(
                                        size: size,
                                        txt: 'submit'.tr,
                                        onTap: () async {
                                          if (formkey2.currentState!
                                              .validate()) {
                                            if (_newpassController.text !=
                                                _confirmPassController.text) {
                                              BotToast.showText(
                                                text: 'not correct!',
                                                align: Alignment.center,
                                              );
                                            } else {
                                              await Get.find<AuthController>()
                                                  .putPassword(
                                                      _oldpassController.text,
                                                      _newpassController.text);
                                              _newpassController.text = '';
                                              _oldpassController.text = '';
                                              _confirmPassController.text = '';
                                            }
                                          }
                                        }),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('resetpassword'.tr,
                            style: size.width >= 600
                                ? Styles.defualttab
                                : Styles.defualtmobile),
                        SizedBox(
                          width: 8,
                        ),
                        Icon(
                          Icons.security_outlined,
                          color: AppColors.darkgreytextColor,
                        ),
                      ],
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: ButtonWidget2(
                    size: size,
                    txt: 'update'.tr,
                    onTap: () {
                      if (formkey.currentState!.validate()) {
                        controller.patchprofile2();
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? validateMobile(String? value) {
    if (value!.length == 0)
      return 'Please enter PhoneNumber';
    // else if (value.startsWith('0', 0)) {
    //   return 'enter like 9********';
    // }
    else
      return null;
  }

  String? validateName(String? value) {
    if (value!.length == 0)
      return 'Please enter Name';
    else
      return null;
  }

  String? validatePass(String? value) {
    if (value!.length == 0)
      return 'Please enter Password';
    else if (value.length < 6) {
      return 'Password value should contain more than 6 ';
    } else
      return null;
  }
}
