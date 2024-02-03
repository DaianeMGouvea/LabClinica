// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_service/src/model/patient_model.dart';

import 'package:fe_lab_clinicas_self_service/src/repositories/patients/patient_repository.dart';
import 'package:signals_flutter/signals_flutter.dart';

class PatientController with MessageStateMixin {
  final PatientRepository _repository;
  PatientModel? patient;
  final _nextStep = signal<bool>(false);

  bool get nextStep => _nextStep();

  PatientController({
    required PatientRepository repository,
  }) : _repository = repository;

  void goNextStep() {
    _nextStep.value = true;
  }

  Future<void> updateAndNext(PatientModel model) async {
    final updadeResult = await _repository.update(model);

    switch (updadeResult) {
      case Left<RepositoryException, Unit>():
        showError('Erro ao atualizar dados do paciente, chame o atendente');
      case Right<RepositoryException, Unit>():
        showInfo('Paciente atualizado com sucesso');
        patient = model;
        goNextStep();
    }
  }

  Future<void> saveAndNext(RegisterPatientModel registerPatientModel) async {
    final result = await _repository.register(registerPatientModel);
    switch (result) {
      case Left<RepositoryException, PatientModel?>():
        showError('Erro ao cadastrar paciente, chame o atendente ');
      case Right<RepositoryException, PatientModel?>():
        showInfo('Paciente cadastrado com sucesso');
        patient = patient;
        goNextStep();
    }
  }
}
