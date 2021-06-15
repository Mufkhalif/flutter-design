import 'package:bloc/bloc.dart';
import 'package:my_app/model/user.dart';

class UserBloc extends Bloc<int, User> {
  UserBloc(User initialState) : super(initialState);

  @override
  Stream<User> mapEventToState(int event) async* {
    try {
      User user = await User.getSingleUser(event.toString());
      yield user;
    } catch (_) {}
  }
}
