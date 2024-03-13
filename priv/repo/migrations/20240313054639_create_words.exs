defmodule Werdle.Repo.Migrations.CreateWords do
  use Ecto.Migration

  def change do
    create table(:words) do
      add :name, :string

      timestamps(type: :utc_datetime)
    end
  end
end
