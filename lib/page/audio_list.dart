import 'package:flutter/material.dart';

import '../handler/audio_meta_handler.dart';
import '../helper/ui.dart';
import '../model/audio_meta.dart';
import '../service/audio_player.dart';
import '../service/data.dart';
import '../widget/audio_list_item.dart';
import '../widget/message_options.dart';
import '../widget/playing_now.dart';
import 'login.dart';

class AudioListPage extends StatefulWidget {
  const AudioListPage({super.key});

  @override
  State<AudioListPage> createState() => _AudioListPageState();
}

class _AudioListPageState extends State<AudioListPage> {
  int? enabledHandlersCount;
  bool loading = false;
  final audiosMetas = <AudioMeta>[];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, updateHandlersCount);
  }

  void updateHandlersCount() async {
    int handlersCount = await AudioMetaHandler.countEnabledHandlers();
    setState(() {
      enabledHandlersCount = handlersCount;
    });
    loadAudiosMetas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AUDIOS TODO'),
        actions: [
          IconButton(
            onPressed: !loading ? navigateLogin : null,
            icon: const Icon(Icons.settings_sharp),
          ),
          IconButton(
            onPressed: !loading ? scanAudiosMetas : null,
            icon: const Icon(Icons.manage_search_sharp),
          ),
          IconButton(
            onPressed: !loading ? loadAudiosMetas : null,
            icon: const Icon(Icons.refresh_sharp),
          ),
        ],
      ),
      body: enabledHandlersCount == null || loading
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : body(),
      bottomNavigationBar: const PlayingNowWidget(),
    );
  }

  Widget body() {
    if (enabledHandlersCount == 0) {
      return MessageOptionsWidget(
        message: 'NO SOURCES TODO',
        options: [
          ListTile(
            title: const Text('LOGIN TODO'),
            trailing: const Icon(Icons.arrow_forward_sharp),
            onTap: navigateLogin,
          ),
        ],
      );
    }
    if (audiosMetas.isEmpty) {
      return MessageOptionsWidget(
        message: 'NO AUDIO YET TODO',
        options: [
          ListTile(
            title: const Text('SCAN TODO'),
            trailing: const Icon(Icons.manage_search_sharp),
            onTap: !loading ? scanAudiosMetas : null,
          ),
          ListTile(
            title: const Text('RELOAD TODO'),
            trailing: const Icon(Icons.refresh_sharp),
            onTap: !loading ? loadAudiosMetas : null,
          ),
          ListTile(
            title: const Text('ADD LOGIN TODO'),
            trailing: const Icon(Icons.arrow_forward_sharp),
            onTap: navigateLogin,
          ),
        ],
      );
    }
    return list();
  }

  Widget list() {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: audiosMetas.length,
      itemBuilder: (context, index) => AudioListItemWidget(
        audioMeta: audiosMetas[index],
        onPlay: onPlay,
      ),
    );
  }

  void onPlay(AudioMeta audioMeta) async {
    try {
      await AudioPlayer.of(context, listen: false).play(
        audiosMetas,
        audiosMetas.indexOf(audioMeta),
      );
    } on AudioSourceNotValidException {
      onPlayError(audioMeta, 'AudioSource NotValid ERROR TODO');
    } on AudioSourceNotAvailableException {
      onPlayError(audioMeta, 'AudioSource NotAvailable ERROR TODO');
    }
  }

  void onPlayError(AudioMeta audioMeta, String message) {
    UiHelper.showAlert(context, message: message);
    AudioPlayer.of(context, listen: false).stop(); // todo: next or stop
    DataService().removeAudioSourceOf(audioMeta);
  }

  void navigateLogin() async {
    await LoginPage.pushRouteTo(context);
    updateHandlersCount();
  }

  void loadAudiosMetas() async {
    if (enabledHandlersCount == 0 || loading) {
      return;
    }
    setState(() {
      loading = true;
    });
    final sources = await DataService().allAudiosMetas();
    audiosMetas.clear();
    audiosMetas.addAll(sources);
    setState(() {
      loading = false;
    });
  }

  void scanAudiosMetas() async {
    if (enabledHandlersCount == 0 || loading) {
      return;
    }
    setState(() {
      loading = true;
    });
    final list = await DataService().scanAudiosMetas();
    audiosMetas.clear();
    audiosMetas.addAll(list);
    setState(() {
      loading = false;
    });
  }
}
