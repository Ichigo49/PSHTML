Function head {
    <#
    .SYNOPSIS
    Generates a <head> HTML tag.

    .DESCRIPTION

    The <head> element is a container for all the head elements.

    The <head> element can include a title for the document, scripts, styles, meta information, and more.

    The following elements can go inside the <head> element:

    <title> (this element is required in an HTML document)
    <style>
    <base>
    <link>
    <meta>
    <script>
    <noscript>

    (Source --> https://www.w3schools.com/tags/tag_head.asp)

    .PARAMETER Class
    Allows to specify one (or more) class(es) to assign the html element.
    More then one class can be assigned by seperating them with a white space.

    .PARAMETER Id
    Allows to specify an id to assign the html element.

    .PARAMETER Style
    Allows to specify in line CSS style to assign the html element.

    .PARAMETER Content
    Allows to add child element(s) inside the current opening and closing HTML tag(s).

    .NOTES
    Current version 2.0
    History:
        2018.10.10;ichigo49; Updated to version 2.0
        2018.04.10;Stephanevg; Added parameters
        2018.04.01;Stephanevg;Creation.
    .LINK
        https://github.com/Stephanevg/PSHTML
#>
Param(
    [Parameter(
        ValueFromPipeline = $true,
        Mandatory = $false,
        Position = 0
    )]
    $Content,

    [Parameter(Position = 1)]
    [String]$Class,

    [Parameter(Position = 2)]
    [String]$Id,

    [Parameter(Position = 3)]
    [String]$Style,

    [Parameter(Position = 4)]
    [Hashtable]$Attributes
)

    $CommonParameters = "tagname" + [System.Management.Automation.PSCmdlet]::CommonParameters + [System.Management.Automation.PSCmdlet]::OptionalCommonParameters
    $CustomParameters = $PSBoundParameters.Keys | ? { $_ -notin $CommonParameters }
        
    $htmltagparams = @{}
    $tagname = "head"
    
    if($CustomParameters){

        foreach ($entry in $CustomParameters){

            if($entry -eq "content"){
                $htmltagparams.$entry = $PSBoundParameters[$entry]
            }else{
                $htmltagparams.$entry = "{0}" -f $PSBoundParameters[$entry]
            }

        }

        if($Attributes){
            $htmltagparams += $Attributes
        }

        Set-HtmlTag -TagName $tagname -Attributes $htmltagparams -TagType nonVoid
    }
}
