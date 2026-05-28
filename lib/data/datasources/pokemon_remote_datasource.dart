// lib/data/datasources/pokemon_remote_datasource.dart

import 'package:dio/dio.dart';
import '../models/pokemon_model.dart';
import '../../core/constants/app_constants.dart';

abstract class PokemonRemoteDataSource {
  Future<PokemonListResponseModel> getPokemonList({
    required int offset,
    int limit = AppConstants.pageSize,
  });

  Future<PokemonDetailModel> getPokemonDetail(String nameOrId);

  Future<List<PokemonListItemModel>> searchPokemonByType(String type);
}

class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  final Dio _dio;
  const PokemonRemoteDataSourceImpl(this._dio);

  @override
  Future<PokemonListResponseModel> getPokemonList({
    required int offset,
    int limit = AppConstants.pageSize,
  }) async {
    final response = await _dio.get(
      '/pokemon',
      queryParameters: {'limit': limit, 'offset': offset},
    );
    return PokemonListResponseModel.fromJson(
        response.data as Map<String, dynamic>);
  }

  @override
  Future<PokemonDetailModel> getPokemonDetail(String nameOrId) async {
    final response = await _dio.get('/pokemon/$nameOrId');
    return PokemonDetailModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<List<PokemonListItemModel>> searchPokemonByType(String type) async {
    final response = await _dio.get('/type/$type');
    final data = response.data as Map<String, dynamic>;
    final pokemonList = data['pokemon'] as List<dynamic>;
    return pokemonList
        .map((p) => PokemonListItemModel.fromJson(
              p['pokemon'] as Map<String, dynamic>,
            ))
        .toList();
  }
}
