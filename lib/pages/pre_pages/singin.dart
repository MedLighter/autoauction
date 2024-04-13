import 'package:autoauction/pages/pre_pages/singup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SingInPage extends ConsumerStatefulWidget {
  const SingInPage({super.key});

  @override
  ConsumerState<SingInPage> createState() => _SingInPageState();
}

class _SingInPageState extends ConsumerState<SingInPage> {
  MaskedTextController number = MaskedTextController(mask: '+7 000 000-00-00');
  TextEditingController password = TextEditingController();

  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Вход в аккаунт"),
      ),
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 1.5,
          child: Column(
            children: [
              Image.asset("assets/logo.png",
                  width: MediaQuery.of(context).size.width / 3),
              const Text(
                "Car auction",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextField(
                  onTapOutside: (value) async {
                    FocusScope.of(context).unfocus();
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "Номер телефона",
                      hoverColor: Colors.red,
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(100))),
                      contentPadding:
                          EdgeInsets.zero.copyWith(left: 15, right: 15),
                      border: const OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(100)))),
                  controller: number,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 15),
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextField(
                  onTapOutside: (value) async {
                    FocusScope.of(context).unfocus();
                  },
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: passwordVisible,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(
                            () {
                              passwordVisible = !passwordVisible;
                            },
                          );
                        },
                      ),
                      hintText: "Пароль",
                      hoverColor: Colors.red,
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(100))),
                      contentPadding:
                          EdgeInsets.zero.copyWith(left: 15, right: 15),
                      border: const OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(100)))),
                  controller: password,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.red.shade400,
                    borderRadius: const BorderRadius.all(Radius.circular(100))),
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width / 1.3,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (BuildContext context) => const SingUnPage()));
                  },
                  child: const Center(
                      child: Text(
                    "Войти",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
