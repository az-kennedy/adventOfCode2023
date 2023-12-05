$data = Get-Content -Path 'C:\Users\Thomas\Documents\code\REPOS\adventOfCode2023\Day3\Part1\input.txt'

$sum = 0

function checkpoint-hash {
  param (
    [System.Collections.Hashtable]$hashTable
  )
  
  $funSum = 0

  $rowOne   = $hashTable[1]
  $rowTwo   = $hashTable[2]
  $rowThree = $hashTable[3]

  # Find the special character in row 2. We don't care about the other rows
  for ($i = 0; $i -lt $rowTwo.Count; $i++) {
    $rowTwoChar = $rowTwo[$i]

    if ($rowTwoChar -eq "*") {
      # Now find the numbers around the special character...
      $h = try{$i-1}catch{$i}
      $j = try{$i+1}catch{$i}

      # Row One...
      $match = [System.Text.RegularExpressions.Regex]::Match($rowOne, '\d+')
      if ($match.Success) {
          $firstNumber = $match.Value
          $startIndex = $match.Index
          $endIndex = $startIndex + $firstNumber.Length - 1

          if ($h -match '\d') {
            $funSum += [int]$rowOne[$startIndex..$endIndex]
          }
          
      }
    }
  }

  return $funSum  
}

$rowHash = @{}

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
    $rowHash[3] = $rowHash[2]
    $rowHash[2] = $rowHash[1]
    $rowHash[1] = $row
  }
  # Write-Host "----------------------------"
  # foreach ($row in $rowHash.GetEnumerator()) {
  #   Write-Host "$($row.key) : $($row.value)"
  # }
  # Write-Host "----------------------------"

  #Process Hash
  if($rowHash.Count -eq 3) {
    $sum += checkpoint-hash -hashTable $rowHash
  }
}



Write-Host $sum



#Print Hash
# foreach ($row in $rowHash.GetEnumerator()) {
#   Write-Host "$($row.key) : $($row.value)"
# }