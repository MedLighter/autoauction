import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SingInPage extends ConsumerStatefulWidget {
  const SingInPage({super.key});

  @override
  ConsumerState<SingInPage> createState() => _SingInPageState();
}

class _SingInPageState extends ConsumerState<SingInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
