defmodule Mma.Fighter do
  use Ecto.Schema
  import Ecto.Changeset
  alias Mma.Fighter


  schema "fighters" do
    has_many :fight_results, Mma.FightResult

    field :belts, :integer
    field :name, :string
    field :weight_in_kilos, :float

    timestamps()
  end

  @doc false
  def changeset(%Fighter{} = fighter, attrs) do
    fighter
    |> cast(attrs, [:name, :belts, :weight_in_kilos])
    |> validate_required([:name, :belts, :weight_in_kilos])
  end
end
