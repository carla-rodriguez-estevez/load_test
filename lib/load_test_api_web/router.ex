defmodule LoadTestApiWeb.Router do
  use LoadTestApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", LoadTestApiWeb do
    pipe_through :api
  end
end
