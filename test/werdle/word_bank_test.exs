defmodule Werdle.WordBankTest do
  use Werdle.DataCase

  alias Werdle.WordBank

  describe "words" do
    alias Werdle.WordBank.Word

    import Werdle.WordBankFixtures

    @invalid_attrs %{name: nil}

    test "list_words/0 returns all words" do
      word = word_fixture()
      assert WordBank.list_words() == [word]
    end

    test "get_word!/1 returns the word with given id" do
      word = word_fixture()
      assert WordBank.get_word!(word.id) == word
    end

    test "create_word/1 with valid data creates a word" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Word{} = word} = WordBank.create_word(valid_attrs)
      assert word.name == "some name"
    end

    test "create_word/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = WordBank.create_word(@invalid_attrs)
    end

    test "update_word/2 with valid data updates the word" do
      word = word_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Word{} = word} = WordBank.update_word(word, update_attrs)
      assert word.name == "some updated name"
    end

    test "update_word/2 with invalid data returns error changeset" do
      word = word_fixture()
      assert {:error, %Ecto.Changeset{}} = WordBank.update_word(word, @invalid_attrs)
      assert word == WordBank.get_word!(word.id)
    end

    test "delete_word/1 deletes the word" do
      word = word_fixture()
      assert {:ok, %Word{}} = WordBank.delete_word(word)
      assert_raise Ecto.NoResultsError, fn -> WordBank.get_word!(word.id) end
    end

    test "change_word/1 returns a word changeset" do
      word = word_fixture()
      assert %Ecto.Changeset{} = WordBank.change_word(word)
    end
  end

  describe "solves" do
    alias Werdle.WordBank.Solve

    import Werdle.WordBankFixtures

    @invalid_attrs %{name: nil}

    test "list_solves/0 returns all solves" do
      solve = solve_fixture()
      assert WordBank.list_solves() == [solve]
    end

    test "get_solve!/1 returns the solve with given id" do
      solve = solve_fixture()
      assert WordBank.get_solve!(solve.id) == solve
    end

    test "create_solve/1 with valid data creates a solve" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Solve{} = solve} = WordBank.create_solve(valid_attrs)
      assert solve.name == "some name"
    end

    test "create_solve/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = WordBank.create_solve(@invalid_attrs)
    end

    test "update_solve/2 with valid data updates the solve" do
      solve = solve_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Solve{} = solve} = WordBank.update_solve(solve, update_attrs)
      assert solve.name == "some updated name"
    end

    test "update_solve/2 with invalid data returns error changeset" do
      solve = solve_fixture()
      assert {:error, %Ecto.Changeset{}} = WordBank.update_solve(solve, @invalid_attrs)
      assert solve == WordBank.get_solve!(solve.id)
    end

    test "delete_solve/1 deletes the solve" do
      solve = solve_fixture()
      assert {:ok, %Solve{}} = WordBank.delete_solve(solve)
      assert_raise Ecto.NoResultsError, fn -> WordBank.get_solve!(solve.id) end
    end

    test "change_solve/1 returns a solve changeset" do
      solve = solve_fixture()
      assert %Ecto.Changeset{} = WordBank.change_solve(solve)
    end
  end
end
