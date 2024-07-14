import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatefulWidget {
  final String hint;
  final TextEditingController textController;
  final FocusNode? focusNode;
  final bool Function(String text)? validator;
  final void Function(String text)? onChanged;
  final void Function(String text)? onSubmitted;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatter;
  final void Function()? onTap;

  const CustomTextFormField({
    super.key,
    this.hint = '',
    required this.textController,
    this.focusNode,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.keyboardType,
    this.inputFormatter,
    this.onTap,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {

  @override
  Widget build(BuildContext context) {
    return Column(
      // clipBehavior: Clip.none,
      children: [
        Container(
          height: 67.h,
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: Color(0xFF262425),
          ),
          child: Row(
            children: [
              Expanded(
                child: Center(
                  child: TextFormField(
                    
                    controller: widget.textController,
                    focusNode: widget.focusNode,
                    
                    keyboardType: widget.keyboardType,
                    
                    inputFormatters: widget.inputFormatter,
                    onChanged: (text) {
                      if (widget.onChanged != null) {
                        widget.onChanged!(text);
                      }
                    },
                    onFieldSubmitted: widget.onSubmitted,
                    onTap: widget.onTap,
                    textAlignVertical: TextAlignVertical.center,
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.white,
                    ),
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      floatingLabelStyle: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.white,
                      ),
                      hintStyle: widget.hint.isEmpty
                          ? null
                          : TextStyle(
                              fontSize: 20.sp,
                              color: Colors.white,
                            ),
                     
                      hintText: widget.hint.isEmpty ? null : widget.hint,
                    ),
                  
                    obscuringCharacter: '●',
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
