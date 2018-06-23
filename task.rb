class Task

  attr_accessor :descricao
  attr_reader :id, :feita

  def initialize(id, descricao, feita = false)
    @id = id
    @descricao = descricao
    @feita = feita
  end
  def marcar_feita=()
    @feita = true
  end

  def to_s()
    "Tarefa ##{id()} >> #{descricao} || Feita: #{feita}"
  end
end
