/*******************************************************************************
* FILENAME :        modules/admin/commands.pwn
*
* DESCRIPTION :
*       Adds admins commands to the server.
*
* NOTES :
*       This file should only contain admin data.
*
*       Copyright Paradise Devs 2015.  All rights reserved.
*
*/

//------------------------------------------------------------------------------

YCMD:acmds(playerid, params[], help)
{
    if(GetPlayerHighestRank(playerid) < PLAYER_RANK_MODERATOR)
 		return SendPlayerErrorMessage(playerid, "Você não tem permissão.");

	SendClientMessage(playerid, COLOR_TITLE, "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Comandos Administrativos ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	if(GetPlayerHighestRank(playerid) >= PLAYER_RANK_MODERATOR)
        SendClientMessage(playerid, COLOR_RANK_MODERATOR, "* /ir - /puxar - /flip - /reparar - /ls - /sf - /lv");

	if(GetPlayerHighestRank(playerid) >= PLAYER_RANK_ADMIN)
        SendClientMessage(playerid, COLOR_RANK_ADMIN, "* /criarcar - /setmoney - /setjob");

	SendClientMessage(playerid, COLOR_TITLE, "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Comandos Administrativos ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	return 1;
}

//------------------------------------------------------------------------------

/***
 *
 *     #    #  ####  #####  ###### #####    ##   #####  ####  #####
 *     ##  ## #    # #    # #      #    #  #  #    #   #    # #    #
 *     # ## # #    # #    # #####  #    # #    #   #   #    # #    #
 *     #    # #    # #    # #      #####  ######   #   #    # #####
 *     #    # #    # #    # #      #   #  #    #   #   #    # #   #
 *     #    #  ####  #####  ###### #    # #    #   #    ####  #    #
 *
 */

 YCMD:ir(playerid, params[], help)
 {
 	if(GetPlayerHighestRank(playerid) < PLAYER_RANK_MODERATOR)
 		return SendPlayerErrorMessage(playerid, "Você não tem permissão.");

 	new targetid;
 	if(sscanf(params, "u", targetid))
 		return SendPlayerInfoMessage(playerid, "/ir [playerid]");

 	else if(!IsPlayerLogged(targetid))
 		return SendPlayerErrorMessage(playerid, "O jogador não está conectado.");

 	else if(targetid == playerid)
 		return SendPlayerErrorMessage(playerid, "Você não pode ir até você mesmo.");

 	new Float:x, Float:y, Float:z;
    GetPlayerPos(targetid, x, y, z);

    if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER)
        SetPlayerPos(playerid, x, y, z);
    else
        SetVehiclePos(GetPlayerVehicleID(playerid), x, y, z);

    SendAdminActionMessage(targetid, "%s veio até você.", GetPlayerNamef(playerid));
    SendAdminActionMessage(playerid, "Você foi até %s.", GetPlayerNamef(targetid));

 	return 1;
 }

//------------------------------------------------------------------------------

 YCMD:puxar(playerid, params[], help)
 {
 	if(GetPlayerHighestRank(playerid) < PLAYER_RANK_MODERATOR)
 		return SendPlayerErrorMessage(playerid, "Você não tem permissão.");

 	new targetid;
 	if(sscanf(params, "u", targetid))
 		return SendPlayerInfoMessage(playerid, "/puxar [playerid]");

 	else if(!IsPlayerLogged(targetid))
 		return SendPlayerErrorMessage(playerid, "O jogador não está conectado.");

 	else if(targetid == playerid)
 		return SendPlayerErrorMessage(playerid, "Você não pode puxar você mesmo.");

 	new Float:x, Float:y, Float:z;
    GetPlayerPos(playerid, x, y, z);

    if(GetPlayerState(targetid) != PLAYER_STATE_DRIVER)
        SetPlayerPos(targetid, x, y, z);
    else
        SetVehiclePos(GetPlayerVehicleID(targetid), x, y, z);

    SendAdminActionMessage(targetid, "%s puxou você.", GetPlayerNamef(playerid));
    SendAdminActionMessage(playerid, "Você puxou %s.", GetPlayerNamef(targetid));

 	return 1;
 }

//------------------------------------------------------------------------------

 YCMD:flip(playerid, params[], help)
 {
 	if(GetPlayerHighestRank(playerid) < PLAYER_RANK_MODERATOR)
 		return SendPlayerErrorMessage(playerid, "Você não tem permissão.");

    else if(!IsPlayerInAnyVehicle(playerid))
        return SendPlayerErrorMessage(playerid, "Você não está em um veículo.");

    new Float:a, vehicleid = GetPlayerVehicleID(playerid);
    GetVehicleZAngle(vehicleid, a);
    SetVehicleZAngle(vehicleid, a);
    SendAdminActionMessage(playerid, "Você flipou seu veículo.");

 	return 1;
 }

//------------------------------------------------------------------------------

YCMD:ls(playerid, params[], help)
{
 	if(GetPlayerHighestRank(playerid) < PLAYER_RANK_MODERATOR)
 		return SendPlayerErrorMessage(playerid, "Você não tem permissão.");

    if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER)
        SetPlayerPos(playerid, 1540.3774, -1675.6068, 13.5505);
    else
        SetVehiclePos(GetPlayerVehicleID(playerid), 1540.3774, -1675.6068, 13.5505);

    SetPlayerInterior(playerid, 0);
    SetPlayerVirtualWorld(playerid, 0);

 	return 1;
}

