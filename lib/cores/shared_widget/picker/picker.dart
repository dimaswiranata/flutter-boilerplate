import 'package:flutter/material.dart';
import 'package:flutterboilerplate/cores/index.dart';

class OgloPicker extends StatelessWidget {
  const OgloPicker({
    super.key,
    this.title,
    this.data,
    this.onSelect,
  });
  final String? title;
  final List<ItemPicker>? data;
  final void Function(ItemPicker)? onSelect;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.only(bottom: 32),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 55, bottom: 0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: data == null
                    ? []
                    : data!.map((item) {
                        return Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey,
                                width: 0.3,
                              ),
                            ),
                          ),
                          child: ListTile(
                            enableFeedback: true,
                            title: Text(item.title ?? '',
                                style: bodyBody.copyWith(
                                    fontWeight: FontWeight.w300)),
                            onTap: () {
                              Navigator.of(context).pop();
                              onSelect!(item);
                            },
                          ),
                        );
                      }).toList(),
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            padding: const EdgeInsets.all(16),
            width: width,
            child: Text(
              title ?? 'Select Ones',
              style: bodyH4.copyWith(
                  color: AppColors.primaryGrey, fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}
