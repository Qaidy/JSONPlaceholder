import 'package:flutter/material.dart';
import 'package:jsonplaceholder/service/api_service.dart';
import 'package:jsonplaceholder/widget/album_widget.dart';
import 'package:jsonplaceholder/widget/async_data_view.dart';

class AlbumsTab extends StatelessWidget {
  final Function(int count)? onCountLoaded;
  const AlbumsTab({super.key, this.onCountLoaded});

  @override
  Widget build(BuildContext context) {
    return AsyncDataView(
      onFetch: () async {
        final albums = await ApiService.fetchAlbums();
        onCountLoaded?.call(albums.length);
        return albums;
      },
      itemBuilder: (context, albums, index) {
        return AlbumWidget(albums: albums);
      },
      title: 'Albums',
    );
  }
}
