// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:ricky_n_morty_aap/characters/data/repository/character_repository.dart'
    as _i8;
import 'package:ricky_n_morty_aap/characters/data/service/character_service.dart'
    as _i6;
import 'package:ricky_n_morty_aap/characters/domain/character_interactor.dart'
    as _i9;
import 'package:ricky_n_morty_aap/characters/presentation/bloc/character_bloc.dart'
    as _i10;
import 'package:ricky_n_morty_aap/details/data/repository/details_repository.dart'
    as _i5;
import 'package:ricky_n_morty_aap/details/data/service/character_detail_service.dart'
    as _i4;
import 'package:ricky_n_morty_aap/details/presentation/bloc/character_details_bloc.dart'
    as _i7;
import 'package:ricky_n_morty_aap/network/network_module.dart' as _i11;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final networkModule = _$NetworkModule();
  gh.factory<_i3.Interceptor>(
    () => networkModule.providePrettyLogger(),
    instanceName: 'PrettyLogger',
  );
  gh.factory<String>(
    () => networkModule.baseUrl,
    instanceName: 'BaseUrl',
  );
  gh.singleton<_i3.Dio>(networkModule.provideDio(
    gh<String>(instanceName: 'BaseUrl'),
    gh<_i3.Interceptor>(instanceName: 'PrettyLogger'),
  ));
  gh.factory<_i4.CharacterDetailService>(
      () => _i4.CharacterDetailServiceImpl(gh<_i3.Dio>()));
  gh.factory<_i5.CharacterDetailsRepository>(() =>
      _i5.CharacterDetailsRepositoryImpl(gh<_i4.CharacterDetailService>()));
  gh.factory<_i6.CharacterService>(
      () => _i6.CharacterServiceImpl(gh<_i3.Dio>()));
  gh.factory<_i7.CharacterDetailsBloc>(
      () => _i7.CharacterDetailsBloc(gh<_i5.CharacterDetailsRepository>()));
  gh.factory<_i8.CharacterRepository>(
      () => _i8.CharactersRepositoryImpl(gh<_i6.CharacterService>()));
  gh.factory<_i9.CharactersInteractor>(
      () => _i9.CharactersInteractorImpl(gh<_i8.CharacterRepository>()));
  gh.factory<_i10.CharacterBloc>(
      () => _i10.CharacterBloc(gh<_i9.CharactersInteractor>()));
  return getIt;
}

class _$NetworkModule extends _i11.NetworkModule {}
