$data = Get-Content -Path 'C:\Users\Thomas\Documents\code\REPOS\adventOfCode2023\Day2\Part1\input.txt'

$red = 12
$green = 13
$blue = 14
$gameNumSum = 0

foreach ($game in $data){
  $rolls = $game.Split(":")[1]
  $assumption = $true
  #Write-Host $rolls
  foreach ($roll in $rolls) {
    $colorRoll = $roll.split(";")
    #Write-Host $colorRoll
    foreach ($color in $colorRoll){
      Write-Host $color
      $split = $color.split(" ")
      #Write-Host $split
      [int]$num = $split[0].trim()
      $col = $split[1].trim()

      #Write-Host $num
      #Write-Host $col

      if (($col -eq "red") -and ($num -gt $red)) {
        $assumption = $false
      }else {
        $assumption = $true
      }
      if (($col -eq "green") -and ($num -gt $green)) {
        $assumption = $false
      } else {
        $assumption = $true
      }
      if (($col -eq "blue") -and ($num -gt $blue)) {
        $assumption = $false
      } else {
        $assumption = $true
      }
      if ($assumption) {
        $gameNumSum += [int]$game[5]
      }

    }
  }
}

Write-Host $gameNumSum







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
