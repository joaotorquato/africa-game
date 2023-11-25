# frozen_string_literal: true

class WordsController < ApplicationController
  def new
    @word = Word.new
  end

  def create
    @word = Word.new(word_params)

    if @word.save
      redirect_to new_word_path, notice: "Palavra #{@word.name.first}****** adicionada com sucesso."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def word_params
    params.require(:word).permit(:name)
  end
end
