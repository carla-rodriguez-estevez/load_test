defmodule LoadTestApiWeb.Router do
  use LoadTestApiWeb, :router
  use Plug.ErrorHandler

  defp handle_errors(conn, %{reason: %Phoenix.Router.NoRouteError{message: message}}) do
    conn |> json(%{errors: message}) |> halt()
  end

  defp handle_errors(conn, %{reason: %{message: message}}) do
    conn |> json(%{errors: message}) |> halt()
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", LoadTestApiWeb do
    pipe_through :api
    get "/animales/encontrar/:nombre", AnimalController, :show_listed
    get "/animales/:id", AnimalController, :show

  end
end
