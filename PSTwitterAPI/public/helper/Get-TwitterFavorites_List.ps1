﻿function Get-TwitterFavorites_List {

<#
.SYNOPSIS
    Post, retrieve and engage with Tweets

.DESCRIPTION
    GET favorites/list
    
    Note: favorites are now known as likes.
    
    Returns the 20 most recent Tweets liked by the authenticating or specified user.

.PARAMETER user_id
    The ID of the user for whom to return results.

.PARAMETER screen_name
    The screen name of the user for whom to return results.

.PARAMETER count
    Specifies the number of records to retrieve. Must be less than or equal to 200; defaults to 20. The value of count is best thought of as a limit to the number of Tweets to return because suspended or deleted content is removed after the count has been applied.

.PARAMETER since_id
    Returns results with an ID greater than (that is, more recent than) the specified ID. There are limits to the number of Tweets which can be accessed through the API. If the limit of Tweets has occured since the since_id, the since_id will be forced to the oldest ID available.

.PARAMETER max_id
    Returns results with an ID less than (that is, older than) or equal to the specified ID.

.PARAMETER include_entities
    The entities node will be omitted when set to false .

.NOTES
    This helper function was generated by the information provided here:
    https://developer.twitter.com/en/docs/tweets/post-and-engage/api-reference/get-favorites-list

#>
    [CmdletBinding()]
    Param(
        [string]$user_id,
        [string]$screen_name,
        [string]$count,
        [string]$since_id,
        [string]$max_id,
        [string]$include_entities
    )
    Begin {

        [string]$Method      = 'GET'
        [string]$Resource    = '/favorites/list'
        [string]$ResourceUrl = 'https://api.twitter.com/1.1/favorites/list.json'

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