//------------------------------------------------------------------------------

YCMD:sf(playerid, params[], help)
{
	if(GetPlayerHighestRank(playerid) < PLAYER_RANK_MODERATOR)
		return SendPlayerErrorMessage(playerid, "Você não tem permissão.");

    if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER)
        SetPlayerPos(playerid, -1816.0549, 590.1733, 35.1641);
    else
        SetVehiclePos(GetPlayerVehicleID(playerid), -1816.0549, 590.1733, 35.1641);

    SetPlayerInterior(playerid, 0);
    SetPlayerVirtualWorld(playerid, 0);

	return 1;
}

//------------------------------------------------------------------------------

YCMD:lv(playerid, params[], help)
{
    if(GetPlayerHighestRank(playerid) < PLAYER_RANK_MODERATOR)
        return SendPlayerErrorMessage(playerid, "Você não tem permissão.");

    if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER)
        SetPlayerPos(playerid, 2023.5212, 1341.9235, 10.82035);
    else
        SetVehiclePos(GetPlayerVehicleID(playerid), 2023.5212, 1341.9235, 10.8203);

    SetPlayerInterior(playerid, 0);
    SetPlayerVirtualWorld(playerid, 0);

    return 1;
}

//------------------------------------------------------------------------------

/***
 *
 *       ##   #####  #    # # #    # #  ####  ##### #####    ##   #####  ####  #####
 *      #  #  #    # ##  ## # ##   # # #        #   #    #  #  #    #   #    # #    #
 *     #    # #    # # ## # # # #  # #  ####    #   #    # #    #   #   #    # #    #
 *     ###### #    # #    # # #  # # #      #   #   #####  ######   #   #    # #####
 *     #    # #    # #    # # #   ## # #    #   #   #   #  #    #   #   #    # #   #
 *     #    # #####  #    # # #    # #  ####    #   #    # #    #   #    ####  #    #
 *
 ***/

YCMD:criarcar(playerid, params[], help)
{
    if(GetPlayerHighestRank(playerid) < PLAYER_RANK_ADMIN)
        return SendPlayerErrorMessage(playerid, "Você não tem permissão.");

    new
  		idx,
  		iString[ 128 ];

  	if ( params[ 0 ] == '\0' )
  		return SendPlayerInfoMessage(playerid, "/criarcar [modeloid/nome]" );

  	idx = GetVehicleModelIDFromName(params);

  	if(idx == -1)
  	{
  		idx = strval(iString);

  		if (idx < 400 || idx > 611)
  			return SendPlayerErrorMessage(playerid, "Veículo inválido.");
  	}

  	new	Float:x, Float:y, Float:z, Float:a;
  	GetPlayerPos(playerid, x, y, z);
  	GetXYInFrontOfPlayer(playerid, x, y, 5.0);
  	GetPlayerFacingAngle(playerid, a);

    new vehicleid = CreateVehicle(idx, x, y, z + 2.0, a + 90.0, -1, -1, 5000);
    LinkVehicleToInterior(vehicleid, GetPlayerInterior(playerid));
    SetVehicleFuel(vehicleid, 100.0);

    SendAdminActionMessage(playerid, "Você criou um \"%s\" (ModeloID: %d, VeículoID: %d)", aVehicleNames[idx - 400], idx, vehicleid);
    return 1;
}

