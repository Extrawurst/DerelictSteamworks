/*
 * Copyright (c) 2015 Derelict Developers
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are
 * met:
 *
 * * Redistributions of source code must retain the above copyright
 *   notice, this list of conditions and the following disclaimer.
 *
 * * Redistributions in binary form must reproduce the above copyright
 *   notice, this list of conditions and the following disclaimer in the
 *   documentation and/or other materials provided with the distribution.
 *
 * * Neither the names 'Derelict', 'DerelictILUT', nor the names of its contributors
 *   may be used to endorse or promote products derived from this software
 *   without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
 * TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
module derelict.steamworks.funcs;

private
{
    import derelict.util.system;
    import derelict.steamworks.types;
    import derelict.steamworks.interfaces;
}

extern(C) @nogc nothrow
{
    alias da_SteamAPI_Init = bool function();
    alias da_SteamAPI_Shutdown = void function();
    alias da_SteamAPI_IsSteamRunning = bool function();
    alias da_SteamUser = ISteamUser function();
    alias da_SteamFriends = ISteamFriends function();
    alias da_SteamUtils = ISteamUtils function();

    alias da_SteamAPI_ISteamFriends_GetFriendByIndex = uint64 function(intptr_t instancePtr, int iFriend, int iFriendFlags);
    alias da_SteamAPI_ISteamFriends_GetFriendPersonaName = const char * function(intptr_t instancePtr, CSteamID steamIDFriend);
}

__gshared
{
    da_SteamAPI_Init SteamAPI_Init;
    da_SteamAPI_Shutdown SteamAPI_Shutdown;
    da_SteamAPI_IsSteamRunning SteamAPI_IsSteamRunning;
    da_SteamUser SteamUser;
    da_SteamFriends SteamFriends;
    da_SteamUtils SteamUtils;

    da_SteamAPI_ISteamFriends_GetFriendByIndex SteamAPI_ISteamFriends_GetFriendByIndex;
    da_SteamAPI_ISteamFriends_GetFriendPersonaName SteamAPI_ISteamFriends_GetFriendPersonaName;
}