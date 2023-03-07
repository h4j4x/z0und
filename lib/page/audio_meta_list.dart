import 'package:flutter/material.dart';

import '../handler/audio_meta_handler.dart';
import '../model/audio_meta.dart';
import '../service/data.dart';
import '../widget/message_options.dart';
import 'login.dart';

class AudioMetaListPage extends StatefulWidget {
  const AudioMetaListPage({super.key});

  @override
  State<AudioMetaListPage> createState() => _AudioMetaListPageState();
}

class _AudioMetaListPageState extends State<AudioMetaListPage> {
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
            onPressed: !loading ? updateHandlersCount : null,
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

  Widget list() => ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: audiosMetas.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(audiosMetas[index].name),
          subtitle: Text(audiosMetas[index].handlerId),
        ),
      );

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
    final sources = await DataService().scanAudiosMetas();
    audiosMetas.clear();
    audiosMetas.addAll(sources);
    setState(() {
      loading = false;
    });
  }
}
