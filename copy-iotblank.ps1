
function copy-iotblank
{
    [CmdletBinding()]
    [Alias()]
    [OutputType([int])]
    Param
    (
        [Parameter(Mandatory=$true, 
                   ValueFromPipeline=$true,
                   ValueFromPipelineByPropertyName=$true, 
                   ValueFromRemainingArguments=$false, 
                   Position=0,
                   ParameterSetName='Parameter Set 1')]
        [ValidateSet("dnr.state.in.us","doc.state.in.us","doit.state.in.us","dor.state.in.us","dwd.state.in.us","fssa.state.in.us","idem.state.in.us","indot.state.in.us","isp.state.in.us","jtac.state.in.us","pen.doc.state.in.us","shared.state.in.us","state.in.us")]
        $targetDomain,

        # Param2 help description
        
        $TargetGPO
    )

    Begin
    {
    }
    Process
    {
    Copy-GPO -SourceName iotblank -SourceDomain doit.state.in.us -TargetName $TargetGPO -TargetDomain $TargetDomain -CopyAcl
    }
    End
    {
    }
}