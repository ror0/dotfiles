/* RohanFile */

/* appearance */
static const char font[]            = "-*-stlarch-medium-r-*-*-10-*-*-*-*-*-*-*" "," "-*-terminus-medium-r-*-*-12-*-*-*-*-*-*-*";
static const char colors[MAXCOLORS][ColLast][8] = {
	/* border     fg         bg       */
	{ "#202020", "#777777", "#000000" }, /* 0 = normal */
	{ "#6096bf", "#ffffff", "#000000" }, /* 1 = selected */
	{ "#ff0000", "#ff0000", "#000000" }, /* 2 = urgent */
	{ "#222222", "#44cc44", "#000000" }, /* 3 = green */
	{ "#222222", "#ff995c", "#000000" }, /* 4 = yellow */
	{ "#222222", "#6096bf", "#000000" }, /* 5 = cyan */
	{ "#222222", "#7E62B3", "#000000" }, /* 6 = magenta */
	{ "#222222", "#e33333", "#000000" }, /* 7 = red */
};
static const unsigned int borderpx  = 2;        /* border pixel of windows */
static const unsigned int snap      = 8;        /* snap pixel */
static const Bool showbar           = True;     /* False means no bar */
static const Bool showsystray       = True;     /* False means no systray */
static const Bool topbar            = True;     /* False means bottom bar */
static const Bool clicktofocus      = True;     /* Change focus only on click */
static const Bool viewontag         = True;     /* Switch view on tag switch */

static const Rule rules[] = {
	/* class          instance     title       tags mask     isfloating   iscentred   monitor */
	{ "Gimp",         NULL,        NULL,       0,            True,        False,      -1 },
	{ "Vlc",          NULL,        NULL,       0,            True,        False,       -1 },
	{ "XFontSel",     NULL,        NULL,       0,            True,        False,       -1 },
};

/* layout(s) */
static const float mfact      = 0.5;   /* factor of master area size [0.05..0.95] */
static const int nmaster      = 1;     /* number of clients in master area */
static const Bool resizehints = False; /* True means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ " \uE002  | ",      tile },        /* first entry is default */
	{ " \uE001  | ",      monocle },
	{ " \uE010  | ",      NULL },        /* no layout function means floating behavior */
	{ " \uE003  | ",      bstack },
	{ " \uE005  | ",      gaplessgrid },
	{ " \uE009  | ",      pidgin },
};

/* tagging */
static const Tag tags[] = {
	/* name                layout           mfact    nmaster */
	{ "\uE022 main  |",     &layouts[0],     -1,      -1 },
	{ "\uE021 dev  |",      &layouts[0],     -1,      -1 },
	{ "\uE017 work  |",     &layouts[0],     -1,      -1 },
	{ "\uE19a play  |",     &layouts[1],     0.83,    -1 },
	{ "\uE027 misc  |",     &layouts[2],     -1,      -1 }, };

/* key definitions */
#define ALTKEY Mod1Mask
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* commands */
static const char terminal[]       = "urxvt";
static const char scratchpadname[] = "scratchy";

static const char *dmenucmd[]      = { "dmenu_run", "-i", "-p", "Run command:", "-fn", font, "-nb", colors[0][ColBG], "-nf", colors[0][ColFG],"-sb", colors[1][ColBG], "-sf", colors[1][ColFG], NULL };
static const char *termcmd[]       = { terminal, NULL };
static const char *scratchpadcmd[] = { terminal, "-name", scratchpadname, "-geometry", "150x40", NULL };
static const char *musiccmd[]      = { terminal, "-e", "mpd", NULL };
static const char *ncmpcmd[]       = { terminal, "-e", "ncmpcpp", NULL };
static const char *browsercmd[]    = { "chromium", NULL };
static const char *altbrowsercmd[] = { "dwb", NULL };

static const char *volmcmd[]       = { "amixer", "-q", "sset", "Master", "toggle", NULL };
static const char *voldcmd[]       = { "amixer", "-q", "sset", "Master", "1-", "unmute", NULL };
static const char *volucmd[]       = { "amixer", "-q", "sset", "Master", "1+", "unmute", NULL };

static const char *mpdtogglecmd[]  = { "ncmpcpp", "toggle", NULL };
static const char *mpdprevcmd[]    = { "ncmpcpp", "prev", NULL };
static const char *mpdnextcmd[]    = { "ncmpcpp", "next", NULL };
static const char *mpdstopcmd[]    = { "ncmpcpp", "stop", NULL };

