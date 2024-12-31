namespace :dev do
  desc "configuring development environment"
  task setup: :environment do
    load_spinner("Drop DB") { %x(rails db:drop)}
    load_spinner("Create BD") { %x(rails db:create)}
    load_spinner("Running migrations") { %x(rails db:migrate)}    
    load_spinner("Including starting lists") { %x(rails dev:add_lists)}
  end

  desc "including starting lists"
  task add_lists: :environment do
    lists = [
      {title: "Atividades da faculdade"},
      {title: "Compromissos da semana"},
      {title: "Faltou em casa"}
    ] 

    lists.each do |list| 
      List.find_or_create_by(list)
    end
  end

  private 
  def load_spinner(msg_start, msg_end="Concluido!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start} ... ", format: :dots)
    spinner.auto_spin 
    yield 
    spinner.success("(#{msg_end})")
  end

end
