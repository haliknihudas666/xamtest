import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:images_picker/images_picker.dart';
import 'package:xamtest/src/features/diary/presentation/providers/diary_provider.dart';
import 'package:xamtest/src/widgets/spacer.dart';

class AddPhotoWidget extends ConsumerWidget {
  const AddPhotoWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(diaryProvider);
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 18,
              horizontal: 8,
            ),
            child: Text(
              'Add to site diary',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 8,
            ),
            child: Divider(thickness: 1),
          ),
          Container(
            height: 200,
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            child: ListView.separated(
              padding: const EdgeInsets.all(18),
              separatorBuilder: (context, index) =>
                  const SpacerWidget.horizontal16(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: provider.image.length,
              itemBuilder: (context, index) {
                return Center(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Image(
                        height: 160,
                        image:
                            Image.file(File(provider.image[index].path)).image,
                      ),
                      Positioned(
                        right: -25,
                        top: -25,
                        child: IconButton(
                          onPressed: () {
                            provider.deleteImage(provider.image[index]);
                          },
                          icon: const Icon(
                            Icons.cancel,
                            size: 30,
                            color: Colors.red,
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  final getImage = await ImagesPicker.pick(
                    gif: false,
                    maxSize: 1,
                    count: 3,
                    quality: 0.01,
                  );

                  if (getImage != null) {
                    for (final element in getImage) {
                      provider.addImage(element);
                    }
                  }
                },
                child: Text(
                  'Add a photo',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
          ListTile(
            trailing: Checkbox(
              value: provider.isAddPhoto,
              onChanged: (value) {
                provider.toggleAddPhoto();
              },
            ),
            title: Text(
              'Add Photos to site diary',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
