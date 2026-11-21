import 'package:material_ui/material_ui.dart';
import 'package:shopping_list/ui/widgets/widgets.dart';
import 'package:video_player/video_player.dart';

const _promoUrl =
    'https://firebasestorage.googleapis.com/v0/b/whattobuy-e3713.firebasestorage.app/o/syncedlist-promo-vertical.mp4?alt=media&token=fcd4b4bc-3cbc-4b76-bab6-ce2127329d54';

/// The vertical promo video, muted and looping, in a rounded phone-shaped
/// frame. Shows the [AppMark] until the video is ready, or if it fails to load.
class PromoVideo extends StatefulWidget {
  const PromoVideo({super.key});

  @override
  State<PromoVideo> createState() => _PromoVideoState();
}

class _PromoVideoState extends State<PromoVideo> {
  late final VideoPlayerController _controller;
  bool _ready = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(_promoUrl),
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    );
    _init();
  }

  Future<void> _init() async {
    try {
      await _controller.initialize();
      // Browsers only autoplay muted video.
      await _controller.setVolume(0);
      await _controller.setLooping(true);
      if (!mounted) return;
      if (!MediaQuery.of(context).disableAnimations) {
        await _controller.play();
      }
      if (mounted) setState(() => _ready = true);
    } catch (_) {
      // No network or unsupported format: keep the AppMark placeholder.
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return AspectRatio(
      aspectRatio: 9 / 16,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: scheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: scheme.outlineVariant),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(27),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            child: _ready
                ? VideoPlayer(_controller)
                : const Center(child: AppMark()),
          ),
        ),
      ),
    );
  }
}