static const char *lockcmd[]       = { "slock", NULL };
static const char *logoutcmd[]     = { "killall", "dwminit", NULL };
static const char *rebootcmd[]     = { "sudo", "systemctl", "reboot", NULL };
static const char *shutdowncmd[]   = { "sudo", "systemctl", "poweroff", NULL };

static Key keys[] = {
	/* modifier                     key         function        argument */
	{ ALTKEY,                       XK_m,       spawn,          {.v = dmenucmd } },
	{ ALTKEY,                       XK_Return,  spawn,          {.v = termcmd } },
	{ ALTKEY,                       XK_s,       togglescratch,  {.v = scratchpadcmd } },
	{ ALTKEY,                       XK_b,       spawn,          {.v = browsercmd } },
        { ALTKEY,                       XK_t,       spawn,          {.v = musiccmd } },
        { ALTKEY,                       XK_n,       spawn,          {.v = ncmpcmd } },
        { ALTKEY,                       XK_d,       spawn,          {.v = altbrowsercmd } },

	{ 0,                            0x1008ff12, spawn,          {.v = volmcmd } },
	{ 0,                            0x1008ff11, spawn,          {.v = voldcmd } },
	{ 0,                            0x1008ff13, spawn,          {.v = volucmd } },
	{ 0,                            0x1008ff14, spawn,          {.v = mpdtogglecmd } },
        { MODKEY,                       0x1008ff14, spawn,          {.v = mpdstopcmd } },
	{ 0,                            0x1008ff16, spawn,          {.v = mpdprevcmd } },
	{ 0,                            0x1008ff17, spawn,          {.v = mpdnextcmd } },
        
	{ MODKEY|ShiftMask,             XK_m,       togglemax,      {0} },
	{ MODKEY,                       XK_b,       togglebar,      {0} },
	{ MODKEY,                       XK_j,       focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,       focusstack,     {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_j,       pushdown,       {0} },
	{ MODKEY|ShiftMask,             XK_k,       pushup,         {0} },
	{ MODKEY,                       XK_i,       incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,       incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_Left,    setmfact,       {.f = -0.01} },
	{ MODKEY,                       XK_Right,   setmfact,       {.f = +0.01} },
	{ MODKEY,                       XK_z,       zoom,           {0} },
	{ MODKEY|ShiftMask,             XK_Tab,     view,           {0} },
	{ MODKEY,                       XK_Tab,     focusurgent,    {0} },
	{ MODKEY,                       XK_Escape,  killclient,     {0} },
	{ MODKEY|ShiftMask,             XK_c,       centerwindow,   {0} },
	{ MODKEY,                       XK_F1,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_F2,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_F3,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_F4,      setlayout,      {.v = &layouts[3]} },
	{ MODKEY,                       XK_F5,      setlayout,      {.v = &layouts[4]} },
	{ MODKEY,                       XK_F6,      setlayout,      {.v = &layouts[5]} },
	{ MODKEY,                       XK_space,   setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,   togglefloating, {0} },
	{ MODKEY,                       XK_0,       view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,       tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,   focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period,  focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,   tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period,  tagmon,         {.i = +1 } },
	{ MODKEY,                       XK_h,       cycle,          {.i = -1 } },
	{ MODKEY,                       XK_l,       cycle,          {.i = +1 } },
	{ MODKEY|ControlMask,           XK_h,       tagcycle,       {.i = -1 } },
	{ MODKEY|ControlMask,           XK_l,       tagcycle,       {.i = +1 } },

	TAGKEYS(                        XK_1,                       0)
	TAGKEYS(                        XK_2,                       1)
	TAGKEYS(                        XK_3,                       2)
	TAGKEYS(                        XK_4,                       3)
	TAGKEYS(                        XK_5,                       4)
        
	{ ALTKEY,                       XK_Escape,  spawn,          {.v = lockcmd } },
	{ ALTKEY|ShiftMask,             XK_Escape,  spawn,          {.v = logoutcmd } },
	{ ALTKEY,                       XK_r,       spawn,          {.v = rebootcmd } },
	{ ALTKEY|ControlMask,           XK_Escape,  spawn,          {.v = shutdowncmd } },
	{ MODKEY|ShiftMask,             XK_Escape,  quit,           {0} },
};

/* button definitions */
/* click can be ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkWinTitle,          0,              Button4,        focusstack,     {.i = +1} },
	{ ClkWinTitle,          0,              Button5,        focusstack,     {.i = -1} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
	{ ClkTagBar,            0,              Button4,        cycle,          {.i = -1} },
	{ ClkTagBar,            0,              Button5,        cycle,          {.i = +1} },
};
