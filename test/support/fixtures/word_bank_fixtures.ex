defmodule Werdle.WordBankFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Werdle.WordBank` context.
  """

  @doc """
  Generate a word.
  """
  def word_fixture(attrs \\ %{}) do
    {:ok, word} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Werdle.WordBank.create_word()

    word
  end

  @doc """
  Generate a solve.
  """
  def solve_fixture(attrs \\ %{}) do
    {:ok, solve} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Werdle.WordBank.create_solve()

    solve
  end
end
