defmodule ApisortWeb.ApiSortControllerTest do
  use ApisortWeb.ConnCase

  alias Apisort.Challenge
  alias Apisort.Challenge.ApiSort

  @create_attrs %{
    list: []
  }
  @update_attrs %{
    list: []
  }
  @invalid_attrs %{list: nil}

  def fixture(:api_sort) do
    {:ok, api_sort} = Challenge.create_api_sort(@create_attrs)
    api_sort
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all apisorts", %{conn: conn} do
      conn = get(conn, Routes.api_sort_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create api_sort" do
    test "renders api_sort when data is valid", %{conn: conn} do
      conn = post(conn, Routes.api_sort_path(conn, :create), api_sort: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.api_sort_path(conn, :show, id))

      assert %{
               "id" => id,
               "list" => []
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.api_sort_path(conn, :create), api_sort: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update api_sort" do
    setup [:create_api_sort]

    test "renders api_sort when data is valid", %{conn: conn, api_sort: %ApiSort{id: id} = api_sort} do
      conn = put(conn, Routes.api_sort_path(conn, :update, api_sort), api_sort: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.api_sort_path(conn, :show, id))

      assert %{
               "id" => id,
               "list" => []
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, api_sort: api_sort} do
      conn = put(conn, Routes.api_sort_path(conn, :update, api_sort), api_sort: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete api_sort" do
    setup [:create_api_sort]

    test "deletes chosen api_sort", %{conn: conn, api_sort: api_sort} do
      conn = delete(conn, Routes.api_sort_path(conn, :delete, api_sort))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.api_sort_path(conn, :show, api_sort))
      end
    end
  end

  defp create_api_sort(_) do
    api_sort = fixture(:api_sort)
    %{api_sort: api_sort}
  end
end
