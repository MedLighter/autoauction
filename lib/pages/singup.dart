import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SingUnPage extends ConsumerStatefulWidget {
  const SingUnPage({super.key});

  @override
  ConsumerState<SingUnPage> createState() => _SingUnPageState();
}

class _SingUnPageState extends ConsumerState<SingUnPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
