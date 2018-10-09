Function header {
    <#
    .SYNOPSIS
    
    Generates a <header> HTML tag.

    .DESCRIPTION


    The <header> element represents a container for introductory content or a set of navigational links.

    A <header> element typically contains:

    one or more heading elements (<h1> - <h6>)
    logo or icon
    authorship information
    You can have several <header> elements in one document.

    (Source -> https://www.w3schools.com/tags/tag_header.asp)

    .PARAMETER Class
    Allows to specify one (or more) class(es) to assign the html element.
    More then one class can be assigned by seperating them with a white space.

    .PARAMETER Id
    Allows to specify an id to assign the html element.

    .PARAMETER Style
    Allows to specify in line CSS style to assign the html element.

    .PARAMETER Content
    Allows to add child element(s) inside the current opening and closing HTML tag(s).


    .EXAMPLE
    header {
            h1 "This is h1 Title in header"
            h2 "This is h2 Title in header"
            p "Some text in paragraph"
    }

    Generates the following code

    <header>
        <h1>
        This is h1 Title in header
        </h1>
        <h2>
        This is h2 Title in header
        </h2>
        <p>
        Some text in paragraph
        </p>
    </header>


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
        $tagname = "header"
        
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
