import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../constants/users/user.dart';
import '../../../utils/user_caching/user_cache.dart';

part 'user_cache_state.dart';

class UserCacheCubit extends Cubit<UserCacheState> {
  UserCacheCubit() : super(UserCacheInitial());

  /// Setter userID function.
  Future<void> setUserID({required String userId}) async {
    emit(UserCacheLoadingState());
    // Set a dummy userId to cache.
    User.userID  = userId;
    await UserCache.setCacheUserId(userId:User.userID!);
    emit(UserCacheSuccessState());
  }


}
