import 'package:flutter/material.dart';
import 'package:share_way_frontend/core/constants/app_icon.dart';
import 'package:share_way_frontend/core/utils/spaces.dart';

enum MessageTypeEnum {
  TEXT,
  IMAGE,
  AUDIOCALL,
  MISSED_CALL,
  VIDEOCALL;

  static MessageTypeEnum fromString(String value) {
    switch (value) {
      case 'text':
        return MessageTypeEnum.TEXT;
      case 'image':
        return MessageTypeEnum.IMAGE;
      case 'voice_call':
        return MessageTypeEnum.AUDIOCALL;
      case 'video_call':
        return MessageTypeEnum.VIDEOCALL;
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
      case MessageTypeEnum.AUDIOCALL:
        return AppIcon.audioCallMessage;
      case MessageTypeEnum.MISSED_CALL:
        return AppIcon.missedAudioCallMessage;
      case MessageTypeEnum.VIDEOCALL:
        return space0;
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
      case MessageTypeEnum.AUDIOCALL:
        return 'Cuộc gọi thoại';
      case MessageTypeEnum.MISSED_CALL:
        return 'Cuộc gọi nhỡ';
      case MessageTypeEnum.VIDEOCALL:
        return 'Cuộc gọi video';
      default:
        return 'Tin nhắn';
    }
  }
}
