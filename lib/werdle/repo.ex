defmodule Werdle.Repo do
  use Ecto.Repo,
    otp_app: :werdle,
    adapter: Ecto.Adapters.Postgres
end
