defmodule Werdle.WordBank.Word do
  use Ecto.Schema
  import Ecto.Changeset

  schema "words" do
    field :name, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(word, attrs) do
    word
    |> cast(attrs, [:name])
    |> downcase_name()
    |> validate_required([:name])
    |> validate_characters()
  end

  defp validate_characters(changeset) do
    lowercase_regex = ~r/\A[a-z]+\z/

    validate_format(
      changeset,
      :name,
      lowercase_regex,
      message: "must contain only lowercase letters"
    )
  end

  defp downcase_name(changeset) do
    case get_change(changeset, :name) do
      nil ->
        changeset

      name ->
        put_change(changeset, :name, String.downcase(name))
    end
  end
end
