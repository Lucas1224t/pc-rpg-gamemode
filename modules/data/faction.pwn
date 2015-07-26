/*******************************************************************************
* FILENAME :        modules/data/building.pwn
*
* DESCRIPTION :
*       Saves and Loads building data.
*
* NOTES :
*       This file should only contain information about building's data.
*       This is not intended to handle player entrances, extis and such.
*
*       Copyright Paradise Devs 2015.  All rights reserved.
*
* AUTHOR :    Larceny           START DATE :    25 Jul 15
*
*/

#include <YSI\y_hooks>

//------------------------------------------------------------------------------

#define MAX_FACTION_NAME    (32)
#define MAX_FACTION_RANKS   (10)

//------------------------------------------------------------------------------

forward OnFactionLoad();

//------------------------------------------------------------------------------

// enumaration of faction's data
enum e_faction_data
{
    // index
    e_faction_database_id,

    // Positions
    Float:e_faction_spawn_x,
    Float:e_faction_spawn_y,
    Float:e_faction_spawn_z,
    Float:e_faction_spawn_a,

    // Info
    e_faction_name[MAX_FACTION_NAME],
    e_faction_type,
    e_faction_max_ranks,
    e_faction_custom,
    e_faction_color,
    e_faction_skin[MAX_FACTION_RANKS]
}
static gFactionData[MAX_FACTIONS][e_faction_data];
static gFactionRankNames[MAX_FACTIONS][MAX_FACTION_RANKS][MAX_FACTION_NAME];
static gCreatedFaction;

//------------------------------------------------------------------------------

public OnFactionLoad()
{
    for(new i, j = cache_get_row_count(mysql); i < j; i++)
	{
		gFactionData[i][e_faction_database_id]    = cache_get_row_int(i, 0, mysql);

        gFactionData[i][e_faction_spawn_x]        = cache_get_row_float(i, 1, mysql);
		gFactionData[i][e_faction_spawn_y]        = cache_get_row_float(i, 2, mysql);
		gFactionData[i][e_faction_spawn_z]        = cache_get_row_float(i, 3, mysql);
		gFactionData[i][e_faction_spawn_a]        = cache_get_row_float(i, 4, mysql);

        cache_get_row(i, 5, gFactionData[i][e_faction_name], mysql);
		gFactionData[i][e_faction_type]           = cache_get_row_int(i, 6, mysql);
		gFactionData[i][e_faction_max_ranks]      = cache_get_row_int(i, 7, mysql);
		gFactionData[i][e_faction_custom]         = cache_get_row_int(i, 8, mysql);
		gFactionData[i][e_faction_color]          = cache_get_row_int(i, 9, mysql);

        for(new h = 0; h < MAX_FACTION_RANKS; h++)
            cache_get_row(i, (h + 10), gFactionRankNames[i][h], mysql);

        for(new h = 0; h < MAX_FACTION_RANKS; h++)
            gFactionData[i][e_faction_skin][h]    = cache_get_row_int(i, (h + 11 + MAX_FACTION_RANKS), mysql);

        gCreatedFaction++;
	}
    printf("Number of factions loaded: %d", gCreatedFaction);
    return 1;
}

//------------------------------------------------------------------------------

hook OnGameModeInit()
{
    mysql_pquery(mysql, "SELECT * FROM `factions`", "OnFactionLoad");
    return 1;
}

//------------------------------------------------------------------------------