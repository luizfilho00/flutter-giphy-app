import 'package:mymovies/data/remote/api_client.dart';
import 'package:mymovies/domain/boundary/fake_repository.dart';

class DefaultFakeRepository extends FakeRepository {
  final ApiClient apiClient;

  DefaultFakeRepository(this.apiClient);

  @override
  void doItFake() {
    /*Nothing to do */
  }
}
