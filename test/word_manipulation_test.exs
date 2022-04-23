defmodule WordManipulationTest do
  use ExUnit.Case
  doctest WordManipulation

  test "returns new word from word, letter, and index" do
    assert WordManipulation.replace_letter("hello", "y", 0) == "yello"
    assert WordManipulation.replace_letter("hello", "y", 1) == "hyllo"
    assert WordManipulation.replace_letter("hello", "y", 4) == "helly"
    assert WordManipulation.replace_letter("hello", "y", 5) == "error"
  end

  test "finds if there's a letter in a word" do
    assert WordManipulation.has_letter?("hello", "h") == true
    assert WordManipulation.has_letter?("hello", "v") == false
  end

  test "replaces underscore with letter from word, and index" do
    assert WordManipulation.copy_over_letter("hello", "_____", 3) == "___l_"
    assert WordManipulation.copy_over_letter("hello", "_____", 0) == "h____"
    assert WordManipulation.copy_over_letter("hello", "_____", 4) == "____o"
    assert WordManipulation.copy_over_letter("hello", "_____", 5) == "error"
    assert WordManipulation.copy_over_letter("hello", "h____", 2) == "h_l__"
  end

  test "copies over all instances of a letter" do
    assert WordManipulation.copy_over_all("hello", "_____", "h") == "h____"
    assert WordManipulation.copy_over_all("hello", "_____", "l") == "__ll_"
    assert WordManipulation.copy_over_all("hello", "abcde", "e") == "aecde"
  end

  test "checks if the word is complete" do
    assert WordManipulation.complete?("_____") == false
    assert WordManipulation.complete?("h___o") == false
    assert WordManipulation.complete?("hello") == true
  end
end
