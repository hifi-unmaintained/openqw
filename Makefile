QUTILSDIR = utils/qutils/bin
UTILSDIR  = utils/bin
GAMEDIR   = release

QBSP     = $(QUTILSDIR)/qbsp
VIS      = $(QUTILSDIR)/vis
LIGHT    = $(QUTILSDIR)/light
QCC      = $(QUTILSDIR)/qcc
MODELGEN = $(QUTILSDIR)/modelgen
SPRGEN   = $(QUTILSDIR)/sprgen
QLUMPY   = $(QUTILSDIR)/qlumpy
QFILES   = $(QUTILSDIR)/qfiles

PAR      = $(UTILSDIR)/par
GIT_REV  = $(shell git rev-parse --short HEAD)

# top-level targets
ALLPAKS  = pak0.pak pak1.pak

all: qwprogs.dat $(ALLPAKS) install

# installs the compiled files into the release directory
install :
	mkdir -p $(GAMEDIR)/id1
	mkdir -p $(GAMEDIR)/qw
	cp COPYING README SOURCES $(GAMEDIR)/id1
	cp -r docs $(GAMEDIR)/id1
	cp $(ALLPAKS) $(GAMEDIR)/id1
	cp qwprogs.dat $(GAMEDIR)/qw

package: all
	rm -f openqw-$(GIT_REV).zip
	zip -r openqw-$(GIT_REV).zip release/

