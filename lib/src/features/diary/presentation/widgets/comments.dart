import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xamtest/src/features/diary/presentation/providers/diary_provider.dart';

class CommentsWidget extends ConsumerWidget {
  const CommentsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(diaryProvider);
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(18),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 18,
                horizontal: 8,
              ),
              child: Text(
                'Comments',
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
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
                right: 8,
                bottom: 24,
              ),
              child: FormBuilderTextField(
                name: 'comments',
                onChanged: (value) => provider.comment = value,
                decoration: const InputDecoration(hintText: 'Comments'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
