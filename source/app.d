import std.stdio;
import std.conv;

import derelict.steamworks.steamworks;

void main()
{
	writeln("startup");

    DerelictSteamworks.load();

    writefln("steam running: %s",SteamAPI_IsSteamRunning());

    auto res = SteamAPI_Init();
    if(res)
    {
        writefln("steam loaded: %s",res);

        auto usr = SteamUser();
        writefln("steam usr: %s",usr);

        writefln("steam usr loggedIn: %s",usr.BLoggedOn());

        char[256] buff;
        res = usr.GetUserDataFolder(buff.ptr, 256);
        import std.c.string:strlen;
        writefln("steam usr path: (%s) '%s'",res,buff[0..strlen(buff.ptr)]);

        writefln("steam usr steamlevel: %s",usr.GetPlayerSteamLevel());

        auto friends = SteamFriends();
        writefln("name: %s",to!string(friends.GetPersonaName()));
        auto state = friends.GetPersonaState();
        writefln("state: %s",state);

        auto friendCnt = friends.GetFriendCount(EFriendFlags.k_EFriendFlagAll);
        writefln("friends cnt: %s",friendCnt);
        foreach(i; 0..friendCnt)
        {
            auto steamId = friends.GetFriendByIndex(i, EFriendFlags.k_EFriendFlagAll);

            auto friendRelation = friends.GetFriendRelationship(steamId);

            auto personState = friends.GetFriendPersonaState(steamId);

            auto level = friends.GetFriendSteamLevel(steamId);

            auto nick = friends.GetPlayerNickname(steamId);

            writefln("friends [%s]: %s,%s,%s,%s,'%s'",i, to!string(friends.GetFriendPersonaName(steamId)), friendRelation, personState, level, nick);
        }
    }

    SteamAPI_Shutdown();

    writefln("steam was shutdown");
}