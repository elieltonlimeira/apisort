alias Apisort.Repo
alias Apisort.Challenge.ApiSort
import GetNumbers

  Repo.insert! %ApiSort{
    list: GetNumbers.get_numbers
   }
