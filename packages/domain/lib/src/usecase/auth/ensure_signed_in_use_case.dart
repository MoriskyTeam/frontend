import 'package:domain/src/model/result/common/no_result.dart';
import 'package:domain/src/repository/auth_repository.dart';
import 'package:domain/src/usecase/base_use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class EnsureSignedInUseCase extends BaseUseCaseNoParam<NoResult> {
  EnsureSignedInUseCase(this._repository);

  final AuthRepository _repository;

  @override
  Future<NoResult> execute() async {
    await _repository.ensureSignedIn();
    return const NoResult();
  }
}
