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

  def copy_over_letter(word_with_letter, word_without_letter, index) do
    WordManipulation.replace_letter(word_without_letter, String.at(word_with_letter, index), index)
  end

  def copy_over_all(word_with_letters, word_without_letters, letter) do

  end
end

word = "hello"
word_with_unguessed_letters = "_____"
guess = "h"

IO.puts ("hai " <> String.slice(word, 1, String.length(word)))
IO.puts ("hai " <> String.slice(word, 0, String.length(word)-1))

replace_letter = fn word, letter, index ->
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

IO.puts "replacing 0th index: " <> replace_letter.(word, guess, 0)
IO.puts "replacing DNE index: " <> replace_letter.(word, guess, 5)
IO.puts "replacing last index: " <> replace_letter.(word, guess, 4)
IO.puts "replacing middle index: " <> replace_letter.(word, guess, 3)