defmodule WordManipulationTest do
  use ExUnit.Case
  doctest WordManipulation

  test "returns new word from word, letter, and index" do
    assert WordManipulation.replace_letter("hello", "y", 0) == "yello"
    assert WordManipulation.replace_letter("hello", "y", 1) == "hyllo"
    assert WordManipulation.replace_letter("hello", "y", 4) == "helly"
    assert WordManipulation.replace_letter("hello", "y", 5) == "error"
  end
end
