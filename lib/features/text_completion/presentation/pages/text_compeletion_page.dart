import 'package:chat_generator/features/global/search_text_field/search_text_field_widget.dart';
import 'package:chat_generator/features/text_completion/presentation/cubit/text_completion_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';

class TextGenerationPage extends StatefulWidget {
  const TextGenerationPage({super.key});

  @override
  State<TextGenerationPage> createState() => _TextGenerationPageState();
}

class _TextGenerationPageState extends State<TextGenerationPage> {
  TextEditingController _searchTextController = TextEditingController();

  @override
  void initState() {
    _searchTextController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Text Completion"),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
                child: BlocBuilder<TextCompletionCubit, TextCompletionState>(
              builder: (context, textCompletionState) {
                if (textCompletionState is TextCompletionLoading) {
                  return Center(
                    child: Container(
                      width: 300,
                      height: 300,
                      child: Image.asset("assets/search .gif",width: 50,height: 60,),
                    ),
                  );
                }
                if (textCompletionState is TextCompletionLoaded) {
                  final choiceData =
                      textCompletionState.textCompletionModelData!.choice;
                  return ListView.builder(
                      itemCount: choiceData.length,
                      itemBuilder: (BuildContext context, int index) {
                        final textData = choiceData[index];
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  textData.text,
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Share.share(textData.text);
                                      },
                                      child: Icon(Icons.share),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Clipboard.setData(
                                            ClipboardData(text: textData.text));
                                      },
                                      child: Icon(Icons.copy),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                )
                              ],
                            ),
                          ),
                        );
                      });
                }
                return const Center(
                  child: Text(
                    "Open AI Console",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                );
              },
            )),
            SearchTextFieldWidget(
                textEditingController: _searchTextController,
                onTap: () {
                  BlocProvider.of<TextCompletionCubit>(context)
                      .textCompletion(query: _searchTextController.text)
                      .then((value) => _clearTextField());
                }),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }

  void _clearTextField() {
    setState(() {
      _searchTextController.clear();
    });
  }
}
