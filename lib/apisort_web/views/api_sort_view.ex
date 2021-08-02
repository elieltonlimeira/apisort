defmodule ApisortWeb.ApiSortView do
  use ApisortWeb, :view
  alias ApisortWeb.ApiSortView

  def render("index.json", %{apisorts: apisorts}) do
    %{data: render_many(apisorts, ApiSortView, "api_sort.json")}
  end

  def render("show.json", %{api_sort: api_sort}) do
    %{data: render_one(api_sort, ApiSortView, "api_sort.json")}
  end

  def render("api_sort.json", %{api_sort: api_sort}) do
    %{id: api_sort.id,
      list: api_sort.list}
  end
end
