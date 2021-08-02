defmodule ApisortWeb.ApiSortController do
  use ApisortWeb, :controller

  alias Apisort.Challenge
  alias Apisort.Challenge.ApiSort

  action_fallback ApisortWeb.FallbackController

  def index(conn, _params) do
    apisorts = Challenge.list_apisorts()
    render(conn, "index.json", apisorts: apisorts)
  end

  def create(conn, %{"api_sort" => api_sort_params}) do
    with {:ok, %ApiSort{} = api_sort} <- Challenge.create_api_sort(api_sort_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.api_sort_path(conn, :show, api_sort))
      |> render("show.json", api_sort: api_sort)
    end
  end

  def show(conn, %{"id" => id}) do
    api_sort = Challenge.get_api_sort!(id)
    render(conn, "show.json", api_sort: api_sort)
  end

  def update(conn, %{"id" => id, "api_sort" => api_sort_params}) do
    api_sort = Challenge.get_api_sort!(id)

    with {:ok, %ApiSort{} = api_sort} <- Challenge.update_api_sort(api_sort, api_sort_params) do
      render(conn, "show.json", api_sort: api_sort)
    end
  end

  def delete(conn, %{"id" => id}) do
    api_sort = Challenge.get_api_sort!(id)

    with {:ok, %ApiSort{}} <- Challenge.delete_api_sort(api_sort) do
      send_resp(conn, :no_content, "")
    end
  end
end
