$data = Get-Content -Path 'C:\Users\Thomas\REPOs\adventOfCode2023\Day2\Part1\input.txt'

$colorHash = @{
  "red" = 12;
  "green" = 13;
  "blue" = 14;
}

$BadGames = @()
$allGames = 0

$ElfGame = [ordered]@{}

# Store data into a hashtable
foreach ($game in $data){
  $gameNum = $game.Split(":")[0]
  $rolls   = $game.Split(":")[1]

  $ElfGame[$gameNum] = $rolls
}

foreach ($game in $ElfGame.GetEnumerator()) {
  [int]$GameNum = $($game.Key -replace "[^0-9]" , '')
  $Rolls = $game.value

  $allGames += $GameNum

  #Write-Host $gameNum
  #Write-Host $Rolls

  foreach ($roll in $Rolls) {
    $colorRoll = $roll.split(";")
    #Write-Host $colorRoll

    foreach ($color in $colorRoll) {
      $OneMore = $color.split(",").trim()
      #Write-Host $OneMore
      foreach ($i in $OneMore) {
        $count = $i.split(" ")[0]
        $col = $i.split(" ")[1]

        #Write-Host $count
        #Write-Host $col

        if ($colorHash["$col"] -lt $count) {
          $BadGames += $GameNum
        }
      }
    }
  }

}

$BadGamesUnique = $BadGames | Sort-Object -Unique

#Write-Host $BadGamesUnique 

foreach ($num in $BadGamesUnique) {
  $allGames -= $num
}

Write-Host $allGames