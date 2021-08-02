defmodule Apisort.Repo.Migrations.CreateApisorts do
  use Ecto.Migration

  def change do
    create table(:apisorts) do
      add :list, {:array, :float}

      timestamps()
    end

  end
end
