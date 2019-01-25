﻿function Send-TwitterAccount_UpdateProfileBanner {

<#
.SYNOPSIS
    Manage account settings and profile

.DESCRIPTION
    POST account/update_profile_banner
    
    Uploads a profile banner on behalf of the authenticating user. More information about sizing variations can be found in User Profile Images and Banners and GET users / profile_banner.
    
    Profile banner images are processed asynchronously. The profile_banner_url and its variant sizes will not necessary be available directly after upload.
    
    HTTP Response Codes
    
    Code(s) Meaning
    200, 201, 202 Profile banner image successfully uploaded
    400 Either an image was not provided, or the image data could not be processed
    422 The image could not be resized, or is too large.

.PARAMETER banner
    The Base64-encoded or raw image data being uploaded as the user's new profile banner.

.PARAMETER width
    The width of the preferred section of the image being uploaded in pixels. Use with height , offset_left , and offset_top to select the desired region of the image to use.

.PARAMETER height
    The height of the preferred section of the image being uploaded in pixels. Use with width , offset_left , and offset_top to select the desired region of the image to use.

.PARAMETER offset_left
    The number of pixels by which to offset the uploaded image from the left. Use with height , width , and offset_top to select the desired region of the image to use.

.PARAMETER offset_top
    The number of pixels by which to offset the uploaded image from the top. Use with height , width , and offset_left to select the desired region of the image to use.

.NOTES
    This helper function was generated by the information provided here:
    https://developer.twitter.com/en/docs/accounts-and-users/manage-account-settings/api-reference/post-account-update_profile_banner

#>
    [CmdletBinding()]
    Param(
        [string]$banner,
        [string]$width,
        [string]$height,
        [string]$offset_left,
        [string]$offset_top
    )
    Begin {

        [string]$Method      = 'POST'
        [string]$Resource    = '/account/update_profile_banner'
        [string]$ResourceUrl = 'https://api.twitter.com/1.1/account/update_profile_banner.json'

        [hashtable]$Parameters = $PSBoundParameters
                   $CmdletBindingParameters | ForEach-Object { $Parameters.Remove($_) }

    }
    Process {

        If (-Not $OAuthSettings) { $OAuthSettings = Get-TwitterOAuthSettings -Resource $Resource }
        Invoke-TwitterAPI -Method $Method -ResourceUrl $ResourceUrl -Resource $Resource -Parameters $Parameters -OAuthSettings $OAuthSettings

    }
    End {

    }
}
