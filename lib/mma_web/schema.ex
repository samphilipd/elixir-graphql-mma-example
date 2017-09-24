defmodule MmaWeb.Schema do
  use Absinthe.Schema
  import_types MmaWeb.Schema.Types

  query do
    field :fighter, :fighter do
      arg :id, non_null(:id)

      resolve fn %{id: id}, _info ->
        case Mma.Repo.get(Mma.Fighter, id) do
          nil -> {:error, :not_found}
          fighter -> {:ok, fighter}
        end
      end
    end
    field :fighters, list_of(:fighter) do
      resolve fn _params, _info ->
        {:ok, Mma.Repo.all(Mma.Fighter)}
      end
    end
  end
end
