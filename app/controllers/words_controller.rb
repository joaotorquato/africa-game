# frozen_string_literal: true

class WordsController < ApplicationController
  def new
    @word = Word.new
  end

  def create
    @word = Word.find_or_initialize_by(name: name_param)

    if @word.save
      redirect_to new_word_path, notice: "Palavra #{@word.name.first}****** adicionada com sucesso."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def name_param
    params.require(:word).permit(:name)[:name].downcase.chomp.strip
  end
end
