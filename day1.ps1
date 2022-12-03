$p1 = Get-Content .\puzzle1_input.txt

# object to store results
$results = @()

# variable to track current calories
$calsNow = 0
    
foreach ($line in $p1) {
    
    # check if line is blank
    if ($line -ne '') {
        # if line is not blank, add calories to current
        $calsNow += $line
    } else {
        # if line is blank, add $calsNow value to result object
        $results += $calsNow

        #reset $calsNow to zero
        $calsNow = 0
    }
}

# sorty and display results in descending order
Write-Host "Day 1, puzzle 1 solution: " -ForegroundColor DarkYellow
$sortedResults = $results | Sort-Object -Descending
Write-Host "Top Elf Calories: $($sortedResults[0])" -ForegroundColor Green

# add top 3 results
$topThree = $sortedResults[0] + $sortedResults[1] + $sortedResults[2]

# display answer to puzzle 2
Write-Host "Day 1, puzzle 2 solution: " -ForegroundColor DarkYellow
Write-Host "Top 3 Elf Calories:" -ForegroundColor Green
Write-Host $sortedResults[0] -ForegroundColor Green
Write-Host $sortedResults[1] -ForegroundColor Green
Write-Host $sortedResults[2] -ForegroundColor Green
Write-Host "Sum: $($topThree.ToString())" -ForegroundColor Green


