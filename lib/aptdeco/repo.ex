defmodule Aptdeco.Repo do
  use Ecto.Repo,
    otp_app: :aptdeco,
    adapter: Ecto.Adapters.Postgres
end
