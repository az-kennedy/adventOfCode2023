$data = Get-Content -Path 'C:\Users\Thomas\Documents\code\REPOS\adventOfCode2023\Day3\Part1\input.txt'

$sum = 0

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
  Write-Host "----------------------------"
  foreach ($row in $rowHash.GetEnumerator()) {
    Write-Host "$($row.key) : $($row.value)"
  }
  Write-Host "----------------------------"


}



#Print Hash
# foreach ($row in $rowHash.GetEnumerator()) {
#   Write-Host "$($row.key) : $($row.value)"
# }