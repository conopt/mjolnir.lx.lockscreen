#import <lauxlib.h>

// Cocoa Private API for lock screen (really, not suspend or sleep).
extern void SACLockScreenImmediate();

static int lockscreen(lua_State* L)
{
  SACLockScreenImmediate();
  return 1;
}

static const luaL_Reg util_lib[] =
{
  {"lockscreen", lockscreen},
};

int luaopen_mjolnir_lx_lockscreen_internal(lua_State* L)
{
  luaL_newlib(L, util_lib);
  return 1;
}