# be careful, don't erase anything we can't generate
clean:
	$(RM) $(ALLPAKS)
	$(RM) qwprogs.dat qwdefs.h
	$(RM) gfx/*.lmp gfx.wad
	$(RM) maps/*.h1 maps/*.h2 maps/*.pts maps/*.prt maps/gfx/*.wad maps/*.bsp
	$(RM) $(addprefix progs/,b_g_key.mdl m_g_key.mdl w_g_key.mdl)
	$(RM) $(addprefix progs/,b_s_key.mdl m_s_key.mdl w_s_key.mdl)
	$(RM) $(addprefix progs/,gib1.mdl gib2.mdl gib3.mdl zom_gib.mdl)
	$(RM) $(addprefix progs/,eyes.mdl flame.mdl flame2.mdl lavaball.mdl)
	$(RM) $(addprefix progs/,laser.mdl armor.mdl backpack.mdl teleport.mdl)
	$(RM) $(addprefix progs/,quaddama.mdl invisibl.mdl invulner.mdl suit.mdl)
	$(RM) $(addprefix progs/,bolt.mdl bolt2.mdl bolt3.mdl)
	$(RM) $(addprefix progs/,h_player.mdl)
	$(RM) $(addprefix progs/,s_bubble.spr s_explod.spr s_light.spr)

distclean: clean
	$(RM) openqw-*.zip
	$(RM) -r release

#
# PAK0_CONTENTS is what goes into pak0.pak
#

PAK0_CONTENTS += default.cfg
#PAK0_CONTENTS += demo1.dem
#PAK0_CONTENTS += demo2.dem
#PAK0_CONTENTS += demo3.dem
#PAK0_CONTENTS += end1.bin
PAK0_CONTENTS += gfx/bigbox.lmp
PAK0_CONTENTS += gfx/box_bl.lmp
PAK0_CONTENTS += gfx/box_bm.lmp
PAK0_CONTENTS += gfx/box_br.lmp
PAK0_CONTENTS += gfx/box_ml.lmp
PAK0_CONTENTS += gfx/box_mm2.lmp
PAK0_CONTENTS += gfx/box_mm.lmp
PAK0_CONTENTS += gfx/box_mr.lmp
PAK0_CONTENTS += gfx/box_tl.lmp
PAK0_CONTENTS += gfx/box_tm.lmp
PAK0_CONTENTS += gfx/box_tr.lmp
PAK0_CONTENTS += gfx/colormap.lmp
PAK0_CONTENTS += gfx/complete.lmp
PAK0_CONTENTS += gfx/conback.lmp
PAK0_CONTENTS += gfx/dim_drct.lmp
PAK0_CONTENTS += gfx/dim_ipx.lmp
PAK0_CONTENTS += gfx/dim_modm.lmp
PAK0_CONTENTS += gfx/dim_mult.lmp
PAK0_CONTENTS += gfx/dim_tcp.lmp
PAK0_CONTENTS += gfx/finale.lmp
PAK0_CONTENTS += gfx/help0.lmp
PAK0_CONTENTS += gfx/help1.lmp
PAK0_CONTENTS += gfx/help2.lmp
PAK0_CONTENTS += gfx/help3.lmp
PAK0_CONTENTS += gfx/help4.lmp
PAK0_CONTENTS += gfx/help5.lmp
PAK0_CONTENTS += gfx/inter.lmp
PAK0_CONTENTS += gfx/loading.lmp
PAK0_CONTENTS += gfx/mainmenu.lmp
PAK0_CONTENTS += gfx/menudot1.lmp
PAK0_CONTENTS += gfx/menudot2.lmp
PAK0_CONTENTS += gfx/menudot3.lmp
PAK0_CONTENTS += gfx/menudot4.lmp
PAK0_CONTENTS += gfx/menudot5.lmp
PAK0_CONTENTS += gfx/menudot6.lmp
PAK0_CONTENTS += gfx/menuplyr.lmp
PAK0_CONTENTS += gfx/mp_menu.lmp
PAK0_CONTENTS += gfx/netmen1.lmp
PAK0_CONTENTS += gfx/netmen2.lmp
PAK0_CONTENTS += gfx/netmen3.lmp
PAK0_CONTENTS += gfx/netmen4.lmp
PAK0_CONTENTS += gfx/netmen5.lmp
PAK0_CONTENTS += gfx/palette.lmp
PAK0_CONTENTS += gfx/pause.lmp
PAK0_CONTENTS += gfx/p_load.lmp
PAK0_CONTENTS += gfx/p_multi.lmp
PAK0_CONTENTS += gfx/p_option.lmp
PAK0_CONTENTS += gfx/p_save.lmp
PAK0_CONTENTS += gfx/qplaque.lmp
PAK0_CONTENTS += gfx/ranking.lmp
PAK0_CONTENTS += gfx/sell.lmp
PAK0_CONTENTS += gfx/sp_menu.lmp
PAK0_CONTENTS += gfx/ttl_cstm.lmp
PAK0_CONTENTS += gfx/ttl_main.lmp
PAK0_CONTENTS += gfx/ttl_sgl.lmp
PAK0_CONTENTS += gfx/vidmodes.lmp
PAK0_CONTENTS += gfx.wad
PAK0_CONTENTS += maps/b_batt0.bsp
PAK0_CONTENTS += maps/b_batt1.bsp
PAK0_CONTENTS += maps/b_bh100.bsp
PAK0_CONTENTS += maps/b_bh10.bsp
PAK0_CONTENTS += maps/b_bh25.bsp
PAK0_CONTENTS += maps/b_explob.bsp
PAK0_CONTENTS += maps/b_nail0.bsp
PAK0_CONTENTS += maps/b_nail1.bsp
PAK0_CONTENTS += maps/b_rock0.bsp
PAK0_CONTENTS += maps/b_rock1.bsp
PAK0_CONTENTS += maps/b_shell0.bsp
PAK0_CONTENTS += maps/b_shell1.bsp
#PAK0_CONTENTS += maps/e1m1.bsp
#PAK0_CONTENTS += maps/e1m2.bsp
#PAK0_CONTENTS += maps/e1m3.bsp
#PAK0_CONTENTS += maps/e1m4.bsp
#PAK0_CONTENTS += maps/e1m5.bsp
#PAK0_CONTENTS += maps/e1m6.bsp
#PAK0_CONTENTS += maps/e1m7.bsp
#PAK0_CONTENTS += maps/e1m8.bsp
#PAK0_CONTENTS += maps/start.bsp
PAK0_CONTENTS += progs/armor.mdl
PAK0_CONTENTS += progs/backpack.mdl
PAK0_CONTENTS += progs/bolt2.mdl
PAK0_CONTENTS += progs/bolt3.mdl
PAK0_CONTENTS += progs/bolt.mdl
#PAK0_CONTENTS += progs/boss.mdl
#PAK0_CONTENTS += progs.dat
#PAK0_CONTENTS += progs/demon.mdl
#PAK0_CONTENTS += progs/dog.mdl
#PAK0_CONTENTS += progs/end1.mdl
PAK0_CONTENTS += progs/eyes.mdl
PAK0_CONTENTS += progs/flame2.mdl
PAK0_CONTENTS += progs/flame.mdl
PAK0_CONTENTS += progs/gib1.mdl
PAK0_CONTENTS += progs/gib2.mdl
PAK0_CONTENTS += progs/gib3.mdl
PAK0_CONTENTS += progs/g_light.mdl
PAK0_CONTENTS += progs/g_nail2.mdl
PAK0_CONTENTS += progs/g_nail.mdl
PAK0_CONTENTS += progs/grenade.mdl
PAK0_CONTENTS += progs/g_rock2.mdl
PAK0_CONTENTS += progs/g_rock.mdl
PAK0_CONTENTS += progs/g_shot.mdl
#PAK0_CONTENTS += progs/h_demon.mdl
#PAK0_CONTENTS += progs/h_dog.mdl
#PAK0_CONTENTS += progs/h_guard.mdl
#PAK0_CONTENTS += progs/h_knight.mdl
#PAK0_CONTENTS += progs/h_ogre.mdl
PAK0_CONTENTS += progs/h_player.mdl
#PAK0_CONTENTS += progs/h_shams.mdl
#PAK0_CONTENTS += progs/h_wizard.mdl
#PAK0_CONTENTS += progs/h_zombie.mdl
PAK0_CONTENTS += progs/invisibl.mdl
#PAK0_CONTENTS += progs/invulner.mdl
#PAK0_CONTENTS += progs/knight.mdl
PAK0_CONTENTS += progs/lavaball.mdl
#PAK0_CONTENTS += progs/m_g_key.mdl
PAK0_CONTENTS += progs/missile.mdl
#PAK0_CONTENTS += progs/m_s_key.mdl
#PAK0_CONTENTS += progs/ogre.mdl
PAK0_CONTENTS += progs/player.mdl
PAK0_CONTENTS += progs/quaddama.mdl
PAK0_CONTENTS += progs/s_bubble.spr
PAK0_CONTENTS += progs/s_explod.spr
#PAK0_CONTENTS += progs/shambler.mdl
#PAK0_CONTENTS += progs/s_light.mdl
#PAK0_CONTENTS += progs/s_light.spr
#PAK0_CONTENTS += progs/soldier.mdl
PAK0_CONTENTS += progs/spike.mdl
PAK0_CONTENTS += progs/s_spike.mdl
PAK0_CONTENTS += progs/suit.mdl
PAK0_CONTENTS += progs/v_axe.mdl
PAK0_CONTENTS += progs/v_light.mdl
PAK0_CONTENTS += progs/v_nail2.mdl
PAK0_CONTENTS += progs/v_nail.mdl
PAK0_CONTENTS += progs/v_rock2.mdl
PAK0_CONTENTS += progs/v_rock.mdl
PAK0_CONTENTS += progs/v_shot2.mdl
PAK0_CONTENTS += progs/v_shot.mdl
#PAK0_CONTENTS += progs/w_g_key.mdl
#PAK0_CONTENTS += progs/wizard.mdl
#PAK0_CONTENTS += progs/w_s_key.mdl
#PAK0_CONTENTS += progs/w_spike.mdl
#PAK0_CONTENTS += progs/zombie.mdl
PAK0_CONTENTS += progs/zom_gib.mdl
PAK0_CONTENTS += quake.rc
#PAK0_CONTENTS += sound/ambience/buzz1.wav
#PAK0_CONTENTS += sound/ambience/comp1.wav
#PAK0_CONTENTS += sound/ambience/drip1.wav
#PAK0_CONTENTS += sound/ambience/drone6.wav
PAK0_CONTENTS += sound/ambience/fire1.wav
#PAK0_CONTENTS += sound/ambience/fl_hum1.wav
PAK0_CONTENTS += sound/ambience/hum1.wav
#PAK0_CONTENTS += sound/ambience/suck1.wav
#PAK0_CONTENTS += sound/ambience/swamp1.wav
#PAK0_CONTENTS += sound/ambience/swamp2.wav
#PAK0_CONTENTS += sound/ambience/thunder1.wav
#PAK0_CONTENTS += sound/ambience/water1.wav
#PAK0_CONTENTS += sound/ambience/wind2.wav
#PAK0_CONTENTS += sound/ambience/windfly.wav
#PAK0_CONTENTS += sound/boss1/death.wav
#PAK0_CONTENTS += sound/boss1/out1.wav
#PAK0_CONTENTS += sound/boss1/pain.wav
#PAK0_CONTENTS += sound/boss1/sight1.wav		# required and missing
#PAK0_CONTENTS += sound/boss1/throw.wav
PAK0_CONTENTS += sound/buttons/airbut1.wav
#PAK0_CONTENTS += sound/buttons/switch02.wav
#PAK0_CONTENTS += sound/buttons/switch04.wav
#PAK0_CONTENTS += sound/buttons/switch21.wav
#PAK0_CONTENTS += sound/demon/ddeath.wav
#PAK0_CONTENTS += sound/demon/dhit2.wav
#PAK0_CONTENTS += sound/demon/djump.wav
PAK0_CONTENTS += sound/demon/dland2.wav
#PAK0_CONTENTS += sound/demon/dpain1.wav
#PAK0_CONTENTS += sound/demon/idle1.wav
#PAK0_CONTENTS += sound/demon/sight2.wav
#PAK0_CONTENTS += sound/dog/dattack1.wav
#PAK0_CONTENTS += sound/dog/ddeath.wav
#PAK0_CONTENTS += sound/dog/dpain1.wav
#PAK0_CONTENTS += sound/dog/dsight.wav
#PAK0_CONTENTS += sound/dog/idle.wav
#PAK0_CONTENTS += sound/doors/airdoor1.wav
#PAK0_CONTENTS += sound/doors/airdoor2.wav
#PAK0_CONTENTS += sound/doors/basesec1.wav		# required and missing
#PAK0_CONTENTS += sound/doors/basesec2.wav		# required and missing
#PAK0_CONTENTS += sound/doors/basetry.wav
#PAK0_CONTENTS += sound/doors/baseuse.wav
PAK0_CONTENTS += sound/doors/ddoor1.wav
PAK0_CONTENTS += sound/doors/ddoor2.wav
#PAK0_CONTENTS += sound/doors/doormv1.wav
#PAK0_CONTENTS += sound/doors/drclos4.wav
#PAK0_CONTENTS += sound/doors/hydro1.wav
#PAK0_CONTENTS += sound/doors/hydro2.wav
#PAK0_CONTENTS += sound/doors/latch2.wav
PAK0_CONTENTS += sound/doors/medtry.wav
PAK0_CONTENTS += sound/doors/meduse.wav
#PAK0_CONTENTS += sound/doors/runetry.wav
#PAK0_CONTENTS += sound/doors/runeuse.wav
#PAK0_CONTENTS += sound/doors/stndr1.wav
#PAK0_CONTENTS += sound/doors/stndr2.wav
#PAK0_CONTENTS += sound/doors/winch2.wav
#PAK0_CONTENTS += sound/hknight/hit.wav
PAK0_CONTENTS += sound/items/armor1.wav
PAK0_CONTENTS += sound/items/damage2.wav
PAK0_CONTENTS += sound/items/damage3.wav
PAK0_CONTENTS += sound/items/damage.wav
PAK0_CONTENTS += sound/items/health1.wav
PAK0_CONTENTS += sound/items/inv1.wav
PAK0_CONTENTS += sound/items/inv2.wav
PAK0_CONTENTS += sound/items/inv3.wav
PAK0_CONTENTS += sound/items/itembk2.wav
PAK0_CONTENTS += sound/items/protect2.wav
PAK0_CONTENTS += sound/items/protect3.wav
PAK0_CONTENTS += sound/items/protect.wav
PAK0_CONTENTS += sound/items/r_item1.wav
PAK0_CONTENTS += sound/items/r_item2.wav
PAK0_CONTENTS += sound/items/suit2.wav
PAK0_CONTENTS += sound/items/suit.wav
#PAK0_CONTENTS += sound/knight/idle.wav
#PAK0_CONTENTS += sound/knight/kdeath.wav
#PAK0_CONTENTS += sound/knight/khurt.wav
#PAK0_CONTENTS += sound/knight/ksight.wav
#PAK0_CONTENTS += sound/knight/sword1.wav
#PAK0_CONTENTS += sound/knight/sword2.wav
PAK0_CONTENTS += sound/misc/h2ohit1.wav
#PAK0_CONTENTS += sound/misc/medkey.wav
PAK0_CONTENTS += sound/misc/menu1.wav
PAK0_CONTENTS += sound/misc/menu2.wav
PAK0_CONTENTS += sound/misc/menu3.wav
PAK0_CONTENTS += sound/misc/null.wav
PAK0_CONTENTS += sound/misc/outwater.wav
PAK0_CONTENTS += sound/misc/power.wav
PAK0_CONTENTS += sound/misc/r_tele1.wav
PAK0_CONTENTS += sound/misc/r_tele2.wav
PAK0_CONTENTS += sound/misc/r_tele3.wav
PAK0_CONTENTS += sound/misc/r_tele4.wav
PAK0_CONTENTS += sound/misc/r_tele5.wav
#PAK0_CONTENTS += sound/misc/runekey.wav
#PAK0_CONTENTS += sound/misc/secret.wav
PAK0_CONTENTS += sound/misc/talk.wav
#PAK0_CONTENTS += sound/misc/trigger1.wav
PAK0_CONTENTS += sound/misc/water1.wav
PAK0_CONTENTS += sound/misc/water2.wav
#PAK0_CONTENTS += sound/ogre/ogdrag.wav
#PAK0_CONTENTS += sound/ogre/ogdth.wav
#PAK0_CONTENTS += sound/ogre/ogidle2.wav
#PAK0_CONTENTS += sound/ogre/ogidle.wav
#PAK0_CONTENTS += sound/ogre/ogpain1.wav
#PAK0_CONTENTS += sound/ogre/ogsawatk.wav
#PAK0_CONTENTS += sound/ogre/ogwake.wav
#PAK0_CONTENTS += sound/plats/medplat1.wav
#PAK0_CONTENTS += sound/plats/medplat2.wav
#PAK0_CONTENTS += sound/plats/plat1.wav
#PAK0_CONTENTS += sound/plats/plat2.wav
#PAK0_CONTENTS += sound/plats/train1.wav
#PAK0_CONTENTS += sound/plats/train2.wav
PAK0_CONTENTS += sound/player/axhit1.wav
PAK0_CONTENTS += sound/player/axhit2.wav
PAK0_CONTENTS += sound/player/death1.wav
PAK0_CONTENTS += sound/player/death2.wav
PAK0_CONTENTS += sound/player/death3.wav
PAK0_CONTENTS += sound/player/death4.wav
PAK0_CONTENTS += sound/player/death5.wav
PAK0_CONTENTS += sound/player/drown1.wav
PAK0_CONTENTS += sound/player/drown2.wav
PAK0_CONTENTS += sound/player/gasp1.wav
PAK0_CONTENTS += sound/player/gasp2.wav
PAK0_CONTENTS += sound/player/gib.wav
PAK0_CONTENTS += sound/player/h2odeath.wav
PAK0_CONTENTS += sound/player/h2ojump.wav
PAK0_CONTENTS += sound/player/inh2o.wav
PAK0_CONTENTS += sound/player/inlava.wav
PAK0_CONTENTS += sound/player/land2.wav
PAK0_CONTENTS += sound/player/land.wav
PAK0_CONTENTS += sound/player/lburn1.wav
PAK0_CONTENTS += sound/player/lburn2.wav
PAK0_CONTENTS += sound/player/pain1.wav
PAK0_CONTENTS += sound/player/pain2.wav
PAK0_CONTENTS += sound/player/pain3.wav
PAK0_CONTENTS += sound/player/pain4.wav
PAK0_CONTENTS += sound/player/pain5.wav
PAK0_CONTENTS += sound/player/pain6.wav
PAK0_CONTENTS += sound/player/plyrjmp8.wav
PAK0_CONTENTS += sound/player/slimbrn2.wav
PAK0_CONTENTS += sound/player/teledth1.wav
PAK0_CONTENTS += sound/player/tornoff2.wav
PAK0_CONTENTS += sound/player/udeath.wav
#PAK0_CONTENTS += sound/shambler/melee1.wav
#PAK0_CONTENTS += sound/shambler/melee2.wav
#PAK0_CONTENTS += sound/shambler/sattck1.wav
#PAK0_CONTENTS += sound/shambler/sboom.wav
#PAK0_CONTENTS += sound/shambler/sdeath.wav
#PAK0_CONTENTS += sound/shambler/shurt2.wav
#PAK0_CONTENTS += sound/shambler/sidle.wav
#PAK0_CONTENTS += sound/shambler/smack.wav
#PAK0_CONTENTS += sound/shambler/ssight.wav
#PAK0_CONTENTS += sound/soldier/death1.wav
#PAK0_CONTENTS += sound/soldier/idle.wav
#PAK0_CONTENTS += sound/soldier/pain1.wav
#PAK0_CONTENTS += sound/soldier/pain2.wav
#PAK0_CONTENTS += sound/soldier/sattck1.wav
#PAK0_CONTENTS += sound/soldier/sight1.wav
PAK0_CONTENTS += sound/weapons/ax1.wav
PAK0_CONTENTS += sound/weapons/bounce.wav
PAK0_CONTENTS += sound/weapons/grenade.wav
PAK0_CONTENTS += sound/weapons/guncock.wav
PAK0_CONTENTS += sound/weapons/lhit.wav
PAK0_CONTENTS += sound/weapons/lock4.wav
PAK0_CONTENTS += sound/weapons/lstart.wav
PAK0_CONTENTS += sound/weapons/pkup.wav
PAK0_CONTENTS += sound/weapons/r_exp3.wav
PAK0_CONTENTS += sound/weapons/ric1.wav
PAK0_CONTENTS += sound/weapons/ric2.wav
PAK0_CONTENTS += sound/weapons/ric3.wav
PAK0_CONTENTS += sound/weapons/rocket1i.wav
PAK0_CONTENTS += sound/weapons/sgun1.wav
PAK0_CONTENTS += sound/weapons/shotgn2.wav
PAK0_CONTENTS += sound/weapons/spike2.wav
PAK0_CONTENTS += sound/weapons/tink1.wav
#PAK0_CONTENTS += sound/wizard/hit.wav
#PAK0_CONTENTS += sound/wizard/wattack.wav
#PAK0_CONTENTS += sound/wizard/wdeath.wav
#PAK0_CONTENTS += sound/wizard/widle1.wav
#PAK0_CONTENTS += sound/wizard/widle2.wav
#PAK0_CONTENTS += sound/wizard/wpain.wav
#PAK0_CONTENTS += sound/wizard/wsight.wav
#PAK0_CONTENTS += sound/zombie/idle_w2.wav
#PAK0_CONTENTS += sound/zombie/z_fall.wav
#PAK0_CONTENTS += sound/zombie/z_gib.wav
#PAK0_CONTENTS += sound/zombie/z_hit.wav
#PAK0_CONTENTS += sound/zombie/z_idle1.wav
#PAK0_CONTENTS += sound/zombie/z_idle.wav
#PAK0_CONTENTS += sound/zombie/z_miss.wav
#PAK0_CONTENTS += sound/zombie/z_pain1.wav
#PAK0_CONTENTS += sound/zombie/z_pain.wav
#PAK0_CONTENTS += sound/zombie/z_shot1.wav

#
# PAK1_CONTENTS is what goes into pak1.pak
#
#PAK1_CONTENTS += end2.bin
PAK1_CONTENTS += gfx/pop.lmp
PAK1_CONTENTS += maps/b_exbox2.bsp
PAK1_CONTENTS += maps/dm1.bsp
#PAK1_CONTENTS += maps/dm2.bsp
#PAK1_CONTENTS += maps/dm3.bsp
#PAK1_CONTENTS += maps/dm4.bsp
#PAK1_CONTENTS += maps/dm5.bsp
PAK1_CONTENTS += maps/dm6.bsp
#PAK1_CONTENTS += maps/e2m1.bsp
#PAK1_CONTENTS += maps/e2m2.bsp
#PAK1_CONTENTS += maps/e2m3.bsp
#PAK1_CONTENTS += maps/e2m4.bsp
#PAK1_CONTENTS += maps/e2m5.bsp
#PAK1_CONTENTS += maps/e2m6.bsp
#PAK1_CONTENTS += maps/e2m7.bsp
#PAK1_CONTENTS += maps/e3m1.bsp
#PAK1_CONTENTS += maps/e3m2.bsp
#PAK1_CONTENTS += maps/e3m3.bsp
#PAK1_CONTENTS += maps/e3m4.bsp
#PAK1_CONTENTS += maps/e3m5.bsp
#PAK1_CONTENTS += maps/e3m6.bsp
#PAK1_CONTENTS += maps/e3m7.bsp
#PAK1_CONTENTS += maps/e4m1.bsp
#PAK1_CONTENTS += maps/e4m2.bsp
#PAK1_CONTENTS += maps/e4m3.bsp
#PAK1_CONTENTS += maps/e4m4.bsp
#PAK1_CONTENTS += maps/e4m5.bsp
#PAK1_CONTENTS += maps/e4m6.bsp
#PAK1_CONTENTS += maps/e4m7.bsp
#PAK1_CONTENTS += maps/e4m8.bsp
#PAK1_CONTENTS += maps/end.bsp
PAK1_CONTENTS += progs/b_g_key.mdl
PAK1_CONTENTS += progs/b_s_key.mdl
#PAK1_CONTENTS += progs/end2.mdl
#PAK1_CONTENTS += progs/end3.mdl
#PAK1_CONTENTS += progs/end4.mdl
#PAK1_CONTENTS += progs/enforcer.mdl
#PAK1_CONTENTS += progs/fish.mdl
#PAK1_CONTENTS += progs/h_hellkn.mdl
#PAK1_CONTENTS += progs/hknight.mdl
#PAK1_CONTENTS += progs/h_mega.mdl
#PAK1_CONTENTS += progs/h_shal.mdl
#PAK1_CONTENTS += progs/k_spike.mdl
#PAK1_CONTENTS += progs/laser.mdl
#PAK1_CONTENTS += progs/oldone.mdl
#PAK1_CONTENTS += progs/shalrath.mdl
#PAK1_CONTENTS += progs/tarbaby.mdl
#PAK1_CONTENTS += progs/teleport.mdl
#PAK1_CONTENTS += progs/v_spike.mdl
#PAK1_CONTENTS += sound/blob/death1.wav
#PAK1_CONTENTS += sound/blob/hit1.wav
#PAK1_CONTENTS += sound/blob/land1.wav
#PAK1_CONTENTS += sound/blob/sight1.wav
#PAK1_CONTENTS += sound/boss2/death.wav
#PAK1_CONTENTS += sound/boss2/idle.wav
#PAK1_CONTENTS += sound/boss2/pop2.wav
#PAK1_CONTENTS += sound/boss2/sight.wav
#PAK1_CONTENTS += sound/enforcer/death1.wav
#PAK1_CONTENTS += sound/enforcer/enfire.wav
#PAK1_CONTENTS += sound/enforcer/enfstop.wav
#PAK1_CONTENTS += sound/enforcer/idle1.wav
#PAK1_CONTENTS += sound/enforcer/pain1.wav
#PAK1_CONTENTS += sound/enforcer/pain2.wav
#PAK1_CONTENTS += sound/enforcer/sight1.wav
#PAK1_CONTENTS += sound/enforcer/sight2.wav
#PAK1_CONTENTS += sound/enforcer/sight3.wav
#PAK1_CONTENTS += sound/enforcer/sight4.wav
#PAK1_CONTENTS += sound/fish/bite.wav
#PAK1_CONTENTS += sound/fish/death.wav
#PAK1_CONTENTS += sound/fish/idle.wav
#PAK1_CONTENTS += sound/hknight/attack1.wav
#PAK1_CONTENTS += sound/hknight/death1.wav
#PAK1_CONTENTS += sound/hknight/grunt.wav
#PAK1_CONTENTS += sound/hknight/idle.wav
#PAK1_CONTENTS += sound/hknight/pain1.wav
#PAK1_CONTENTS += sound/hknight/sight1.wav
#PAK1_CONTENTS += sound/hknight/slash1.wav
#PAK1_CONTENTS += sound/misc/basekey.wav
#PAK1_CONTENTS += sound/shalrath/attack2.wav
#PAK1_CONTENTS += sound/shalrath/attack.wav
#PAK1_CONTENTS += sound/shalrath/death.wav
#PAK1_CONTENTS += sound/shalrath/idle.wav
#PAK1_CONTENTS += sound/shalrath/pain.wav
#PAK1_CONTENTS += sound/shalrath/sight.wav


#
# make targets
#

pak0.pak: $(PAK0_CONTENTS) Makefile
	$(PAR) -c $@ $(PAK0_CONTENTS)

pak1.pak: $(PAK1_CONTENTS) Makefile
	$(PAR) -c $@ $(PAK1_CONTENTS)

qwprogs.dat:
	$(QCC) -o qwprogs.dat -p qwdefs.h qw/progs.src

maps/gfx/items.wad : maps/gfx/items_wad.ls
	$(QLUMPY) maps/gfx/items_wad.ls

maps/gfx/medieval.wad : maps/gfx/medieval_wad.ls
	$(QLUMPY) maps/gfx/medieval_wad.ls

maps/gfx/tim.wad : maps/gfx/tim_wad.ls
	$(QLUMPY) maps/gfx/tim_wad.ls

gfx.wad :
	$(QLUMPY) gfx_wad.ls

%.lmp : gfx_lmp.ls
	$(QLUMPY) gfx_lmp.ls

%.mdl : %.qc
	$(MODELGEN) $<

%.spr : %.qc %.png
	$(SPRGEN) $<

#
# The next target builds static models (not maps).  
# Static models are models that don't move during the game, so the 
# can be represented by a .bsp instead of a .mdl (which is easier to render).
# Unlike regular .map files, $(VIS) cannot be run on them
# because they are inherently leaky.  Therefore, we have to add
# a target to that matches them specially.  This MUST come before the
# normal rules for building maps so that it will match first.
#
maps/b_%.bsp : maps/b_%.map maps/gfx/items.wad
	$(QBSP) $<
	$(LIGHT) $@


%.bsp : %.map
	$(QBSP) $<
	$(VIS) $@
	$(LIGHT) $@

maps/dm1.bsp : maps/dm1.map maps/gfx/medieval.wad
	$(QBSP) maps/dm1.map
	$(VIS) $@
	$(LIGHT) $@

maps/dm6.bsp : maps/dm6.map maps/gfx/tim.wad
	$(QBSP) maps/dm6.map
	$(VIS) $@
	$(LIGHT) $@

# 
# Not all .mdl files can be built from source by our tools.
# For each file that we cannot generate, we add a special case that 
# tells make to skip the file.
#

progs/s_light.mdl : ;
