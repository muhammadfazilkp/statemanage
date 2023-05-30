import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/constrain.dart';
import 'package:netflix/presentation/search/function/search_function.dart';
import 'package:netflix/presentation/search/widget/screenidle.dart';
import 'package:netflix/presentation/search/widget/search_result.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            CupertinoSearchTextField(
              onChanged: (value) {
                SearchFunction.searchResult(value);
              },
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              suffixIcon: const Icon(
                Icons.cancel,
                color: Colors.grey,
              ),
              style: const TextStyle(color: Colors.white),
              backgroundColor: Colors.grey.withOpacity(0.4),
            ),
            kheight,
            Expanded(
                child: ValueListenableBuilder(
              valueListenable: SearchFunction.searchData,
              builder: (context, value, child) {
                return value.isEmpty
                    ? const ScreenSearchIdle()
                    : const SearchResultWidget();
              },
            )),
          ],
        ),
      )),
    );
  }
}
