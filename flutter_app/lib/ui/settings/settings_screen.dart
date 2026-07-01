import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/database/dao/settings_dao.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String _llmProvider = 'openai';
  String _llmModel = 'gpt-4o';
  final _apiKeyController = TextEditingController();
  bool _isLoading = true;

  final Map<String, List<String>> _modelsByProvider = {
    'openai': ['gpt-4o', 'gpt-4-turbo', 'gpt-3.5-turbo'],
    'gemini': ['gemini-1.5-pro', 'gemini-1.5-flash'],
    'anthropic': ['claude-3-5-sonnet-20240620', 'claude-3-opus-20240229', 'claude-3-haiku-20240307'],
  };

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final settingsDao = context.read<SettingsDao>();
    final provider = await settingsDao.getValue('llm_provider') ?? 'openai';
    final model = await settingsDao.getValue('llm_model') ?? 'gpt-4o';
    final apiKey = await settingsDao.getValue('llm_api_key') ?? '';

    setState(() {
      _llmProvider = provider;
      _llmModel = model;
      _apiKeyController.text = apiKey;
      _isLoading = false;
      
      if (!_modelsByProvider.containsKey(_llmProvider)) {
        _llmProvider = 'openai';
      }
      if (!(_modelsByProvider[_llmProvider]?.contains(_llmModel) ?? false)) {
        _llmModel = _modelsByProvider[_llmProvider]!.first;
      }
    });
  }

  Future<void> _saveSettings() async {
    final settingsDao = context.read<SettingsDao>();
    await settingsDao.setValue('llm_provider', _llmProvider);
    await settingsDao.setValue('llm_model', _llmModel);
    await settingsDao.setValue('llm_api_key', _apiKeyController.text.trim());

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Settings saved successfully')),
      );
    }
  }

  @override
  void dispose() {
    _apiKeyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        appBar: AppBar(title: Text('Settings')),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'LLM Configuration',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              labelText: 'Provider',
              border: OutlineInputBorder(),
            ),
            value: _llmProvider,
            items: const [
              DropdownMenuItem(value: 'openai', child: Text('OpenAI')),
              DropdownMenuItem(value: 'gemini', child: Text('Google Gemini')),
              DropdownMenuItem(value: 'anthropic', child: Text('Anthropic')),
            ],
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  _llmProvider = value;
                  _llmModel = _modelsByProvider[_llmProvider]!.first;
                });
              }
            },
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              labelText: 'Model',
              border: OutlineInputBorder(),
            ),
            value: _llmModel,
            items: _modelsByProvider[_llmProvider]!
                .map((m) => DropdownMenuItem(value: m, child: Text(m)))
                .toList(),
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  _llmModel = value;
                });
              }
            },
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _apiKeyController,
            decoration: const InputDecoration(
              labelText: 'API Key',
              border: OutlineInputBorder(),
            ),
            obscureText: true,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: _saveSettings,
            child: const Text('Save Settings'),
          ),
        ],
      ),
    );
  }
}
