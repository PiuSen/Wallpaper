import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../data/remote.dart';
import '../model/photosmodel.dart';

class WallpaperList extends StatefulWidget {
  const WallpaperList({super.key,required this.url});
  final String url;
  @override
  State<WallpaperList> createState() => _WallpaperListState();
}

class _WallpaperListState extends State<WallpaperList> {
  static const _pageSize = 20;
  final PagingController<int, PhotosModel> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newList = await Remote.curatedImagese(pageKey,widget.url);
      final isLastPage = newList.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newList);
      } else {
        final nextPageKey = pageKey + newList.length;
        _pagingController.appendPage(newList, nextPageKey);
      }
    } catch (e) {
      _pagingController.error(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PagedGridView<int, PhotosModel>(
      pagingController: _pagingController,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 6.0,
        childAspectRatio: 0.6,
        mainAxisSpacing: 6.0,
      ),
      physics: ClampingScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      builderDelegate: PagedChildBuilderDelegate<PhotosModel>(
          itemBuilder: (BuildContext context, PhotosModel item, int index) {
        return Hero(
          tag: item.src.portrait,
          child: Container(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  item.src.portrait,
                  fit: BoxFit.cover,
                )),
          ),
        );
      }),
    );
  }
}
