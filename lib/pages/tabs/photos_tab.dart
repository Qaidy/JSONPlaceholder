import 'package:flutter/material.dart';
import 'package:jsonplaceholder/service/api_service.dart';
import 'package:jsonplaceholder/widget/async_data_view.dart';
import 'package:jsonplaceholder/widget/photo_widget.dart';

class PhotosTab extends StatelessWidget {
  final Function(int count)? onCountLoaded;
  const PhotosTab({super.key, this.onCountLoaded});

  @override
  Widget build(BuildContext context) {
    return AsyncDataView(
      onFetch: () async {
        final photos = await ApiService.fetchPhotos();
        onCountLoaded?.call(photos.length);
        return photos;
      },
      itemBuilder: (context, photos, index) {
        return PhotoWidget(photos: photos);
      },
      title: 'Photos',
    );
  }
}
