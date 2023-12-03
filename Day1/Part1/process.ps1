$data = Get-Content -Path 'C:\Users\Thomas\Documents\code\REPOS\adventOfCode2023\Day1\Part1\input.txt'

$sum = 0

foreach ($code in $data){
  $num = ($code -replace "[^0-9]" , '')
  
  if($num.Length -eq 1){
    $num = $num + $num
  }

  if ($num.Length -gt 2) {
    $num = $num[0] + $num[-1]
  }

  $sum += [int]$num
}

Write-Output $sum