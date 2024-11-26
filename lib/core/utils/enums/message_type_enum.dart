import 'package:flutter/material.dart';
import 'package:share_way_frontend/core/constants/app_icon.dart';
import 'package:share_way_frontend/core/utils/spaces.dart';

enum MessageTypeEnum {
  TEXT,
  IMAGE,
  CALL,
  MISSED_CALL;

  String getString() {
    switch (this) {
      case MessageTypeEnum.TEXT:
        return 'text';
      case MessageTypeEnum.IMAGE:
        return 'image';
      case MessageTypeEnum.CALL:
        return 'call';
      case MessageTypeEnum.MISSED_CALL:
        return 'missed_call';
      default:
        return 'text';
    }
  }

  static MessageTypeEnum fromString(String value) {
    switch (value) {
      case 'text':
        return MessageTypeEnum.TEXT;
      case 'image':
        return MessageTypeEnum.IMAGE;
      case 'call':
        return MessageTypeEnum.CALL;
      case 'missed_call':
        return MessageTypeEnum.MISSED_CALL;
      default:
        return MessageTypeEnum.TEXT;
    }
  }

  Widget getIcon() {
    switch (this) {
      case MessageTypeEnum.TEXT:
        return space0;
      case MessageTypeEnum.IMAGE:
        return space0;
      case MessageTypeEnum.CALL:
        return AppIcon.audioCallMessage;
      case MessageTypeEnum.MISSED_CALL:
        return AppIcon.missedAudioCallMessage;
      default:
        return space0;
    }
  }

  String getMessageTitle() {
    switch (this) {
      case MessageTypeEnum.TEXT:
        return 'Tin nhắn';
      case MessageTypeEnum.IMAGE:
        return 'Hình ảnh';
      case MessageTypeEnum.CALL:
        return 'Cuộc gọi thoại';
      case MessageTypeEnum.MISSED_CALL:
        return 'Cuộc gọi nhỡ';
      default:
        return 'Tin nhắn';
    }
  }
}
