defmodule Apisort.Repo do
  use Ecto.Repo,
    otp_app: :apisort,
    adapter: Ecto.Adapters.Postgres
end
