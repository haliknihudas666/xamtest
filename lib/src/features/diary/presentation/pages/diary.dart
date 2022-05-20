import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xamtest/src/features/diary/presentation/providers/diary_provider.dart';
import 'package:xamtest/src/features/diary/presentation/widgets/add_photo.dart';
import 'package:xamtest/src/features/diary/presentation/widgets/comments.dart';
import 'package:xamtest/src/features/diary/presentation/widgets/details.dart';
import 'package:xamtest/src/features/diary/presentation/widgets/event.dart';
import 'package:xamtest/src/models/diary_model.dart';
import 'package:xamtest/src/services/submit.dart';

class DiaryPage extends ConsumerWidget {
  const DiaryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(diaryProvider);
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.close,
            color: Colors.white,
          ),
        ),
        title: Text(
          'New Diary',
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            ListTile(
              tileColor: Theme.of(context).scaffoldBackgroundColor,
              leading: const Icon(Icons.location_pin),
              title: Text(
                '20041075 | TAP-NS TAP-North Strathfield',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Column(
              children: [
                ListTile(
                  trailing: const Icon(Icons.help),
                  title: Text(
                    'Add to site diary',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                const AddPhotoWidget(),
                const CommentsWidget(),
                const DetailsWidget(),
                const EventWidget(),
                Padding(
                  padding: const EdgeInsets.all(18),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        final images = <String>[];
                        for (final element in provider.image) {
                          final image =
                              await FlutterImageCompress.compressWithFile(
                            element.path,
                            quality: 1,
                            format: CompressFormat.webp,
                          );

                          if (image != null) {
                            images.add(
                              'data:image/webp;base64,${base64Encode(image)}',
                            );
                          }
                        }

                        final model = DiaryModel(
                          comment: provider.comment ?? '',
                          area: provider.area ?? '',
                          date: provider.dateTime != null
                              ? provider.dateTime!.toIso8601String()
                              : '',
                          category: provider.category ?? '',
                          tags: provider.tags ?? '',
                          eventName: provider.event ?? '',
                          isLink: provider.isLink,
                          isAddToDiary: provider.isAddPhoto,
                          photos: images,
                        );

                        final response = await SubmitAPI.submit(
                          model,
                        );

                        if (response.error == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(response.message ?? ''),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(response.error ?? 'Error'),
                            ),
                          );
                        }
                      },
                      child: Text(
                        'Next',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
