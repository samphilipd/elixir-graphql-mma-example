defmodule MmaWeb.Schema do
  use Absinthe.Schema
  import_types MmaWeb.Schema.Types

  query do
    field :fighters, list_of(:fighter) do
      resolve fn _params, _info ->
        {:ok, Mma.Repo.all(Mma.Fighter)}
      end
    end
  end
end
