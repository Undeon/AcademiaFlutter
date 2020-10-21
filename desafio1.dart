void main(List<String> args) {
  var pacientes = [
    'Rodrigo Rahman|35|desenvolvedor|SP',
    'Manoel Silva|12|estudante|MG',
    'Joaquim Rahman|18|estudante|SP',
    'Fernando Verne|35|estudante|MG',
    'Gustavo Silva|40|estudante|MG',
    'Sandra Silva|40|estudante|MG',
    'Regina Verne|35|estudante|MG',
    'João Rahman|55|Jornalista|SP',
  ];

  // Baseado no array acima monte um relatório onde mostre
  // Apresente a quantidade de pacientes com mais de 20 anos
  // Agrupar os pacientes por familia(considerar o sobrenome) apresentar por familia.

  int pacientesMais20Anos = 0;
  int contadorFamilias = 0;
  var pacientesSplit = new List();

  var familias = List.generate(1, (i) {
    return '';
  }, growable: true);

  for (var paciente in pacientes) {
    var pacienteAtual = paciente.split(new RegExp(r"( |\|)"));
    pacientesSplit.add(pacienteAtual);
    if (int.parse(pacienteAtual[2]) > 20) {
      pacientesMais20Anos++;
    }
    var sobrenomeAtual = pacienteAtual[1];

    if (!familias.any((e) => e.contains(sobrenomeAtual))) {
      familias[contadorFamilias] = 'Família ${pacienteAtual[1]}';
      contadorFamilias++;
      familias.add('');
    }
  }
  familias.removeLast();
  familias.sort((a, b) => a.compareTo(b));

  print('O total de pacientes com mais de 20 anos é $pacientesMais20Anos\n');

  pacientesSplit.sort((a, b) => a[1].compareTo(b[1]));
  pacientesSplit.sort((a, b) => a[0].compareTo(b[0]));

  for (var familia in familias) {
    print('- ${familia} -');
    for (var paciente in pacientesSplit) {
      if (familia.contains(paciente[1])) {
        print('${paciente[0]} ${paciente[1]}');
      }
    }
    print('\n');
  }
}
