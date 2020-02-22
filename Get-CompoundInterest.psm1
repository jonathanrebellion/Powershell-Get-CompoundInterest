<#
.SYNOPSIS
 Get-CompoundInterest retrieves balance information after a period of time.
.DESCRIPTION
 Get-CompoundInterest retrieves balance infomation after a period of time.
.PARAMETER StartingBalance
 StartingBalnce is the starting balance.
.PARAMETER Years
 Years is how many years to calculate for.
.PARAMETER InterestRate
 InterestRate is the interest rate.
.Example
 Get-CompoundInterest -StartingBalance 1000 -Years 10 -InterestRate 1

 Finds the interest rate of 1000 after 10 years at 1% interest.
#>
function Get-CompoundInterest{
    Param (
        [Parameter(Mandatory=$True)]
        [decimal]$StartingBalance,
        [decimal]$Years,
        [decimal]$InterestRate
    )

    #Variables
        $NewBalance = $StartingBalance
        $YearRange = 1..($Years)

    Write-Verbose "Starting Balance is $StartingBalance"
    Write-Verbose "Years is $Years"
    Write-Verbose "Interest Rate is $InterestRate"

    foreach ($year in $YearRange){

        if ($year -le $years) {
            $NewBalance = $NewBalance * (1+($InterestRate / 100))
            $NewBalance = [math]::Round($NewBalance,2)
            [String]$BalanceOutput = "$"+$NewBalance
            Write-Host "After Year $year the balance is $BalanceOutput"
        }
    }
    }