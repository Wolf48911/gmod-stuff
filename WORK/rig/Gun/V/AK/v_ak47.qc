// Created by Crowbar 0.74

$modelname "weapons\tacint_extras\v_ak47.mdl"

$bodygroup "gun"
{
	studio "ref.smd"
}
$bodygroup "stock"
{
	blank
}
$bodygroup "tacrail"
{
	blank
	studio "rail.smd"
}

$include "v_ak47_lod.qci"

$surfaceprop "default"

$contents "solid"

$illumposition -5.75 -22.784 -1.717

$cdmaterials "models\tacint_extras\ak47\"
$cdmaterials "models\tacint\weapons\v_models\ak47\"
$cdmaterials "models\tacint\weapons\v_models\hands\"
$cdmaterials "models\tacint\weapons\v_models\_accessories1\"
$cdmaterials "models\tacint\weapons\v_models\frag\"
$cdmaterials "models\tacint\weapons\v_models\flashbang\"
$cdmaterials "models\tacint\weapons\v_models\smoke\"

// This list shows the VMT file names used in the SMD files.
// "47_rec.vmt"
// "upper.vmt"
// "47_mag.vmt"
// "xewscope.vmt"

$attachment "muzzle" "ValveBiped.AK47_rootbone" -3.2 0 24 rotate -90 90 0
$attachment "bolt" "ValveBiped.bolt" 1.5 -0.2 0 rotate -33 0 90
$attachment "muzzle_silencer" "ValveBiped.AK47_rootbone" -3.2 0 32 rotate -90 90 0
$attachment "magazine" "ValveBiped.magazine" 0 -10 0 rotate 0 0 0

// $include "v_ak47_box.qci"

$include "v_ak47_bone.qci"

$include "v_ak47_animation.qci"

$keyvalues
{
	qc_path models\weapons\v_models\ak47\v_ak47.qc
}
