namespace :custom do
  desc "Your task description"
  task random_game: :environment do
    Rake::Task["db:drop"].invoke
    Rake::Task["db:create"].invoke
    Rake::Task["db:migrate"].invoke

    ['Brotheragem', "Panelinha"].each do |duo|
      Team.find_or_create_by!(name: duo)
    end

    substantivos = [
      'esporte', 'futebol', 'basquete', 'vôlei', 'tênis', 'golfe', 'natação', 'surf', 'skate', 'ciclismo',
      'atletismo', 'ginástica', 'boxe', 'judô', 'karatê', 'taekwondo', 'esgrima', 'arco e flecha', 'hipismo', 'críquete',
      'rugby', 'hóquei', 'patinação', 'alpinismo', 'escalada', 'bungee jumping', 'paraquedismo', 'parapente', 'asa delta', 'mergulho',
      'canoagem', 'remo'
    ]
    substantivos.each do |substantivo|
      Word.find_or_create_by!(name: substantivo)
    end
  end
end
