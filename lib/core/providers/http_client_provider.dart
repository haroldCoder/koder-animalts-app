import 'package:koder_animalts_app/core/network/http_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'http_client_provider.g.dart';

@riverpod
HttpClient httpClient(Ref ref) => HttpClient();
