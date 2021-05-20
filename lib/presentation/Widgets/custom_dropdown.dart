import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_text.dart';

// class CustomDropDown extends StatelessWidget {
//   final String title;
//   final List<String> options;
//   final Function(String) onSelect;
//   const CustomDropDown(this.title, this.options, this.onSelect) ;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//       Container(
//         decoration: BoxDecoration(
//             color: Colors.green.shade100,
//             borderRadius: BorderRadius.circular(5)),
//         padding: EdgeInsets.symmetric(horizontal: 10.w),
//         child: DropdownButton<String>(
//           hint: CustomText(
//             selectedShop == null ? "Not selected" : selectedShop.name,
//           ),
//           // style: Theme.of(context).primaryTextTheme.caption,
//           underline: const SizedBox.shrink(),
//           icon:
//               const Icon(Icons.arrow_drop_down, color: AppColors.colorBlueDark),
//           items: shopList.shops.map((ShopData value) {
//             return DropdownMenuItem(
//               value: value,
//               child: Row(
//                 children: <Widget>[
//                   Text(
//                     value.name,
//                     style: Style.languageStyle,
//                   ),
//                   Icon(
//                     Icons.arrow_drop_down,
//                     size: 25.h,
//                     color: AppColors.colorBlack,
//                   )
//                 ],
//               ),
//             );
//           }).toList(),
//           onChanged: (value) {
//             Get.find<MerchantController>().loadPosList(shop: value);
//             Logger().d("language selected is: $value");
//           },
//         )),
//       ],
//     );
//   }
// }

class CustomDropDown extends StatefulWidget {
  final String title;
  final List<String> options;
  final Function(String) onSelect;
  const CustomDropDown(this.title, this.options, this.onSelect);
  @override
  _CustomDropDown createState() => _CustomDropDown();
}

class _CustomDropDown extends State<CustomDropDown> {
  String selectedText = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomText(
            "${widget.title}: ",
            textType: TextType.headLine5,
          ),
          SizedBox(
            width: 10.w,
          ),
          Container(
              decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(5)),
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: DropdownButton<String>(
                hint: CustomText(
                  selectedText,
                ),
                // style: Theme.of(context).primaryTextTheme.caption,
                underline: const SizedBox.shrink(),
                icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
                items: widget.options.map((String value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Row(
                      children: <Widget>[
                        CustomText(
                          value,
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          size: 25.h,
                          color: Colors.black,
                        )
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedText = value!;
                  });
                  widget.onSelect(value!);
                },
              )),
        ],
      ),
    );
  }
}
