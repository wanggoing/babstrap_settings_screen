import 'package:babstrap_settings_screen/src/icon_style.dart';
import 'package:babstrap_settings_screen/src/settings_screen_utils.dart';
import 'package:flutter/material.dart';

class SettingsItem extends StatelessWidget {
  final IconData icons;
  final IconStyle? iconStyle;
  final String title;
  final TextStyle? titleStyle;
  final String? subtitle;
  final TextStyle? subtitleStyle;
  final Widget? trailing;
  final VoidCallback? onTap;
  final int? titleMaxLine;
  final int? subtitleMaxLine;
  final TextOverflow? overflow;

  SettingsItem({
    required this.icons,
    this.iconStyle,
    required this.title,
    this.titleStyle,
    this.subtitle,
    this.subtitleStyle,
    this.trailing,
    this.onTap,
    this.titleMaxLine,
    this.subtitleMaxLine,
    this.overflow = TextOverflow.ellipsis,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Leading Icon
            (iconStyle != null && iconStyle!.withBackground!)
                ? Container(
              decoration: BoxDecoration(
                color: iconStyle!.backgroundColor,
                borderRadius:
                BorderRadius.circular(iconStyle!.borderRadius!),
              ),
              padding: EdgeInsets.all(5),
              child: Icon(
                icons,
                size: SettingsScreenUtils.settingsGroupIconSize,
                color: iconStyle!.iconsColor,
              ),
            )
                : Padding(
              padding: EdgeInsets.all(5),
              child: Icon(
                icons,
                size: SettingsScreenUtils.settingsGroupIconSize,
              ),
            ),
            SizedBox(width: 12),

            // Title & Subtitle
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: titleStyle ??
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    maxLines: titleMaxLine,
                    overflow: titleMaxLine != null ? overflow : null,
                  ),
                  if (subtitle != null)
                    SizedBox(height: 4),
                  if (subtitle != null)
                    Text(
                      subtitle!,
                      style: subtitleStyle ??
                          Theme.of(context).textTheme.bodyMedium,
                      maxLines: subtitleMaxLine,
                      overflow: subtitleMaxLine != null ? overflow : null,
                    ),
                ],
              ),
            ),

            // Trailing Icon
            if (trailing != null)
              Padding(
                padding: EdgeInsets.only(left: 8),
                child: trailing!,
              )
            else
              Padding(
                padding: EdgeInsets.only(left: 8),
                child: Icon(Icons.navigate_next),
              ),
          ],
        ),
      ),
    );
  }
}