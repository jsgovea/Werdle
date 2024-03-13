defmodule Werdle.WordBank do
  @moduledoc """
  The WordBank context.
  """

  import Ecto.Query, warn: false
  alias Werdle.Repo

  alias Werdle.WordBank.Word

  @doc """
  Returns the list of words.

  ## Examples

      iex> list_words()
      [%Word{}, ...]

  """
  def list_words do
    Repo.all(Word)
  end

  @doc """
  Gets a single word.

  Raises `Ecto.NoResultsError` if the Word does not exist.

  ## Examples

      iex> get_word!(123)
      %Word{}

      iex> get_word!(456)
      ** (Ecto.NoResultsError)

  """
  def get_word!(id), do: Repo.get!(Word, id)

  @doc """
  Creates a word.

  ## Examples

      iex> create_word(%{field: value})
      {:ok, %Word{}}

      iex> create_word(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_word(attrs \\ %{}) do
    %Word{}
    |> Word.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a word.

  ## Examples

      iex> update_word(word, %{field: new_value})
      {:ok, %Word{}}

      iex> update_word(word, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_word(%Word{} = word, attrs) do
    word
    |> Word.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a word.

  ## Examples

      iex> delete_word(word)
      {:ok, %Word{}}

      iex> delete_word(word)
      {:error, %Ecto.Changeset{}}

  """
  def delete_word(%Word{} = word) do
    Repo.delete(word)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking word changes.

  ## Examples

      iex> change_word(word)
      %Ecto.Changeset{data: %Word{}}

  """
  def change_word(%Word{} = word, attrs \\ %{}) do
    Word.changeset(word, attrs)
  end

  alias Werdle.WordBank.Solve

  @doc """
  Returns the list of solves.

  ## Examples

      iex> list_solves()
      [%Solve{}, ...]

  """
  def list_solves do
    Repo.all(Solve)
  end

  @doc """
  Gets a single solve.

  Raises `Ecto.NoResultsError` if the Solve does not exist.

  ## Examples

      iex> get_solve!(123)
      %Solve{}

      iex> get_solve!(456)
      ** (Ecto.NoResultsError)

  """
  def get_solve!(id), do: Repo.get!(Solve, id)

  @doc """
  Creates a solve.

  ## Examples

      iex> create_solve(%{field: value})
      {:ok, %Solve{}}

      iex> create_solve(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_solve(attrs \\ %{}) do
    %Solve{}
    |> Solve.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a solve.

  ## Examples

      iex> update_solve(solve, %{field: new_value})
      {:ok, %Solve{}}

      iex> update_solve(solve, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_solve(%Solve{} = solve, attrs) do
    solve
    |> Solve.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a solve.

  ## Examples

      iex> delete_solve(solve)
      {:ok, %Solve{}}

      iex> delete_solve(solve)
      {:error, %Ecto.Changeset{}}

  """
  def delete_solve(%Solve{} = solve) do
    Repo.delete(solve)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking solve changes.

  ## Examples

      iex> change_solve(solve)
      %Ecto.Changeset{data: %Solve{}}

  """
  def change_solve(%Solve{} = solve, attrs \\ %{}) do
    Solve.changeset(solve, attrs)
  end
end
