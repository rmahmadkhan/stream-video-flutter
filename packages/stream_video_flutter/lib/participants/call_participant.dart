import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:stream_video_flutter/participants/connection_quality_indicator.dart';
import 'package:stream_video_flutter/participants/participant_label.dart';
import 'package:stream_video_flutter/stream_video_flutter.dart';
import 'package:stream_video_flutter/theme/stream_call_participant_theme.dart';

/// Widget that represents a single participant in a call.
class StreamCallParticipant extends StatefulWidget {
  const StreamCallParticipant({
    required this.participant,
    this.theme,
    Key? key,
  }) : super(key: key);

  /// The participant to display.
  final Participant participant;

  /// Theme for the call participant.
  final StreamCallParticipantTheme? theme;

  @override
  State<StatefulWidget> createState() {
    return _StreamCallParticipantState();
  }
}

class _StreamCallParticipantState extends State<StreamCallParticipant> {
  /// The participant to display.
  Participant get participant => widget.participant;

  /// The video track to render.
  VideoTrack? get videoTrack =>
      participant.videoTracks.firstOrNull?.track as VideoTrack?;

  /// Theme for the call participant.
  StreamCallParticipantTheme? get theme => widget.theme;

  @override
  void initState() {
    super.initState();
    participant.events.listen(_onParticipantChanged);
    _onParticipantChanged('');
  }

  @override
  void dispose() {
    participant.events.cancel(_onParticipantChanged);
    super.dispose();
  }

  @override
  void didUpdateWidget(StreamCallParticipant oldWidget) {
    oldWidget.participant.events.cancel(_onParticipantChanged);
    participant.events.listen(_onParticipantChanged);
    _onParticipantChanged('');
    super.didUpdateWidget(oldWidget);
  }

  void _onParticipantChanged(_) => setState(() {});

  @override
  Widget build(BuildContext context) {
    final streamVideoTheme = StreamVideoTheme.of(context);
    final theme = this.theme ?? streamVideoTheme.callParticipantTheme;

    return Container(
      foregroundDecoration: BoxDecoration(
        border: participant.isSpeaking
            ? Border.all(
                width: 4,
                color: theme.focusedColor,
              )
            : null,
      ),
      decoration: BoxDecoration(
        color: theme.backgroundColor,
      ),
      child: Stack(
        children: [
          videoTrack != null && !videoTrack!.muted
              ? StreamVideoRenderer(
                  videoTrack: videoTrack!,
                  videoFit: VideoFit.cover,
                )
              : Center(
                  child: StreamUserAvatar(
                    user: UserInfo(
                      id: participant.userId,
                      role: 'admin',
                      name: participant.userId,
                    ),
                    avatarTheme: theme.avatarTheme,
                  ),
                ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: StreamParticipantLabel(
                    participant: participant,
                    audioLevelIndicatorColor: theme.audioLevelIndicatorColor,
                    disabledMicrophoneColor: theme.disabledMicrophoneColor,
                    enabledMicrophoneColor: theme.enabledMicrophoneColor,
                    participantLabelTextStyle: theme.participantLabelTextStyle,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: StreamConnectionQualityIndicator(
                connectionQuality: participant.connectionQuality,
                activeColor: theme.connectionLevelActiveColor,
                inactiveColor: theme.connectionLevelInactiveColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}