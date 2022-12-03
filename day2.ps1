<#

A - Opponent Rock
B - Opponent Paper
C - Opponent Scissors

X - Rock
Y - Paper
Z - Scissors

Rock Score - 1
Paper Score - 2
Scissors Score - 3

lose - 0
draw - 3
win - 6

#>

$day2Input = Get-Content .\day2_input.txt

$totalScore = 0
$resultLose = 'X'
$resultDraw = 'Y'
$resultWin = 'Z'

$opRock = 'A'
$opPaper = 'B'
$opScissors = 'C'

# puzzle 2
# x = win
# y = draw
# z = lose

foreach ($line in $day2Input) {
    $lineScore = 0
    $resultScore = 0

    # get individual plays
    $opPlay = $line.ToCharArray()[0]
    $desiredResult = $line.ToCharArray()[2]

    # determine my play
    switch ($opPlay) {
        { $_ -eq $opRock -and $desiredResult -eq $resultWin } { $mePlay = 'paper' } 
        { $_ -eq $opPaper -and $desiredResult -eq $resultDraw } { $mePlay = 'paper' }
        { $_ -eq $opScissors -and $desiredResult -eq $resultLose } { $mePlay = 'paper' }
        
        { $_ -eq $opRock -and $desiredResult -eq $resultLose } { $mePlay = 'scissors' }
        { $_ -eq $opPaper -and $desiredResult -eq $resultWin } { $mePlay = 'scissors' }
        { $_ -eq $opScissors -and $desiredResult -eq $resultDraw } { $mePlay = 'scissors' }
        
        { $_ -eq $opRock -and $desiredResult -eq $resultDraw } { $mePlay = 'rock' }
        { $_ -eq $opPaper -and $desiredResult -eq $resultLose } { $mePlay = 'rock' }
        { $_ -eq $opScissors -and $desiredResult -eq $resultWin } { $mePlay = 'rock' }

        
    }
    
    # get score for win/lose/draw
    switch ($opPlay) {
        # draw
        { $_ -eq $opRock -and $mePlay -eq 'rock' } { $resultScore = 3 }
        { $_ -eq $opPaper -and $mePlay -eq 'paper' } { $resultScore = 3 }
        { $_ -eq $opScissors -and $mePlay -eq 'scissors' } { $resultScore = 3 }

        # win
        { $_ -eq $opRock -and $mePlay -eq 'paper' } { $resultScore = 6 }
        { $_ -eq $opPaper -and $mePlay -eq 'scissors' } { $resultScore = 6 }
        { $_ -eq $opScissors -and $mePlay -eq 'rock' } { $resultScore = 6 }

        # lose
        { $_ -eq $opRock -and $mePlay -eq 'scissors' } { $resultScore = 0 }
        { $_ -eq $opPaper -and $mePlay -eq 'rock' } { $resultScore = 0 }
        { $_ -eq $opScissors -and $mePlay -eq 'paper' } { $resultScore = 0 }
    }
    
    # get shape score
    switch ($mePlay) {
        'rock' { $shapeScore = 1 }
        'paper' { $shapeScore = 2 }
        'scissors' { $shapeScore = 3 }
    }

    $lineScore = $resultScore + $shapeScore
    $totalScore += $lineScore

    Write-Verbose "Op: $opPlay / DesiredResult:$desiredResult / Me: $mePlay - ResultScore:$($resultScore.ToString())/LineScore:$($lineScore.ToString())" -Verbose


}

Write-Verbose "Puzzle 1, totalScore: $($totalScore.ToString())" -Verbose
