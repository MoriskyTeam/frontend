import 'package:bloc_test/bloc_test.dart';
import 'package:domain/domain.dart';
import 'package:dynamic_rcb_alerts/features/alarm/bloc/alarm_cubit.dart';
import 'package:dynamic_rcb_alerts/features/alarm/model/alarm_effects.dart';
import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';

/// Records what the cubit asked the phone to do.
class _FakeEffects implements AlarmEffects {
  final calls = <String>[];

  @override
  Future<void> start({required bool strobe}) async =>
      calls.add('start(strobe: $strobe)');

  @override
  Future<void> stop() async => calls.add('stop');

  @override
  Future<void> dispose() async => calls.add('dispose');
}

const _alarm = DangerAlarm(
  sourceId: 'incident:abc123',
  incidentId: 'abc123',
  title: 'Zalane przejście podziemne',
  body: 'Rondo Mogilskie',
  location: GeoPoint(latitude: 50.0656, longitude: 19.9603),
);

void main() {
  late _FakeEffects effects;

  setUp(() => effects = _FakeEffects());

  blocTest<AlarmCubit, AlarmState>(
    'GIVEN a danger alarm,\n'
    'WHEN the alarm screen opens,\n'
    'THEN it rings and strobes',
    build: () => AlarmCubit(effects, _alarm),
    act: (cubit) => cubit.init(strobe: true),
    expect: () => [const AlarmState(ringing: true)],
    // blocTest closes the cubit before verify, which releases the effects.
    verify: (_) => expect(effects.calls, ['start(strobe: true)', 'dispose']),
  );

  blocTest<AlarmCubit, AlarmState>(
    'GIVEN a resident who asked for reduced motion,\n'
    'WHEN the alarm screen opens,\n'
    'THEN it rings without strobing',
    build: () => AlarmCubit(effects, _alarm),
    act: (cubit) => cubit.init(strobe: false),
    expect: () => [const AlarmState(ringing: true, strobe: false)],
    verify: (_) => expect(effects.calls, ['start(strobe: false)', 'dispose']),
  );

  test(
    'GIVEN a ringing alarm,\n'
    'WHEN the resident taps "I understand",\n'
    'THEN it falls silent and leaves for the incident on the map',
    () async {
      final cubit = AlarmCubit(effects, _alarm);
      final events = <AlarmEvent>[];
      final subscription = cubit.presentation.listen(events.add);

      await cubit.init(strobe: true);
      await cubit.acknowledge();
      await Future<void>.delayed(Duration.zero);

      expect(cubit.state.ringing, isFalse);
      expect(effects.calls, ['start(strobe: true)', 'stop']);
      expect(
        events.single,
        isA<AlarmAcknowledged>().having(
          (event) => event.incidentId,
          'incidentId',
          'abc123',
        ),
      );
      await subscription.cancel();
      await cubit.close();
    },
  );

  test(
    'GIVEN a ringing alarm nobody answers,\n'
    'WHEN two minutes pass,\n'
    'THEN it falls silent on its own',
    () {
      fakeAsync((async) {
        final cubit = AlarmCubit(effects, _alarm)..init(strobe: true);
        async.elapse(AlarmCubit.autoStop - const Duration(seconds: 1));
        expect(cubit.state.ringing, isTrue);

        async.elapse(const Duration(seconds: 2));
        expect(cubit.state.ringing, isFalse);
        expect(effects.calls.last, 'stop');
      });
    },
  );

  test(
    'GIVEN an alarm screen,\n'
    'WHEN it closes,\n'
    'THEN every effect is released',
    () async {
      final cubit = AlarmCubit(effects, _alarm);
      await cubit.init(strobe: true);
      await cubit.close();

      expect(effects.calls.last, 'dispose');
    },
  );
}
