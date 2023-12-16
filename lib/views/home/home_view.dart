import 'package:flutter/material.dart';
import 'package:flutter_exam/core/app_colors.dart';
import 'package:flutter_exam/stores/home.store.dart';
import 'package:flutter_exam/widgets/input_textfield.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static HomeStore store = HomeStore()..getAllData();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: LayoutBuilder(
        builder: (context, columnConstrains) => SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(minHeight: columnConstrains.maxHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const SizedBox(height: 24),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(4)),
                      height: columnConstrains.maxHeight - 90,
                      child: GestureDetector(
                        child: Observer(
                          builder: (_) => SingleChildScrollView(
                            child: store.textList.isEmpty
                                ? SizedBox(
                                    width: columnConstrains.maxWidth,
                                  )
                                : Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: List.generate(
                                      store.textList.length,
                                      (index) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12),
                                          child: Column(
                                            children: [
                                              textTile(columnConstrains, index),
                                              const Divider(
                                                height: 1,
                                                color: AppColors.black,
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    InputTextField(
                      focusNode: store.focusNode,
                      width: double.infinity,
                      hintText: "Digite seu texto",
                      onSubmitted: store.addText,
                      controller: store.textController,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget textTile(columnConstrains, index) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 48,
            width: columnConstrains.maxWidth - 120,
            child: Center(
              child: Text(
                store.textList[index],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 24,
                height: 24,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => store.onTapEditButton(index),
                  icon: const Icon(
                    Icons.edit,
                  ),
                ),
              ),
              SizedBox(
                width: 24,
                height: 24,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => store.removeText(store.textList[index]),
                  icon: const Icon(
                    Icons.delete_forever_rounded,
                    color: AppColors.error,
                  ),
                ),
              ),
            ],
          ),
        ],
      );
}
