import 'package:chat_generator/features/app/app_conts/page_const.dart';
import 'package:chat_generator/features/text_completion/presentation/widgets/home_button_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:Image.asset("assets/app_logo.png"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: HomeButtonWidget(textData: "Text generator - OpenAI",iconData: Icons.text_fields_outlined,
              onTap:(){
            Navigator.pushNamed(context, PageConst.textGenerationPage);
              }
          ),
        ),
      ),
    );
  }
}
