import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SingUnPage extends ConsumerStatefulWidget {
  const SingUnPage({super.key});

  @override
  ConsumerState<SingUnPage> createState() => _SingUnPageState();
}

class _SingUnPageState extends ConsumerState<SingUnPage> {
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();
  final FocusNode _focusNode4 = FocusNode();
  final ScrollController _scrollController = ScrollController();
  MaskedTextController number = MaskedTextController(mask: '+7 000 000-00-00');
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController repeatPassword = TextEditingController();

  bool passwordVisible = false;
  bool repeatPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    _focusNode1.addListener(() {
      if (_focusNode1.hasFocus) {
        _scrollToWidget(_focusNode1);
      }
    });
    _focusNode2.addListener(() {
      if (_focusNode2.hasFocus) {
        _scrollToWidget(_focusNode2);
      }
    });
    _focusNode3.addListener(() {
      if (_focusNode3.hasFocus) {
        _scrollToWidget(_focusNode3);
      }
    });
    _focusNode4.addListener(() {
      if (_focusNode4.hasFocus) {
        _scrollToWidget(_focusNode4);
      }
    });
  }

  void _scrollToWidget(FocusNode focusNode) {
    _scrollController.animateTo(
      focusNode.offset.dy,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Вход в аккаунт"),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        reverse: true,
        child: Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 1.25,
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
                    focusNode: _focusNode1,
                    onTapOutside: (value) {
                      FocusScope.of(context).unfocus();
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: "Номер телефона",
                        hoverColor: Colors.red,
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius:
                                BorderRadius.all(Radius.circular(100))),
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
                    focusNode: _focusNode2,
                    onTapOutside: (value) async {
                      FocusScope.of(context).unfocus();
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: "Имя, Отчество",
                        hoverColor: Colors.red,
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius:
                                BorderRadius.all(Radius.circular(100))),
                        contentPadding:
                            EdgeInsets.zero.copyWith(left: 15, right: 15),
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)))),
                    controller: name,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 15),
                  width: MediaQuery.of(context).size.width / 1.3,
                  child: TextField(
                    focusNode: _focusNode3,
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
                        hintText: "Придумайте пароль",
                        hoverColor: Colors.red,
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius:
                                BorderRadius.all(Radius.circular(100))),
                        contentPadding:
                            EdgeInsets.zero.copyWith(left: 15, right: 15),
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)))),
                    controller: password,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 15),
                  width: MediaQuery.of(context).size.width / 1.3,
                  child: TextField(
                    focusNode: _focusNode4,
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
                                repeatPasswordVisible = !repeatPasswordVisible;
                              },
                            );
                          },
                        ),
                        hintText: "Повторите пароль",
                        hoverColor: Colors.red,
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius:
                                BorderRadius.all(Radius.circular(100))),
                        contentPadding:
                            EdgeInsets.zero.copyWith(left: 15, right: 15),
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)))),
                    controller: repeatPassword,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.3,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(CupertinoPageRoute(
                          builder: (BuildContext context) =>
                              const SingUnPage()));
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.red.shade400),
                        foregroundColor:
                            const MaterialStatePropertyAll(Colors.white)),
                    child: const Text(
                      "Создать аккаунт",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
