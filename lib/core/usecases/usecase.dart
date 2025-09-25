// ignore: public_member_api_docs, avoid_types_as_parameter_names
abstract class UseCase<Type, Params> {
  Future<Type> call(Params params);
}

class NoParams {
  const NoParams();
}
