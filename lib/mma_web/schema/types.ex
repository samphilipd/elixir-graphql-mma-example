defmodule MmaWeb.Schema.Types do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: Mma.Repo
  import_types Absinthe.Type.Custom

  object :fighter do
    description """
    MMA fighter with vital statistics.
    """
    field :id, :id
    field :belts, :integer, description: "The number of belts a fighter currently holds"
    field :name, :string
    field :weight_in_kilos, :float, deprecate: "This will be replaced by weightInLbs"
    field :weight_in_lbs, :float do
      resolve fn _fighter = %{weight_in_kilos: weight_in_kilos}, _params, _info ->
        {:ok, weight_in_kilos * 2.20462}
      end
    end
    field :fight_results, list_of(:fight_result), resolve: assoc(:fight_results)
  end

  object :fight_result do
    field :result, :string, description: "The result of the fight (Win/Loss/Draw)"
    field :fight, :fight, resolve: assoc(:fight)
  end

  object :fight do
    field :name, :string, description: "The event name"
    field :date, :date, description: "The date of the event"
  end
end

