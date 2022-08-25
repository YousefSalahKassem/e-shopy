abstract class IUserProvider{
  Future<void> getUserData();
  Future<bool> isTokenValid();
}
