import 'dart:math';

import 'package:flutter/material.dart';
import 'package:just_waveform/just_waveform.dart';

import '../use_case/audio_waver.dart';

class AudioWaveWidget extends StatelessWidget {
  final AudioWaver audioWaver;
  final Duration position;

  const AudioWaveWidget({
    super.key,
    required this.audioWaver,
    required this.position,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: StreamBuilder(
        stream: audioWaver.waveStream,
        builder: (context, AsyncSnapshot<Object> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          // todo: handle error
          if (snapshot.data is WaveformProgress) {
            final WaveformProgress data = snapshot.data as WaveformProgress;
            if (data.waveform == null) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
            return LayoutBuilder(builder: (context, constraints) {
              return SizedBox(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                child: _JustWaveformWidget(
                  data: data.waveform!,
                  position: position,
                ),
              );
            });
          }
          return Container();
        },
      ),
    );
  }
}

class _JustWaveformWidget extends StatelessWidget {
  final Waveform data;
  final Duration position;

  const _JustWaveformWidget({
    required this.data,
    required this.position,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: CustomPaint(
        painter: _WaveformPainter(
          waveform: data,
          start: position,
          duration: data.duration,
          waveColor: Theme.of(context).colorScheme.primary,
          scale: 0.8,
          strokeWidth: 8.0,
          pixelsPerStep: 12.0,
        ),
      ),
    );
  }
}

class _WaveformPainter extends CustomPainter {
  final double scale;
  final double strokeWidth;
  final double pixelsPerStep;
  final Paint wavePaint;
  final Waveform waveform;
  final Duration start;
  final Duration duration;

  _WaveformPainter({
    required this.waveform,
    required this.start,
    required this.duration,
    required Color waveColor,
    this.scale = 1.0,
    this.strokeWidth = 5.0,
    this.pixelsPerStep = 8.0,
  }) : wavePaint = Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeWidth
          ..strokeCap = StrokeCap.square
          ..color = waveColor;

  @override
  void paint(Canvas canvas, Size size) {
    if (duration == Duration.zero) {
      return;
    }

    final waveformPixelsPerWindow = waveform.positionToPixel(duration).toInt();
    final waveformPixelsPerDevicePixel = waveformPixelsPerWindow / size.width;
    final waveformPixelsPerStep = waveformPixelsPerDevicePixel * pixelsPerStep;
    final sampleOffset = waveform.positionToPixel(start);
    final sampleStart = -sampleOffset % waveformPixelsPerStep;
    for (var i = sampleStart.toDouble();
        i <= waveformPixelsPerWindow + 1.0;
        i += waveformPixelsPerStep) {
      final sampleIdx = (sampleOffset + i).toInt();
      final x = i / waveformPixelsPerDevicePixel;
      final minY = normalise(waveform.getPixelMin(sampleIdx), size.height);
      final maxY = normalise(waveform.getPixelMax(sampleIdx), size.height);
      canvas.drawLine(
        Offset(x + strokeWidth / 2, max(strokeWidth * 0.75, minY)),
        Offset(
            x + strokeWidth / 2, min(size.height - strokeWidth * 0.75, maxY)),
        wavePaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _WaveformPainter oldDelegate) => false;

  double normalise(int s, double height) {
    if (waveform.flags == 0) {
      final y = 32768 + (scale * s).clamp(-32768.0, 32767.0).toDouble();
      return height - 1 - y * height / 65536;
    }
    final y = 128 + (scale * s).clamp(-128.0, 127.0).toDouble();
    return height - 1 - y * height / 256;
  }
}
