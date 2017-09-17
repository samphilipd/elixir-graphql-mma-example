defmodule Mma.Repo.Migrations.CreateFights do
  use Ecto.Migration

  def change do
    create table(:fights) do
      add :name, :string
      add :date, :date

      timestamps()
    end

  end
end
