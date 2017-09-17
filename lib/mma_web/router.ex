defmodule MmaWeb.Router do
  use MmaWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", MmaWeb do
    pipe_through :api
  end

  forward "/graphiql", Absinthe.Plug.GraphiQL, schema: MmaWeb.Schema
end
