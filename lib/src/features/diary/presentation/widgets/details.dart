import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xamtest/src/features/diary/presentation/providers/diary_provider.dart';

class DetailsWidget extends ConsumerWidget {
  const DetailsWidget({super.key});

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
                'Details',
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
              child: FormBuilderDateTimePicker(
                name: 'date',
                onChanged: (value) => provider.dateTime = value,
                decoration: const InputDecoration(hintText: 'Pick Date'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
                right: 8,
                bottom: 24,
              ),
              child: FormBuilderDropdown<String>(
                name: 'area',
                onChanged: (value) => provider.area = value,
                decoration: const InputDecoration(hintText: 'Select Area'),
                items: ['Ballarat', 'Melbourne', 'Sydney', 'Manila']
                    .map(
                      (data) => DropdownMenuItem(
                        value: data,
                        child: Text(data),
                      ),
                    )
                    .toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
                right: 8,
                bottom: 24,
              ),
              child: FormBuilderDropdown<String>(
                name: 'category',
                onChanged: (value) => provider.category = value,
                decoration: const InputDecoration(hintText: 'Task Category'),
                items: ['Hiking', 'Swimming', 'Farming']
                    .map(
                      (data) => DropdownMenuItem(
                        value: data,
                        child: Text(data),
                      ),
                    )
                    .toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
                right: 8,
                bottom: 24,
              ),
              child: FormBuilderTextField(
                name: 'tags',
                onChanged: (value) => provider.tags = value,
                decoration: const InputDecoration(hintText: 'Tags'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
