import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatefulWidget {
  final String hint;
  final String label;
  final bool isPassword;
  final TextEditingController textController;
  final FocusNode? focusNode;
  final bool Function(String text)? validator;
  final bool isEnabled;
  final void Function(String text)? onChanged;
  final void Function(String text)? onSubmitted;
  final bool? isValid;
  final String? errorText;
  final TextInputType? keyboardType;
  final Iterable<String>? autofillHints;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter>? inputFormatter;
  final void Function()? onTap;
  final String? tailingIcon;
  final Color borderColor;
  final Color? tailingFillColor;
  final bool isBorder;
  final bool isErrorBorder;

  const CustomTextFormField({
    super.key,
    this.isPassword = false,
    this.hint = '',
    this.label = '',
    required this.textController,
    this.focusNode,
    this.validator,
    this.isEnabled = true,
    this.onChanged,
    this.onSubmitted,
    this.isValid,
    this.errorText,
    this.keyboardType,
    this.autofillHints,
    this.textInputAction = TextInputAction.done,
    this.textCapitalization = TextCapitalization.none,
    this.inputFormatter,
    this.onTap,
    this.tailingIcon,
    this.borderColor = Colors.white,
    this.tailingFillColor,
    this.isBorder = true,
    this.isErrorBorder = true,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isHidden = true;
  bool isValid = false;

  @override
  void initState() {
    if (widget.isValid != null) {
      isValid = widget.isValid!;
    }
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CustomTextFormField oldWidget) {
    if (widget.isValid != oldWidget.isValid) {
      isValid = widget.isValid!;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      // clipBehavior: Clip.none,
      children: [
        Container(
          height: 67.h,
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.isBorder ? 10.r : 0),
            border: Border.all(
              width: 1.w,
              color: widget.errorText == null ? widget.borderColor : Colors.red,
            ),
            color: const Color(0xFF262425),
          ),
          child: Row(
            children: [
              Expanded(
                child: Center(
                  child: TextFormField(
                    enabled: widget.isEnabled,
                    controller: widget.textController,
                    focusNode: widget.focusNode,
                    textCapitalization: widget.textCapitalization,
                    keyboardType: widget.keyboardType,
                    autofillHints: widget.autofillHints,
                    textInputAction: widget.textInputAction,
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
                      hintStyle:  widget.hint.isEmpty ? null : TextStyle(
                      
                        fontSize: 20.sp,
                        color: Colors.white,
                      ),
                      labelText: widget.label.isEmpty ? null : widget.label,
                      hintText: widget.hint.isEmpty ? null : widget.hint,
                    ),
                    obscureText: widget.isPassword ? isHidden : false,
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
