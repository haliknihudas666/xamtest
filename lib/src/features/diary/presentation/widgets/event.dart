import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xamtest/src/features/diary/presentation/providers/diary_provider.dart';

class EventWidget extends ConsumerWidget {
  const EventWidget({super.key});

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
            ListTile(
              trailing: Checkbox(
                value: provider.isAddPhoto,
                onChanged: (value) {
                  provider.toggleAddPhoto();
                },
              ),
              title: Text(
                'Link to existing event?',
                style: Theme.of(context).textTheme.bodyMedium,
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
              child: FormBuilderDropdown<String>(
                name: 'taskCategory',
                onChanged: (value) => provider.event = value,
                decoration: const InputDecoration(hintText: 'Task Category'),
                items: ['Event 1', 'Event 2', 'Event 3']
                    .map(
                      (data) => DropdownMenuItem(
                        value: data,
                        child: Text(data),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
