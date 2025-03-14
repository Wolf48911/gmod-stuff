// Created by Crowbar 0.74

$modelname "weapons\tacint\w_m4.mdl"

$bodygroup "studio"
{
	studio "w_m4.smd"
}
$bodygroup "silencer"
{
	blank
	studio "w_m4_silencer.smd"
}
$bodygroup "flashlight"
{
	blank
	studio "w_m4_flashlight.smd"
}
$bodygroup "optics"
{
	blank
	studio "w_m4_holosight.smd"
	studio "w_m4_reddot.smd"
	studio "w_m4_ACOG.smd"
}
$bodygroup "magazine"
{
	studio "w_m4_magazine.smd"
	blank
}

$lod 24
{
	replacemodel "w_m4.smd" "w_m4_lod1.smd"
	replacemodel "w_m4_silencer.smd" "w_m4_silencer_lod1.smd"
	replacemodel "w_m4_flashlight.smd" "w_m4_flashlight_lod1.smd"
	replacemodel "w_m4_holosight.smd" "w_m4_holosight_lod1.smd"
	replacemodel "w_m4_reddot.smd" "w_m4_reddot_lod1.smd"
	replacemodel "w_m4_ACOG.smd" "w_m4_ACOG_lod1.smd"
	replacemodel "w_m4_magazine.smd" "w_m4_magazine_lod1.smd"
	nofacial
}
$lod 70
{
	replacemodel "w_m4.smd" "w_m4_lod2.smd"
	replacemodel "w_m4_silencer.smd" "w_m4_silencer_lod2.smd"
	replacemodel "w_m4_flashlight.smd" "w_m4_flashlight_lod2.smd"
	replacemodel "w_m4_holosight.smd" "w_m4_holosight_lod2.smd"
	replacemodel "w_m4_reddot.smd" "w_m4_reddot_lod2.smd"
	replacemodel "w_m4_ACOG.smd" "w_m4_ACOG_lod2.smd"
	replacemodel "w_m4_magazine.smd" "w_m4_magazine_lod2.smd"
	nofacial
}
$lod 200
{
	replacemodel "w_m4.smd" "w_m4_lod3.smd"
	replacemodel "w_m4_silencer.smd" "w_m4_silencer_lod3.smd"
	replacemodel "w_m4_flashlight.smd" "w_m4_flashlight_lod3.smd"
	replacemodel "w_m4_holosight.smd" "w_m4_holosight_lod3.smd"
	replacemodel "w_m4_reddot.smd" "w_m4_reddot_lod3.smd"
	replacemodel "w_m4_ACOG.smd" "w_m4_ACOG_lod3.smd"
	replacemodel "w_m4_magazine.smd" "w_m4_magazine_lod3.smd"
	replacebone "Box01" "ValveBiped.Bip01_R_Hand"
	replacebone "ak47_bolt" "Box01"
	nofacial
}

$surfaceprop "weapon"

$contents "solid"

$illumposition -0.191 -7.886 2.768

$cdmaterials "models\tacint\weapons\w_models\m4\"
$cdmaterials "models\tacint\weapons\w_models\_accessories1\"

$attachment "muzzle_flash" "ValveBiped.Bip01_R_Hand" 25.1 -2.5 -5.5 rotate 0 -2 -90
$attachment "bolt" "ValveBiped.Bip01_R_Hand" 9.5 -1 -5.7 rotate 25 90 -90

$cbox 0 0 0 0 0 0

$bbox -12.39 -3.308 -4.35 28.093 2.926 9.886

$definebone "ValveBiped.Bip01_R_Hand" "" -1.187493 3.856107 -0.925095 0.820232 -93.019964 180.000005 0 0 0 0 0 0
$definebone "Box01" "ValveBiped.Bip01_R_Hand" 5.216259 -1.175498 -5.60718 -0.000019 -90.000016 179.179754 0 0 0 0 0 0
$definebone "ak47_bolt" "Box01" 0.079702 -2.0397 -0.787757 -1.126075 -90.000016 90.000016 0 0 0 0 0 0


$sequence "vm_idle" {
	"w_m4_anims\vm_idle.smd"
	activity "ACT_VM_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "vm_reload" {
	"w_m4_anims\vm_reload.smd"
	activity "ACT_VM_RELOAD" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "vm_draw" {
	"w_m4_anims\vm_draw.smd"
	activity "ACT_VM_DRAW" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "idle" {
	"w_m4_anims\idle.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "reload" {
	"w_m4_anims\reload.smd"
	activity "ACT_RELOAD" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "draw" {
	"w_m4_anims\draw.smd"
	activity "ACT_DRAW" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "attack1" {
	"w_m4_anims\attack1.smd"
	activity "ACT_RANGE_ATTACK1" 1
	{ event 9001 0 "TI_MuzzleFlash_X" }
	{ event 6010 0 "1" }
	fadein 0.2
	fadeout 0.2
	fps 22
}

$sequence "attack2" {
	"w_m4_anims\attack2.smd"
	activity "ACT_RANGE_ATTACK2" 1
	{ event 9001 0 "TI_Silenced" }
	{ event 6010 0 "1" }
	fadein 0.2
	fadeout 0.2
	fps 22
}

$collisionmodel "w_m4_physics.smd"
{
	$mass 4
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "

}
