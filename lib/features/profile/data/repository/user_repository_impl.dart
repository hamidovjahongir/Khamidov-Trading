import 'package:trading_app/core/constants/network_path.dart';
import 'package:trading_app/core/dio_client/dio_client.dart';
import 'package:trading_app/features/profile/data/model/user_model.dart';
import 'package:trading_app/features/profile/data/repository/user_local_repository.dart';
import 'package:trading_app/features/profile/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  DioClient dioClient;
  final db = UserLocalRepository();

  UserRepositoryImpl(this.dioClient);

  @override
  Future<String> addUser(UserModel user) async {
    final response = await dioClient.post(NetworkPath.users, user.toJson());
    final String id =  response.data['name'] ?? response.data['id'];
    await db.saveUserId(id);
    return id;

  }

  @override
  Future<UserModel> editUser(String id, UserModel updatedUser) async {
    final response = await dioClient.patch(
      '${NetworkPath.users}/$id',
      updatedUser.toJson(),
    );
    return UserModel.fromJson(response.data, id: id);
  }

  @override
  Future<UserModel> getUser(String id) async {
    final response = await dioClient.get('${NetworkPath.users}/$id');
    return UserModel.fromJson(response.data, id: id);
  }

  @override
  Future<List<UserModel>> getUsers() async {
    final response = await dioClient.get(NetworkPath.users);
    
    if (response.data == null) {
      return [];
    }

    List<UserModel> users = [];

    response.data.forEach((key, value) {
      users.add(UserModel.fromJson(value, id: key));
    });

    return users;
  }

  @override
  Future<void> deleteUser(String id) async {
    await dioClient.delete('${NetworkPath.users}/$id');
  }
}
