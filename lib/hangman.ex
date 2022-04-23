defmodule Hangman do
  @moduledoc """
  Documentation for Hangman.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Hangman.hello()
      :world

  """
  def hello do
    :world
  end
end
"""
word = "hello"
word_with_unguessed_letters = "_____"
guess = "h"

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
"""