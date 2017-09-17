defmodule Mma.Repo.Migrations.CreateFighters do
  use Ecto.Migration

  def change do
    create table(:fighters) do
      add :name, :string
      add :belts, :integer
      add :weight_in_kilos, :float

      timestamps()
    end

  end
end
