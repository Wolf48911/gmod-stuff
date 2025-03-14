// Created by Crowbar 0.74

$modelname "weapons\tacint_extras\w_ak47.mdl"

$bodygroup "studio"
{
	studio "ak47.smd"
}

$include "w_ak47_lod.qci"

$surfaceprop "weapon"

$contents "solid"

$illumposition -0.712 -9.391 1.366

$cdmaterials "models\tacint_extras\ak47\"

// This list shows the VMT file names used in the SMD files.
// "Magazine.vmt"
// "Receiver.vmt"
// "Upper.vmt"

$attachment "muzzle_flash" "ValveBiped.Bip01_R_Hand" 29.4 -1.1 -4.4 rotate 0 0 -90
$attachment "bolt" "ValveBiped.Bip01_R_Hand" 10 -1 -5 rotate 25 90 -90

// $include "w_ak47_box.qci"

$include "w_ak47_bone.qci"

$include "w_ak47_animation.qci"

$include "w_ak47_collision.qci"
