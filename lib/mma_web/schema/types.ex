defmodule MmaWeb.Schema.Types do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: Mma.Repo

  object :fighter do
    field :id, :id
    field :belts, :integer
    field :name, :string
    field :weight_in_kilos, :float
    field :fight_results, list_of(:fight_result), resolve: assoc(:fight_results)
  end

  object :fight_result do
    field :result, :string
    field :fight, :fight, resolve: assoc(:fight)
  end

  object :fight do
    field :name, :string
  end
end

