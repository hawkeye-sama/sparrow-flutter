import 'package:flutter/material.dart';
import 'package:sparrow/core/theme/mixins.dart';

class SneakerAppBar extends StatefulWidget implements PreferredSizeWidget {
  const SneakerAppBar({
    super.key,
    this.title,
    this.subtitle,
    this.actions,
    this.subactions,
    this.elevation = 0,
    this.backgroundColor,
    this.foregroundColor,
    this.centerTitle = false,
    this.height = 70,
    this.isShowSearch = false,
    this.onSearchClose,
    this.onSearchChanged,
  });

  final String? title;
  final String? subtitle;
  final List<Widget>? actions;
  final List<Widget>? subactions;
  final double elevation;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final bool centerTitle;
  final double height;
  final bool isShowSearch;
  final void Function()? onSearchClose;
  final void Function(String value)? onSearchChanged;

  @override
  State<SneakerAppBar> createState() => _SneakerAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class _SneakerAppBarState extends State<SneakerAppBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  bool _isSearchVisible = false;

  Size get preferredSize => Size.fromHeight(widget.height);

  bool get _showFlexibleSpace =>
      widget.subtitle != null || widget.subactions != null;

  @override
  void initState() {
    super.initState();

    _isSearchVisible = widget.isShowSearch;

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant SneakerAppBar oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isShowSearch != oldWidget.isShowSearch) {
      if (widget.isShowSearch) {
        _controller.forward();
        setState(() {
          _isSearchVisible = true;
        });
      } else {
        _controller.reverse();
        setState(() {
          _isSearchVisible = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isSearchVisible ? _buildSearchAppBar() : _buildRegularAppBar();
  }

  Widget _buildSearchAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: FadeTransition(
          opacity: _animation,
          child: Container(
            height: 40.0,
            decoration: const BoxDecoration(
              borderRadius: Mixins.radius,
              color: Colors.white,
            ),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Search...',
                hintStyle: const TextStyle(fontSize: 16),
                border: InputBorder.none,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    _controller.reverse();
                    setState(() {
                      _isSearchVisible = false;
                    });
                    widget.onSearchClose?.call();
                  },
                ),
              ),
              autofocus: true,
              style: const TextStyle(fontSize: 16),
              onChanged: (value) => widget.onSearchChanged?.call(value),
              onEditingComplete: () {
                _controller.reverse();
                setState(() {
                  _isSearchVisible = false;
                });
                widget.onSearchClose?.call();
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRegularAppBar() {
    return AppBar(
      toolbarHeight: widget.height,
      foregroundColor: widget.foregroundColor,
      leading: ModalRoute.of(context)?.impliesAppBarDismissal ?? false
          ? Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              alignment: Alignment.topCenter,
              child: IconButton(
                icon: const Icon(Icons.keyboard_backspace),
                onPressed: () => Navigator.pop(context),
              ),
            )
          : null,
      title: widget.title != null
          ? Text(
              widget.title!,
              style: Theme.of(context).appBarTheme.titleTextStyle?.copyWith(
                    fontSize: 24,
                    color: widget.foregroundColor,
                  ),
            )
          : null,
      centerTitle: widget.centerTitle,
      elevation: widget.elevation,
      backgroundColor: widget.backgroundColor,
      actions: widget.actions,
      flexibleSpace: _showFlexibleSpace
          ? SafeArea(
              child: Container(
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: widget.subtitle != null
                          ? Text(
                              widget.subtitle!,
                              style:
                                  Theme.of(context).appBarTheme.titleTextStyle,
                            )
                          : const SizedBox.shrink(),
                    ),
                    if (widget.subactions != null)
                      Row(children: widget.subactions!),
                  ],
                ),
              ),
            )
          : null,
    );
  }
}
