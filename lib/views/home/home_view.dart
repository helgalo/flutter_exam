import 'package:flutter/material.dart';
import 'package:flutter_exam/core/app_colors.dart';
import 'package:flutter_exam/stores/home.store.dart';
import 'package:flutter_exam/views/home/widgets/text_data_widget.dart';
import 'package:flutter_exam/widgets/input_textfield_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static HomeStore store = HomeStore()..getData();

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
                                              TextDataWidget(
                                                key: Key("textData$index"),
                                                onTapEditButton: () =>
                                                    store.onTapTextEdit(index),
                                                onTapRemoveButton: () =>
                                                    store.onTapTextRemove(
                                                        store.textList[index]),
                                                textData: store.textList[index],
                                                width:
                                                    columnConstrains.maxWidth -
                                                        120,
                                              ),
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
                      key: const Key("inputField"),
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
}