//------------------------------------------------------------------------------

YCMD:setmoney(playerid, params[], help)
{
   if(GetPlayerHighestRank(playerid) < PLAYER_RANK_ADMIN)
       return SendPlayerErrorMessage(playerid, "Você não tem permissão.");

   new targetid, value;
   if(sscanf(params, "ui", targetid, value))
       return SendPlayerInfoMessage(playerid, "/setmoney [playerid] [dinheiro]");

   else if(!IsPlayerLogged(targetid))
       return SendPlayerErrorMessage(playerid, "O jogador não está conectado.");

   SetPlayerCash(playerid, value);

   if(playerid != targetid)
       SendAdminActionMessage(targetid, "%s alterou seu dinheiro para $%s.", GetPlayerNamef(playerid), formatnumber(value));

   SendAdminActionMessage(playerid, "Você alterou o dinheiro de %s para $%s.", GetPlayerNamef(targetid), formatnumber(value));
   return 1;
}

//------------------------------------------------------------------------------

YCMD:setjob(playerid, params[], help)
{
   if(GetPlayerHighestRank(playerid) < PLAYER_RANK_ADMIN)
       return SendClientMessage(playerid, COLOR_ERROR, "* Você não tem permissão.");

   new targetid, value;
   if(sscanf(params, "ui", targetid, value))
       return SendClientMessage(playerid, COLOR_INFO, "* /setjob [playerid] [emprego]");

   else if(!IsPlayerLogged(targetid))
       return SendClientMessage(playerid, COLOR_ERROR, "* O jogador não está conectado.");

   new Job:job = Job:value;
   SetPlayerJobID(targetid, job);

   if(playerid != targetid)
       SendAdminActionMessage(targetid, "%s alterou seu emprego para %s.", GetPlayerNamef(playerid), GetJobName(job));

   SendAdminActionMessage(playerid, "Você alterou o emprego de %s para %s.", GetPlayerNamef(targetid), GetJobName(job));
   return 1;
}

//------------------------------------------------------------------------------

/***
 *
 *     #####  ###### #    # ###### #       ####  #####  ###### #####
 *     #    # #      #    # #      #      #    # #    # #      #    #
 *     #    # #####  #    # #####  #      #    # #    # #####  #    #
 *     #    # #      #    # #      #      #    # #####  #      #####
 *     #    # #       #  #  #      #      #    # #      #      #   #
 *     #####  ######   ##   ###### ######  ####  #      ###### #    #
 *
 */

