import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobhunt_pro/core/resuables/ui/error_and_loading.dart';
import 'package:jobhunt_pro/features/applicant/features/home/widgets/recent_job_card.dart';

import '../../../../../common/searchbox.dart';
import '../controller/search_controller.dart';

class JobSearch extends ConsumerStatefulWidget {
  const JobSearch({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _JobSearchState();
}

class _JobSearchState extends ConsumerState<JobSearch> {
  final controller = TextEditingController();
  bool isSearching = false;
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              SearchBox(
                showFilterButton: false,
                isHome: false,
                controller: controller,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    setState(() {
                      isSearching = true;
                    });
                  } else {
                    setState(() {
                      isSearching = false;
                    });
                  }
                },
              ),
              const SizedBox(height: 20),
              Expanded(
                  child: !isSearching
                      ? const Center(
                          child: Text('Search Now...'),
                        )
                      : ref.watch(jobSearchProvider(controller.text)).when(
                          data: (result) {
                            return ListView.separated(
                                separatorBuilder: (context, index) =>
                                    const SizedBox(height: 10),
                                itemCount: result.length,
                                itemBuilder: (context, index) {
                                  return RecentJobCard(
                                      imageBackground: Colors.blue,
                                      job: result[index]);
                                });
                          },
                          error: errorWidget,
                          loading: loading))
            ],
          )),
    );
  }
}
