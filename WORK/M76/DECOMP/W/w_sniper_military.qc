// Created by Crowbar 0.74

$modelname "w_models\Weapons\w_sniper_military.mdl"

$bodygroup "w_m76"
{
	studio "wref.smd"
}
$bodygroup "w_maglite"
{
	studio "wmaglite.smd"
}

$include "w_sniper_military_lod.qci"

$surfaceprop "weapon"

$contents "solid"

$illumposition -0.026 5.094 1.089

$cdmaterials "models\weapons\v_models\zastava.m76\"
$cdmaterials "models\weapons\v_models\flashlight\"
$cdmaterials "models\v_models\weapons\akmsu\"
$cdmaterials ""
$cdmaterials "

$hboxset \"
$cdmaterials "default"\"

// This list shows the VMT file names used in the SMD files.
// "M76wood1.vmt"
// "M76barrel-slr.vmt"
// "M76mag-20.vmt"
// "M76Rifle.vmt"
// "M76Rail.vmt"
// "M76Scope.vmt"
// "M76Upper.vmt"
// "M76Receiver.vmt"
// "aks_tac_d.vmt"
// "uv.vmt"
// "ak47.vmt"

$attachment "flashlight" "ValveBiped.weapon_bone" 0.1 1.15 22.15 rotate 0 0 0
$attachment "muzzle_flash" "ValveBiped.weapon_bone" 0 2.46 37 rotate -90 0 0
$attachment "shell" "ValveBiped.weapon_bone" -0.5 3.2 7 rotate 0 -180 -180

// $include "w_sniper_military_box.qci"

$include "w_sniper_military_bone.qci"

$include "w_sniper_military_animation.qci"

$include "w_sniper_military_collision.qci"
