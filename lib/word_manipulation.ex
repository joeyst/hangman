defmodule WordManipulation do
  def replace_letter(word, letter, index) do
    cond do
      index == 0 ->
        letter <> String.slice(word, 1, String.length(word))
      index == String.length(word)-1 ->
        String.slice(word, 0, String.length(word)-1) <> letter
      index >= String.length(word) ->
        "error"
      true ->
        String.slice(word, 0, index) <> letter <> String.slice(word, index+1, String.length(word))
    end
  end

  def has_letter?(word, letter) do
    Enum.any?(0..String.length(word)-1, fn(x) -> String.at(word, x) == letter end)
  end

  def copy_over_all(word_with_letters, word_without_letters, letter, index\\0) do
    cond do
      index < String.length(word_with_letters) ->
        word_without_letters = if String.at(word_with_letters, index) == letter do
          WordManipulation.copy_over_letter(word_with_letters, word_without_letters, index) else word_without_letters end
        WordManipulation.copy_over_all(word_with_letters, word_without_letters, letter, index+1)
      index == String.length(word_with_letters) ->
        word_without_letters
    end    
  end
  
  def copy_over_letter(word_with_letter, word_without_letter, index) do
    WordManipulation.replace_letter(word_without_letter, String.at(word_with_letter, index), index)
  end

  def complete?(word) do
    Enum.all?(0..String.length(word)-1, fn(x) -> String.at(word, x) != "_" end)
  end
end