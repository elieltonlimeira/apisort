defmodule Apisort.ChallengeTest do
  use Apisort.DataCase

  alias Apisort.Challenge

  describe "apisorts" do
    alias Apisort.Challenge.ApiSort

    @valid_attrs %{list: []}
    @update_attrs %{list: []}
    @invalid_attrs %{list: nil}

    def api_sort_fixture(attrs \\ %{}) do
      {:ok, api_sort} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Challenge.create_api_sort()

      api_sort
    end

    test "list_apisorts/0 returns all apisorts" do
      api_sort = api_sort_fixture()
      assert Challenge.list_apisorts() == [api_sort]
    end

    test "get_api_sort!/1 returns the api_sort with given id" do
      api_sort = api_sort_fixture()
      assert Challenge.get_api_sort!(api_sort.id) == api_sort
    end

    test "create_api_sort/1 with valid data creates a api_sort" do
      assert {:ok, %ApiSort{} = api_sort} = Challenge.create_api_sort(@valid_attrs)
      assert api_sort.list == []
    end

    test "create_api_sort/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Challenge.create_api_sort(@invalid_attrs)
    end

    test "update_api_sort/2 with valid data updates the api_sort" do
      api_sort = api_sort_fixture()
      assert {:ok, %ApiSort{} = api_sort} = Challenge.update_api_sort(api_sort, @update_attrs)
      assert api_sort.list == []
    end

    test "update_api_sort/2 with invalid data returns error changeset" do
      api_sort = api_sort_fixture()
      assert {:error, %Ecto.Changeset{}} = Challenge.update_api_sort(api_sort, @invalid_attrs)
      assert api_sort == Challenge.get_api_sort!(api_sort.id)
    end

    test "delete_api_sort/1 deletes the api_sort" do
      api_sort = api_sort_fixture()
      assert {:ok, %ApiSort{}} = Challenge.delete_api_sort(api_sort)
      assert_raise Ecto.NoResultsError, fn -> Challenge.get_api_sort!(api_sort.id) end
    end

    test "change_api_sort/1 returns a api_sort changeset" do
      api_sort = api_sort_fixture()
      assert %Ecto.Changeset{} = Challenge.change_api_sort(api_sort)
    end
  end
end
