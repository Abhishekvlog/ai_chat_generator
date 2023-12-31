import 'package:flutter/material.dart';

class SearchTextFieldWidget extends StatelessWidget {
  final TextEditingController? textEditingController;
  final VoidCallback? onTap;

  const SearchTextFieldWidget(
      {super.key, this.textEditingController, this.onTap});

  @override
  Widget build(BuildContext context) {
    return _searchTextField();
  }

  Widget _searchTextField() {
    return Container(
      margin: EdgeInsets.only(bottom: 10, right: 4, left: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(.2),
                        offset: Offset(0.0, 0.50),
                        spreadRadius: 1,
                        blurRadius: 1),
                  ]),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 10),
                      SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          child: ConstrainedBox(
                            constraints: BoxConstraints(maxHeight: 60),
                            child: Scrollbar(
                              child: TextField(
                                style: TextStyle(fontSize: 14),
                                controller: textEditingController,
                                maxLines: null,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Write your Query..",
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 15,)
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          InkWell(
              onTap: textEditingController!.text.isEmpty ? null : onTap,
              child: Container(
                decoration: BoxDecoration(
                    color: textEditingController!.text.isEmpty
                        ? Colors.green.withOpacity(.4)
                        : Colors.green,
                    borderRadius: BorderRadius.circular(40)),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Icon(
                    Icons.send,
                    color: Colors.white,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
