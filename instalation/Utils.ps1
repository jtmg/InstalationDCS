# method to indicate if a command is installed
function Check-Command($cmdname)
{
    return [bool](Get-Command -Name $cmdname -ErrorAction SilentlyContinue)
}

# method to check if the software is installed
function Install-Program ($program)
{
    if (-Not (Check-Command($program)))
    {
        scoop install -g $program
    }else
    {
        echo "$program already exists"
    }
# see case if is to update the tecnologies
}

function InitScoop 
{
if (-Not(Check-Command("scoop")))
{ 
    mkdir c:\dev
    [environment]::setEnvironmentVariable('SCOOP_GLOBAL','C:\dev\','Machine')
    $env:SCOOP_GLOBAL='C:\dev\'
    Invoke-Expression (new-object net.webclient).downloadstring('https://get.scoop.sh')
    
    scoop install git
    scoop bucket add java https://github.com/se35710/scoop-java
    scoop bucket add extras https://github.com/lukesampson/scoop-extras.git
    #scoop install -g openjdk
    scoop install -g vcredist2017
}

}