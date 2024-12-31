
# Criando a primeira lista de tarefas
list1 = List.create(title: 'Minha Lista de Tarefas Domésticas')

# Criando tarefas para a primeira lista
['Lavar a louça', 'Limpar o quarto', 'Organizar a despensa', 'Passar roupas', 
 'Regar as plantas', 'Limpar janelas', 'Trocar lâmpadas', 'Lavar roupas', 
 'Tirar o lixo', 'Preparar refeições da semana'].each_with_index do |task_title, i|
  Task.create(
    title: task_title,
    term: DateTime.now + (i + 1).days,  # Estabelecendo prazos incrementais
    list_id: list1.id                   # Associando a tarefa à lista
  )
end

# Criando a segunda lista de tarefas
list2 = List.create(title: 'Minha Lista de Tarefas Profissionais')

# Criando tarefas para a segunda lista
['Enviar e-mails importantes', 'Participar da reunião de equipe', 
 'Finalizar relatório trimestral', 'Planejar o cronograma semanal', 
 'Revisar o orçamento do projeto', 'Agendar reuniões com fornecedores', 
 'Atualizar o sistema de gerenciamento de tarefas', 'Ler artigos técnicos', 
 'Criar apresentação para clientes', 'Treinar novo colaborador'].each_with_index do |task_title, i|
  Task.create(
    title: task_title,
    term: DateTime.now + (i + 2).days,  # Estabelecendo prazos incrementais com outro padrão
    list_id: list2.id                   # Associando a tarefa à lista
  )
end