YCMD:setrank(playerid, params[], help)
{
	if(!IsPlayerAdmin(playerid) || GetPlayerHighestRank(playerid) < PLAYER_RANK_DEVELOPER)
	   return SendPlayerErrorMessage(playerid, "Você não tem permissão.");

	new	targetid, rankName[9], option[8];

	if(sscanf(params, "us[9]s[8]", targetid, rankName, option))
    {
		SendPlayerInfoMessage(playerid, "/setrank [playerid] [nome do rank] [add / remover]");
		SendPlayerInfoMessage(playerid, "Ranks: donator, designer, beta, mod, super, admin, dev");
        return 1;
    }

    if(!strcmp(rankName, "donator", true))
    {
        if(!strcmp(option, "add", true))
        {
            if(targetid == playerid) {
                SendPlayerSuccessMessage(playerid, "Você alterou sua conta para donator com sucesso.");
            } else {
                SendPlayerSuccessMessage(playerid, "Conta de %s foi alterada para donator com sucesso.", GetPlayerNamef(targetid));
                SendPlayerSuccessMessage(targetid, "%s alterou sua conta para donator.", GetPlayerNamef(playerid));
            }

            SetPlayerRank(PLAYER_RANK_DONATOR, targetid, true);
        }
        else if(!strcmp(option, "remover", true))
        {
            if(targetid == playerid) {
                SendPlayerSuccessMessage(playerid, "Você removeu seu rank de donator com sucesso.");
            } else {
                SendPlayerSuccessMessage(playerid, "Conta de %s foi removida de donator com sucesso.", GetPlayerNamef(targetid));
                SendPlayerSuccessMessage(targetid, "%s removeu seu rank de donator.", GetPlayerNamef(playerid));
            }

            SetPlayerRank(PLAYER_RANK_DONATOR, targetid, false);
        }

        else SendPlayerErrorMessage(playerid, "Opção inválida.");
    }
    else if(!strcmp(rankName, "designer", true))
    {
        if(!strcmp(option, "add", true))
        {
            if(targetid == playerid) {
                SendPlayerSuccessMessage(playerid, "Você alterou sua conta para designer com sucesso.");
            } else {
                SendPlayerSuccessMessage(playerid, "Conta de %s alterada para designer com sucesso.", GetPlayerNamef(targetid));
                SendPlayerSuccessMessage(targetid, "%s alterou sua conta para designer.", GetPlayerNamef(playerid));
            }

            SetPlayerRank(PLAYER_RANK_DESIGNER, targetid, true);
        }
        else if(!strcmp(option, "remover", true))
        {
            if(targetid == playerid) {
                SendPlayerSuccessMessage(playerid, "Você removeu seu rank de designer com sucesso.");
            } else {
                SendPlayerSuccessMessage(playerid, "Conta de %s foi removida de designer com sucesso.", GetPlayerNamef(targetid));
                SendPlayerSuccessMessage(targetid, "%s removeu seu rank de designer.", GetPlayerNamef(playerid));
            }

            SetPlayerRank(PLAYER_RANK_DESIGNER, targetid, false);
        }
        else SendPlayerErrorMessage(playerid, "Opção inválida.");
    }
    else if(!strcmp(rankName, "beta", true))
    {
        if(!strcmp(option, "add", true))
        {
            if(targetid == playerid) {
                SendPlayerSuccessMessage(playerid, "Você alterou sua conta para beta-tester com sucesso.");
            } else {
                SendPlayerSuccessMessage(playerid, "Conta de %s alterada para beta-tester com sucesso.", GetPlayerNamef(targetid));
                SendPlayerSuccessMessage(targetid, "%s alterou sua conta para beta-tester.", GetPlayerNamef(playerid));
            }

            SetPlayerRank(PLAYER_RANK_BETATESTER, targetid, true);
        }
        else if(!strcmp(option, "remover", true))
        {
            if(targetid == playerid) {
                SendPlayerSuccessMessage(playerid, "Você removeu seu rank de beta-tester com sucesso.");
            } else {
                SendPlayerSuccessMessage(playerid, "Conta de %s foi removida de beta-tester com sucesso.", GetPlayerNamef(targetid));
                SendPlayerSuccessMessage(targetid, "%s removeu seu rank de beta-tester.", GetPlayerNamef(playerid));
            }

            SetPlayerRank(PLAYER_RANK_BETATESTER, targetid, false);
        }
        else SendPlayerErrorMessage(playerid, "Opção inválida.");
    }
    else if(!strcmp(rankName, "mod", true))
    {
        if(!strcmp(option, "add", true))
        {
            if(targetid == playerid) {
                SendPlayerSuccessMessage(playerid, "Você alterou sua conta para moderador com sucesso.");
            } else {
                SendPlayerSuccessMessage(playerid, "Conta de %s alterada para moderador com sucesso.", GetPlayerNamef(targetid));
                SendPlayerSuccessMessage(targetid, "%s alterou sua conta para moderador.", GetPlayerNamef(playerid));
            }

            SetPlayerRank(PLAYER_RANK_MODERATOR, targetid, true);
        }
        else if(!strcmp(option, "remover", true))
        {
            if(targetid == playerid) {
                SendPlayerSuccessMessage(playerid, "Você removeu seu rank de moderador com sucesso.");
            } else {
                SendPlayerSuccessMessage(playerid, "Conta de %s foi removida de moderador com sucesso.", GetPlayerNamef(targetid));
                SendPlayerSuccessMessage(targetid, "%s removeu seu rank de moderador.", GetPlayerNamef(playerid));
            }

            SetPlayerRank(PLAYER_RANK_MODERATOR, targetid, false);
        }
        else SendPlayerErrorMessage(playerid, "Opção inválida.");
    }
    else if(!strcmp(rankName, "super", true))
    {
        if(!strcmp(option, "add", true))
        {
            if(targetid == playerid) {
                SendPlayerSuccessMessage(playerid, "Você alterou sua conta para supervisor com sucesso.");
            } else {
                SendPlayerSuccessMessage(playerid, "Conta de %s alterada para supervisor com sucesso.", GetPlayerNamef(targetid));
                SendPlayerSuccessMessage(targetid, "%s alterou sua conta para supervisor.", GetPlayerNamef(playerid));
            }

            SetPlayerRank(PLAYER_RANK_SUPERVISOR, targetid, true);
        }
        else if(!strcmp(option, "remover", true))
        {
            if(targetid == playerid) {
                SendPlayerSuccessMessage(playerid, "Você removeu seu rank de supervisor com sucesso.");
            } else {
                SendPlayerSuccessMessage(playerid, "Conta de %s foi removida de supervisor com sucesso.", GetPlayerNamef(targetid));
                SendPlayerSuccessMessage(targetid, "%s removeu seu rank de supervisor.", GetPlayerNamef(playerid));
            }

            SetPlayerRank(PLAYER_RANK_SUPERVISOR, targetid, false);
        }
        else SendPlayerErrorMessage(playerid, "Opção inválida.");
    }
    else if(!strcmp(rankName, "admin", true))
    {
        if(!strcmp(option, "add", true))
        {
            if(targetid == playerid) {
                SendPlayerSuccessMessage(playerid, "Você alterou sua conta para administrador com sucesso.");
            } else {
                SendPlayerSuccessMessage(playerid, "Conta de %s alterada para administrador com sucesso.", GetPlayerNamef(targetid));
                SendPlayerSuccessMessage(targetid, "%s alterou sua conta para administrador.", GetPlayerNamef(playerid));
            }

            SetPlayerRank(PLAYER_RANK_ADMIN, targetid, true);
        }
        else if(!strcmp(option, "remover", true))
        {
            if(targetid == playerid) {
                SendPlayerSuccessMessage(playerid, "Você removeu seu rank de administrador com sucesso.");
            } else {
                SendPlayerSuccessMessage(playerid, "Conta de %s foi removida de administrador com sucesso.", GetPlayerNamef(targetid));
                SendPlayerSuccessMessage(targetid, "%s removeu seu rank de administrador.", GetPlayerNamef(playerid));
            }

            SetPlayerRank(PLAYER_RANK_ADMIN, targetid, false);
        }
        else SendPlayerErrorMessage(playerid, "Opção inválida.");
    }
    else if(!strcmp(rankName, "dev", true))
    {
        if(!strcmp(option, "add", true))
        {
            if(targetid == playerid) {
                SendPlayerSuccessMessage(playerid, "Você alterou sua conta para developer com sucesso.");
            } else {
                SendPlayerSuccessMessage(playerid, "Conta de %s alterada para developer com sucesso.", GetPlayerNamef(targetid));
                SendPlayerSuccessMessage(targetid, "%s alterou sua conta para developer.", GetPlayerNamef(playerid));
            }

            SetPlayerRank(PLAYER_RANK_DEVELOPER, targetid, true);
        }
        else if(!strcmp(option, "remover", true))
        {
            if(targetid == playerid) {
                SendPlayerSuccessMessage(playerid, "Você removeu seu rank de developer com sucesso.");
            } else {
                SendPlayerSuccessMessage(playerid, "Conta de %s foi removida de developer com sucesso.", GetPlayerNamef(targetid));
                SendPlayerSuccessMessage(targetid, "%s removeu seu rank de developer.", GetPlayerNamef(playerid));
            }

            SetPlayerRank(PLAYER_RANK_DEVELOPER, targetid, false);
        }
        else SendPlayerErrorMessage(playerid, "Opção inválida.");
    }

	return 1;
}
