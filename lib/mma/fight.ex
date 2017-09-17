defmodule Mma.Fight do
  use Ecto.Schema
  import Ecto.Changeset
  alias Mma.Fight


  schema "fights" do
    field :date, :date
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%Fight{} = fight, attrs) do
    fight
    |> cast(attrs, [:name, :date])
    |> validate_required([:name, :date])
  end
end
