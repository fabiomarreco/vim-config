Set-Alias -Name d -Value Get-ChildItemColorFormatWide
Set-Alias -Name dd -Value Get-ChildItemColor

function gs { git status }

Set-PoshPrompt -Theme C:\data\.config\marreco.omp.json

function sln { Get-Item *.sln | Select-Object -First 1 | ForEach-Object { devenv $_ }}


function pr ($target='master') { 
    vsts code pr create -t $target --open | ConvertFrom-Json
}

$global:kafka_dev = 'cdlapp14a-rj.modalmais.net.br:9092,cdlapp14b-rj.modalmais.net.br:9092,cdlapp14c-rj.modalmais.net.br:9092'


function fz () { 
  fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'
}

function touch ($file) { 
    if ($(test-path $file) -eq $false) { 
        Write-Output $null > $file
    }
}

function fs() {
    $gitRoot = git rev-parse --show-toplevel
    git status --porcelain | sed s/^...//g | % { join-path $gitroot $_ } | invoke-fzf -Preview 'bat --color=always --style=numbers --line-range=:500 {}' 
}

function nvs() { 
    nvim $(fs)
}

function nz() { nvim $(fz) }

function zz ($Initial) { z -ListFiles  | awk '{print $4}' | select -Skip 3 | fzf "--query=$Initial" | % { z $_ } }

function bz { bat $(fz) }


$global:ddpc1 = 'cdwappdpc1-rj01.modalmais.net.br'
$global:risco03 = 'risco03-rj01.modal.net.br'
