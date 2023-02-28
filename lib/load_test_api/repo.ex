defmodule LoadTestApi.Repo do
  use Ecto.Repo,
    otp_app: :load_test_api,
    adapter: Ecto.Adapters.Postgres
end
