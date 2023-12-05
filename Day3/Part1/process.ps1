$data = Get-Content -Path 'C:\Users\Thomas\REPOs\adventOfCode2023\Day3\Part1\input.txt'

$sum = 0

function checkpoint-hash {
  param (
    # Hash Table
    [Parameter(Mandatory=$true)]
    [System.Collections.Hashtable]
    $hashTable
  )
  
  $funSum = 0

  $rowOne   = $hashTable[1]
  $rowTwo   = $hashTable[2]
  $rowThree = $hashTable[3]
  Write-Host "RowOne:   $rowOne"
  Write-Host "RowTwo:   $rowTwo"
  Write-Host "RowThree: $rowThree"



  # Find the special character in row 2. We don't care about the other rows
  for ($i = 0; $i -lt $rowTwo.Length; $i++) {
    $rowTwoChar = $rowTwo[$i]
    Write-Output $rowTwoChar

    if ($rowTwoChar -eq "*") {
      # Now find the numbers around the special character...
      $h = try{$i-1}catch{$i}
      $j = try{$i+1}catch{$i}

      Write-Host "h: $h"
      Write-Host "j: $j"

      # Row One...
      #$match = [System.Text.RegularExpressions.Regex]::Match($rowOne, '\d+')
      $numbers = $rowOne | Select-String -Pattern '\d+' -AllMatches | % { $_.Matches } | % { $_.Value }
      #$numbers | ForEach-Object { Write-Output "Extracted number: $_" }

      #Write-Host "Matches: $numbers"

      if ($numbers) {
        $firstNumber = $match.Value
        $startIndex = $match.Index
        $endIndex = $startIndex + $firstNumber.Length

        if ($rowOne[$h] -match '\d') {
          try {
            $funSum += [int]$rowOne.substring($startIndex, $endIndex)
            #Write-Host "FunSum: $funSum"
          }
          catch {
            continue
          }
        }
        if ($rowOne[$j] -match '\d') {
          try {
            $funSum += [int]$rowOne.substring($startIndex, $endIndex)
            Write-Host "FunSum: $funSum"
          }
          catch {
            continue
          }
        }
      }
    }
  }

  return $funSum  
}

$rowHash = @{}
$tempHash = @{}

foreach ($row in $data) {
  # Populate Hash...
  if ($rowHash.Count -eq 0) {
    $rowHash[1] = $row
  } elseif ($rowHash.Count -eq 1) {
    $rowHash[2] = $row
  } elseif ($rowHash.Count -eq 2) {
    $rowHash[3] = $row
  }elseif ($rowHash.Count -eq 3) {
    #Add new row, take one out, shift rows
    $tempHash[1] = $rowHash[2]
    $tempHash[2] = $rowHash[3]
    $tempHash[3] = $row

    $rowHash = $tempHash
  }
  # Write-Host "----------------------------"
  # foreach ($row in $rowHash.GetEnumerator()) {
  #   Write-Host "$($row.key) : $($row.value)"
  # }
  # Write-Host "----------------------------"

  #Process Hash
  #Write-Output "$($rowHash.Count)"
  #Write-Output "$rowHash"
  if($rowHash.Count -eq 3) {
    $value = checkpoint-hash -hashTable $rowHash
    #$sum += $value
    Write-Host " "
    #Write-Output "Value: $value"
  }
}



Write-Host $sum



#Print Hash
# foreach ($row in $rowHash.GetEnumerator()) {
#   Write-Host "$($row.key) : $($row.value)"
# }