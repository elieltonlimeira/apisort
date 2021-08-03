defmodule ApisortWeb.ApiSortController do
  use ApisortWeb, :controller

  alias Apisort.Challenge
  alias Apisort.Challenge.ApiSort

  action_fallback ApisortWeb.FallbackController

  def index(conn, _params) do
    apisorts = Challenge.list_apisorts()
    render(conn, "index.json", apisorts: apisorts)
  end
end
