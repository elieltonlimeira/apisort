defmodule ApisortWeb.ApiSortController do
  use ApisortWeb, :controller

  action_fallback ApisortWeb.FallbackController

  def index(conn, _params) do
    list = GetNumbers.get_numbers()
    json(conn, %{data: list})
  end
end
