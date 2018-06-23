require_relative 'task'
puts('Bem vindo ao Task List!')

INSERIR_TAREFA = 1
VER_TAREFA = 2
BUSCAR_TAREFA = 3
MARCAR_FEITA = 4
SAIR = 0

def menu
  puts
  puts '### MENU ###'
  puts 'Escolha uma opcao:'
  puts "##{INSERIR_TAREFA} - Inserir uma tarefa"
  puts "##{VER_TAREFA} - Ver todas as tarefas"
  puts "##{BUSCAR_TAREFA} - Buscar uma tarefa"
  puts "##{MARCAR_FEITA} - Mudar o status de uma tarefa"
  puts "##{SAIR} - Sair"
  puts
  print 'Escolha uma opcao: '
  gets().to_i()
end

def imprime_tarefas(tasks)
  tasks.each do |t|
  puts t
end
end

opcao_escolhida = menu()

tarefa_id = 1
tarefas = []
while (opcao_escolhida != SAIR ) do

  if opcao_escolhida == INSERIR_TAREFA
    print 'Inserir uma tarefa: '
    descricao_tarefa = gets.chomp

    tarefa = Task.new(tarefa_id, descricao_tarefa)
    tarefas << tarefa

    puts "Tarefa incluida: #{descricao_tarefa}"

    tarefa_id = tarefa_id + 1

  elsif opcao_escolhida == VER_TAREFA
    imprime_tarefas(tarefas)

  elsif opcao_escolhida == BUSCAR_TAREFA
    print'Insira o texto que voce deseja buscar: '
    texto_busca = gets().chomp().upcase()
#Porque nao esta dando mais certo criar um array para as tarefas_encontradas?
    tarefas_encontradas = []

    tarefas_encontradas = tarefas.select do |tarefa|
      tarefas[:descricao].upcase.include? texto_busca
  end

    puts "#{tarefas_encontrada.length} tarefas entcontradas"
    puts t(tarefas_encontradas)

  elsif opcao_escolhida == MARCAR_FEITA
  #eu nao estou conseguindo desenvolver as mudancas sem orientacoes/resolucoes, acredito que nao estou conseguindo capturar os conceitos, vou tentar desenvolver nas lives e depois retornar.
    puts('Escolha qual tarefa deseja marcar como feita:')
    puts
    imprime_tarefaID(tarefas)
    print('Qual tarefa deseja marcar como feita?')
    id_marcar_feita = gets().to_i()
    tarefas.each do |t|
      if t[:id] == id_marcar_feita
        t [:feita] = true
      end

  end
  else
    puts 'Opcao invalida'
  end

opcao_escolhida = menu()

end

puts 'Adeus!'
