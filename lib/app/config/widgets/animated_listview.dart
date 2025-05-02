import 'package:flutter/cupertino.dart';

class CustomAnimatedListView extends StatefulWidget {
  final List<Widget> children;

  const CustomAnimatedListView({
    super.key,
    required this.children,
  });

  @override
  State<CustomAnimatedListView> createState() => _CustomAnimatedListViewState();
}

class _CustomAnimatedListViewState extends State<CustomAnimatedListView> {
  bool startAnimation = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        startAnimation = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsetsDirectional.only(
        start: 20,
        end: 20,
        bottom: 60,
      ),
      children: widget.children,
    );
  }
}
