# mensagem de boas vindas
puts 'Bem vindo ao Task List!'

INSERIR_TAREFA = 1
VER_TAREFA = 2
BUSCAR_TAREFA = 3
MARCAR_FEITA = 4
SAIR = 0

#exibir opcoes para o usuario
def menu
  puts
  puts '### MENU ###'
  puts 'Escolha uma opcao:'
  puts "##{INSERIR_TAREFA} - Inserir uma tarefa"
  puts "##{VER_TAREFA} - Ver todas as tarefas"
  puts "##{BUSCAR_TAREFA} - Buscar uma tarefa" #receber um texto e procurar essa tarefa na lista
  puts "##{MARCAR_FEITA} - Mudar o status de uma tarefa"
  puts "##{SAIR} - Sair"
  puts
  print 'Escolha uma opcao: '
  gets().to_i()
end

def imprime_tarefa(task)
  puts "Tarefa #{task[:id]} >> #{task[:descricao]} || Feita: #{task[:feita]}"
end

def imprime_tarefaID(tasks)
  tasks.each do |t|
  puts imprime_tarefa(t)
end
end

opcao_escolhida = menu()

tarefa_id = 1
tarefas = []
while (opcao_escolhida != SAIR ) do

  if opcao_escolhida == INSERIR_TAREFA
    #codigo para inserir uma tarefa
    print 'Inserir uma tarefa: '
    descricao_tarefa = gets.chomp

    tarefa = {id: tarefa_id, descricao: descricao_tarefa, feita: false}

    tarefas << tarefa

    puts "Tarefa incluida: #{descricao_tarefa}" #interpolar strings

    tarefa_id = tarefa_id + 1

  elsif opcao_escolhida == VER_TAREFA
    tarefas.each do |tarefa|
    imprime_tarefa(tarefa)
  end
  elsif opcao_escolhida == BUSCAR_TAREFA
    print'Insira o texto que voce deseja buscar: '
    texto_busca = gets().chomp().upcase()
    tarefas.each do |tarefa|
      if tarefa[:descricao].upcase.include? texto_busca
        #DUVIDA: porque quando eu rodo aqui a tarefa encontrada vem depois do imprime_tarefa?
        puts"Tarefa encontrada: #{ imprime_tarefa(tarefa) }"
      else
        #DUVIDA: Porque repete pela quantidade de tarefas inseridas?
        puts'Tarefa nao encontrada.'
      end
  end
  elsif opcao_escolhida == MARCAR_FEITA
    #1- Imorimir todas as tarefas, exibindo o ID
    puts('Escolha qual tarefa deseja marcar como feita:')
    puts
    imprime_tarefaID(tarefas)
    #2- Perguntar qual tarefa quer marcar como feita (usando ID)
    print('Qual tarefa deseja marcar como feita?')
    id_marcar_feita = gets().to_i()
    #3 - Buscar a tarefa pelo ID e trocar o valor de fita para true
    tarefas.each do |t|
      if t[:id] == id_marcar_feita
        t [:feita] = true
      end

    #4 - Atualizar a tarefa no array (ex remover a tarefa do array e reinserir com valor atualizado)
    #5 - Imprimir uma mensagem de sucesso
  end
  else
    puts 'Opcao invalida'
  end

opcao_escolhida = menu()

end

puts 'Adeus!'
