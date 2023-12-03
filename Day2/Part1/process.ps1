$data = Get-Content -Path 'C:\Users\Thomas\REPOs\adventOfCode2023\Day2\Part1\input.txt'

$colorHash = @{
  "red" = 12;
  "green" = 13;
  "blue" = 14;
}

$GoodGames = @()

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

        Write-Host $count
        Write-Host $col

        if ($colorHash["$col"] -lt $count) {
          $BadGames += $GameNum
        }
      }
    }
  }

}

Write-Host $GoodGames


# foreach ($key in $ElfGame.Keys) {
#   Write-Host "$key : $($ElfGame[$key])"
# }




  # $assumption = $true
  # #Write-Host $rolls
  # foreach ($roll in $rolls) {
  #   $colorRoll = $roll.split(";")
  #   Write-Host $colorRoll


    # foreach ($color in $colorRoll){
    #   Write-Host $color
    #   $split = $color.split(" ")
    #   #Write-Host $split
    #   [int]$num = $split[0].trim()
    #   $col = $split[1].trim()

    #   #Write-Host $num
    #   #Write-Host $col

    #   if (($col -eq "red") -and ($num -gt $red)) {
    #     $assumption = $false
    #   }else {
    #     $assumption = $true
    #   }
    #   if (($col -eq "green") -and ($num -gt $green)) {
    #     $assumption = $false
    #   } else {
    #     $assumption = $true
    #   }
    #   if (($col -eq "blue") -and ($num -gt $blue)) {
    #     $assumption = $false
    #   } else {
    #     $assumption = $true
    #   }
    #   if ($assumption) {
    #     $gameNumSum += [int]$game[5]
    #   }

    # }
#   }
# }


# foreach ($game in $games){
#   $rolls = $game.split(";")
#   foreach ($roll in $rolls){
#     $assumption = $true
#     Write-Host $roll
#     $colors = $roll.split(",")
#     foreach ($color in $colors){
#       #Write-Host $color
#       $split = $color.split(" ")
#       #Write-Host $split
#       [int]$num = $split[0].trim()
#       $col = $split[1].trim()

#       #Write-Host $num
#       #Write-Host $col

#       if (($col -eq "red") -and ($num -gt $red)) {
#         $assumption = $false
#       }else {
#         $assumption = $true
#       }
#       if (($col -eq "green") -and ($num -gt $green)) {
#         $assumption = $false
#       } else {
#         $assumption = $true
#       }
#       if (($col -eq "blue") -and ($num -gt $blue)) {
#         $assumption = $false
#       } else {
#         $assumption = $true
#       }
#     }
#     if ($assumption) {
#       $gameNumSum += [int]$game[5]
#     }
#   }
# }

# Write-Host $gameNumSum
