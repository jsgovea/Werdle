defmodule Werdle.WordBank.Solve do
  use Ecto.Schema
  import Ecto.Changeset

  schema "solves" do
    field :name, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(solve, attrs) do
    solve
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
