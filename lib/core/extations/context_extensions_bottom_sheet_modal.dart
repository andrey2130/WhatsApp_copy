// lib/shared/extensions/context_extensions_bottom_sheet_modal.dart

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:go_router/go_router.dart';
import 'package:telegram_copy/core/theme/text_style.dart';

extension BottomSheetExtension on BuildContext {
  void showCustomBottomSheet({
    required String title,
    required Widget content,
    double? height,
    Color? backgroundColor,
    bool hideAppBarContent = false,
    Widget? appBarImage,
    bool isControlled = false,
    bool showCloseButton = true,
    bool enableDrag = true,
    bool isDismissible = true,
    bool showBackButton = false,
  }) {
    showModalBottomSheet(
      context: this,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      enableDrag: enableDrag,
      isDismissible: isDismissible,
      builder: (ctx) {
        final media = MediaQuery.of(ctx);
        final inset = media.viewInsets.bottom;
        final availHeight = media.size.height - inset;
        final maxSheet = availHeight * 0.9;
        final sheetHeight = height != null ? min(height, maxSheet) : maxSheet;

        return SafeArea(
          bottom: false,
          child: Padding(
            padding: EdgeInsets.only(bottom: inset),
            child: SizedBox(
              height: sheetHeight,
              width: double.infinity,
              child: _CustomBottomSheetContent(
                initialTitle: title,
                initialContent: content,
                height: sheetHeight,
                backgroundColor: backgroundColor,
                hideAppBarContent: hideAppBarContent,
                appBarImage: appBarImage,
                isControlled: isControlled,
                showCloseButton: showCloseButton,
                showBackButton: showBackButton,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _CustomBottomSheetContent extends StatefulWidget {
  final String initialTitle;
  final Widget initialContent;
  final double height;
  final Color? backgroundColor;
  final bool hideAppBarContent;
  final Widget? appBarImage;
  final bool isControlled;
  final bool showCloseButton;
  final bool showBackButton;

  const _CustomBottomSheetContent({
    required this.initialTitle,
    required this.initialContent,
    required this.height,
    this.backgroundColor,
    this.hideAppBarContent = false,
    this.appBarImage,
    this.isControlled = false,
    this.showCloseButton = true,
    this.showBackButton = false,
  });

  @override
  State<_CustomBottomSheetContent> createState() =>
      _CustomBottomSheetContentState();
}

class _CustomBottomSheetContentState extends State<_CustomBottomSheetContent> {
  late String currentTitle;
  final _pageStack = <Widget>[];
  final _titleStack = <String>[];
  final _heightStack = <double>[];
  final _showClose = <bool>[];
  final _showBack = <bool>[];
  final _bgColors = <Color?>[];

  @override
  void initState() {
    super.initState();
    currentTitle = widget.initialTitle;
    _pageStack.add(widget.initialContent);
    _titleStack.add(widget.initialTitle);
    _heightStack.add(widget.height);
    _showClose.add(widget.showCloseButton);
    _showBack.add(widget.showBackButton);
    _bgColors.add(widget.backgroundColor);
  }

  void pushPage(
    String title,
    Widget content, {
    double? height,
    bool showCloseButton = true,
    bool showBackButton = false,
    Color? backgroundColor,
  }) {
    setState(() {
      _pageStack.add(content);
      _titleStack.add(title);
      _heightStack.add(height ?? _heightStack.last);
      _showClose.add(showCloseButton);
      _showBack.add(showBackButton);
      _bgColors.add(backgroundColor);
      currentTitle = title;
    });
  }

  void popPage() {
    if (_pageStack.length > 1) {
      setState(() {
        _pageStack.removeLast();
        _titleStack.removeLast();
        _heightStack.removeLast();
        _showClose.removeLast();
        _showBack.removeLast();
        _bgColors.removeLast();
        currentTitle = _titleStack.last;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final canGoBack = _showBack.last || _pageStack.length > 1;
    final bgColor = _bgColors.last ?? Colors.white;

    return Container(
      height:
          _heightStack.last +
          (widget.isControlled ? MediaQuery.of(context).viewInsets.bottom : 0),
      width: 1.sw,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      child: Column(
        children: [
          if (!widget.hideAppBarContent)
            Padding(
              padding: EdgeInsets.only(top: 20.h, left: 13.w, right: 13.w),
              child: Row(
                children: [
                  // ← back button (or spacer)
                  if (canGoBack)
                    GestureDetector(
                      onTap: () {
                        if (_pageStack.length > 1) {
                          popPage();
                        } else {
                          context.pop();
                        }
                      },
                      child: Container(
                        width: 40.w,
                        height: 40.h,
                        alignment: Alignment.center,
                        child: const Icon(Icons.arrow_back),
                      ),
                    )
                  else
                    SizedBox(width: 40.w),

                  // Title
                  Expanded(
                    child: Center(
                      child: Text(
                        currentTitle,
                        style: AppTextStyle.getFilterText().copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),

                  // close button (or spacer)
                  if (_showClose.last)
                    GestureDetector(
                      onTap: () => context.pop(),
                      child: Container(
                        width: 40.w,
                        height: 40.h,
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.close,
                          size: 24.sp,
                          color: Colors.black,
                        ),
                      ),
                    )
                  else
                    SizedBox(width: 40.w),
                ],
              ),
            )
          else if (widget.appBarImage != null)
            widget.appBarImage!,

          // CONTENT
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: _pageStack.last,
            ),
          ),
        ],
      ),
    );
  }
}

extension BottomSheetNavigationExtension on BuildContext {
  /// Pushes a new page into the existing bottom sheet
  void pushBottomSheetPage(
    String title,
    Widget content, {
    double? height,
    bool showCloseButton = true,
    bool showBackButton = false,
    Color? backgroundColor,
  }) {
    final state = findAncestorStateOfType<_CustomBottomSheetContentState>()!;
    state.pushPage(
      title,
      content,
      height: height,
      showCloseButton: showCloseButton,
      showBackButton: showBackButton,
      backgroundColor: backgroundColor,
    );
  }

  /// Pops the current page (or closes the sheet if at root)
  void popBottomSheetPage() {
    final state = findAncestorStateOfType<_CustomBottomSheetContentState>()!;
    state.popPage();
  }
}
