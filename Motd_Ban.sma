#include
#include

#define PLUGIN "fb_forwards"
#define VERSION "0.3"
#define AUTHOR "kanagava + Spieler"


forward fbans_player_banned_pre(id, userid)
forward amxbans_player_banned(id, bid)
forward fbans_player_banned_post(id, userid, bid)


public plugin_init()
{
register_plugin(PLUGIN, VERSION, AUTHOR)
}

public fbans_player_banned_pre(id, userid)
{
server_cmd("amx_screen #%d 3", userid)
}

public amxbans_player_banned(id, bid)
{

static data[1]
data[0] = bid
set_task(3.0, "show", id, data, 1) // тут менять задержку
}

public fbans_player_banned_post(id, userid, bid)
{
// тут ничего не делаем вроде как :)
}

public show(data[], id)
{
if(is_user_connected(id))
{
static url[128]
formatex(url, 127, "http://site.ru/bans/...d&adm=0&lang=ru", data[0])
show_motd( data[0], url, "You are banned")
}
}

public client_disconnect(id) remove_task(id)
