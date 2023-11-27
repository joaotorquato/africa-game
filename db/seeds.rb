# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
['Sam & Dave', "Ben & Jerry's", 'Os incríveis', 'Simon & Garfunkel'].each do |duo|
  Team.find_or_create_by!(name: duo)
end

substantivos = [
  'esporte', 'futebol', 'basquete', 'vôlei', 'tênis', 'golfe', 'natação', 'surf', 'skate', 'ciclismo',
  'atletismo', 'ginástica', 'boxe', 'judô', 'karatê', 'taekwondo', 'esgrima', 'arco e flecha', 'hipismo', 'críquete',
  'rugby', 'hóquei', 'patinação', 'alpinismo', 'escalada', 'bungee jumping', 'paraquedismo', 'parapente', 'asa delta', 'mergulho',
  'canoagem', 'remo', 'vela', 'esqui', 'snowboard', 'bobsled', 'curling', 'biatlo', 'luge', 'skeleton',
  'badminton', 'squash', 'ping-pong', 'bilhar', 'boliche', 'dardo', 'sumô', 'luta livre', 'MMA', 'kickboxing',
  'jogo', 'xadrez', 'dama', 'cartas', 'pôquer', 'dominó', 'mahjong', 'jogo de tabuleiro', 'quebra-cabeça', 'videogame',
  'fliperama', 'RPG', 'LARP', 'jogo de cartas colecionáveis', 'jogo de miniaturas', 'jogo de estratégia', 'jogo de simulação', 'trivia', 'palavras cruzadas', 'sudoku',
  'animal', 'inseto', 'réptil', 'anfíbio', 'mamífero', 'ave', 'peixe', 'molusco', 'crustáceo', 'aracnídeo',
  'invertebrado', 'vertebrado', 'herbívoro', 'carnívoro', 'onívoro', 'predador', 'presa', 'doméstico', 'selvagem', 'exótico'
]
substantivos.each do |substantivo|
  Word.find_or_create_by!(name: substantivo)
end
