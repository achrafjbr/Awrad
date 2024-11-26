part of 'user_cache_cubit.dart';

@immutable
sealed class UserCacheState {}

final class UserCacheInitial extends UserCacheState {}

final class UserCacheLoadingState extends UserCacheState {}
final class UserCacheSuccessState extends UserCacheState {}
final class UserCacheIsFoundState extends UserCacheState {}
