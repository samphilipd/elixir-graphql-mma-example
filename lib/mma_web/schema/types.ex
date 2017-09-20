defmodule MmaWeb.Schema.Types do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: Mma.Repo

  object :fighter do
    description """
    MMA fighter with vital statistics.
    """
    field :id, :id
    field :belts, :integer, description: "The number of belts a fighter currently holds"
    field :name, :string
    field :weight_in_kilos, :float, deprecate: "This will be replaced by weightInLbs"
    field :fight_results, list_of(:fight_result), resolve: assoc(:fight_results)
  end

  object :fight_result do
    field :result, :string, description: "The result of the fight (Win/Loss/Draw)"
    field :fight, :fight, resolve: assoc(:fight)
  end

  object :fight do
    field :name, :string, description: "The event name"
  end
end

