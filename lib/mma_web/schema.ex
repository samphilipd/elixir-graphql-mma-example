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

  mutation do
    field :create_fighter, type: :fighter do
      arg :input, :fighter_input

      resolve fn %{input: params}, _ ->
        %Mma.Fighter{}
        |> Mma.Fighter.changeset(params)
        |> Mma.Repo.insert
      end
    end
  end
end
