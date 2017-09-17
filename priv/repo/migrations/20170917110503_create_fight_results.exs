defmodule Mma.Repo.Migrations.CreateFightResults do
  use Ecto.Migration

  def change do
    create table(:fight_results) do
      add :result, :string
      add :fight_id, references(:fights, on_delete: :nothing)
      add :fighter_id, references(:fighters, on_delete: :nothing)

      timestamps()
    end

    create index(:fight_results, [:fight_id])
    create index(:fight_results, [:fighter_id])
  end
end
