import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final bool showAppBar;
  final Widget? header;
  final Widget body;
  final Widget? footer;
  final bool isScrollable;

  const CustomScaffold({
    Key? key,
    this.showAppBar = false,
    this.header,
    required this.body,
    this.footer,
    this.isScrollable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar ? AppBar() : null,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            child: SingleChildScrollView(
              physics: isScrollable
                  ? const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              )
                  : const NeverScrollableScrollPhysics(),
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      header ?? const SizedBox.shrink(),
                      Expanded(child: body),
                      footer ?? const SizedBox.shrink(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
