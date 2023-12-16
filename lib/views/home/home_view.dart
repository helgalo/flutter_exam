import 'package:flutter/material.dart';
import 'package:flutter_exam/core/app_colors.dart';
import 'package:flutter_exam/stores/home.store.dart';
import 'package:flutter_exam/views/login/widgets/basic_button.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static HomeStore store = HomeStore()..getAllData();

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    FocusNode focusNode = FocusNode();
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
                      color: AppColors.white,
                      height: columnConstrains.maxHeight - 90,
                      child: GestureDetector(
                        child: SingleChildScrollView(
                          child: Observer(
                            builder: (_) => Column(
                              children: List.generate(
                                HomeView.store.textList.length,
                                (index) {
                                  TextEditingController controller =
                                      TextEditingController(
                                    text: HomeView.store.textList[index],
                                  );

                                  FocusNode localNode = FocusNode();

                                  bool isEditing = false;
                                  bool isEnabled = true;

                                  return Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12),
                                        child: SizedBox(
                                          width: 200,
                                          child: TextField(
                                            enabled: isEnabled,
                                            autofocus: true,
                                            focusNode: isEditing ||
                                                    index ==
                                                        HomeView.store.textList
                                                                .length -
                                                            1
                                                ? focusNode
                                                : localNode,
                                            textAlign: TextAlign.center,
                                            onSubmitted: (text) {
                                              HomeView.store.saveAllData();
                                              HomeView.store.textList[index] =
                                                  text;
                                              setState(() {
                                                isEnabled = false;
                                                isEditing = false;
                                              });
                                            },
                                            controller: controller,
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            localNode.unfocus();
                                            localNode.requestFocus();
                                          });
                                        },
                                        icon: Icon(Icons.edit),
                                      )
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Focus(
                      child: BasicButtonWidget(
                        width: double.infinity,
                        title: 'Digite seu texto',
                        borderRadius: 4,
                        textStyle: const TextStyle(
                          fontSize: 14,
                          color: AppColors.black,
                          fontWeight: FontWeight.w500,
                        ),
                        onTap: () => {
                          if (HomeView.store.textList.isNotEmpty &&
                              HomeView.store.textList.last == '')
                            {
                              focusNode.requestFocus(),
                            }
                          else
                            HomeView.store.addText(""),
                        },
                      ),
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
