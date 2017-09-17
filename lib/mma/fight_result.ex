defmodule Mma.FightResult do
  use Ecto.Schema
  import Ecto.Changeset
  alias Mma.FightResult


  schema "fight_results" do
    belongs_to :fight, Mma.Fight

    field :result, :string
    field :fighter_id, :id

    timestamps()
  end

  @doc false
  def changeset(%FightResult{} = fight_result, attrs) do
    fight_result
    |> cast(attrs, [:result])
    |> validate_required([:result])
  end
end
