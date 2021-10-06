import 'package:flutter/material.dart';

/// Combine With scroll and persister this widget
class PersistenHeaderDigitalCurrency extends StatelessWidget {
  ///Constructor
  const PersistenHeaderDigitalCurrency({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverPersistentHeader(
      delegate: _MyHeaderTitle(
        'Latest two weeks',
      ),
    );
  }
}

class _MyHeaderTitle extends SliverPersistentHeaderDelegate {
  const _MyHeaderTitle(
    this.title,
  );

  final String title;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => maxHeaderTitleHeight;

  @override
  double get minExtent => maxHeaderTitleHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}

/// Size max for Header
const maxHeaderTitleHeight = 55.0;
