// Created by Crowbar 0.74

$modelname "v_models\v_sniper_military.mdl"

$bodygroup "v_m76"
{
	studio "vref.smd"
}
$bodygroup "v_maglite"
{
	blank
	studio "vmaglite.smd"
}

$bodygroup "Mount"
{
	blank
	studio "Box01.smd"
}

$include "v_sniper_military_lod.qci"

$surfaceprop "default"

$contents "solid"

$illumposition 0 7.307 -31.193

$cdmaterials "models\weapons\v_models\zastava.m76\"
$cdmaterials "models\weapons\v_models\flashlight\"
$cdmaterials "models\v_models\weapons\akmsu\"
$cdmaterials ""
$cdmaterials "

$hboxset \"
$cdmaterials "default"\"

// This list shows the VMT file names used in the SMD files.
// "M76Lens.vmt"
// "M76wood1.vmt"
// "M76barrel-slr.vmt"
// "M76mag-20.vmt"
// "M76Scope.vmt"
// "M76Rifle.vmt"
// "M76Receiver.vmt"
// "M76Upper.vmt"
// "M76Rail.vmt"
// "aks_tac_d.vmt"
// "uv.vmt"
// "ak47.vmt"

$attachment "attach_shell_eject" "ValveBiped.attach_muzzle" 35.3 2.5 -0.2 rotate 0 0 0
$attachment "attach_muzzle" "ValveBiped.attach_muzzle" 35.3 2.5 -0.2 rotate 0 0 0
$attachment "muzzle_flash" "ValveBiped.attach_muzzle" 35.3 2.5 -0.2 rotate 0 0 0
$attachment "flashlight" "ValveBiped.attach_muzzle" 17.2 0.9 -0.3 rotate 0 0 0
$attachment "shell" "ValveBiped.weapon_bone" -0.5 3.5 8 rotate 0 180 90
$attachment "fowardnode" "ValveBiped.weapon_bone" 0 0 0 rotate 0 0 0
$attachment "bonepreserve1" "ValveBiped.ValveBiped" 0 0 0 rotate 0 0 0
$attachment "bonepreserve2" "ValveBiped.Bip01" 0 0 0 rotate 0 0 0
$attachment "bonepreserve3" "ValveBiped.Camera" 0 0 0 rotate 0 0 0
$attachment "bonepreserve4" "ValveBiped.weapon_bone" 0 0 0 rotate 0 0 0
$attachment "bonepreserve5" "ValveBiped.attach_muzzle" 0 0 0 rotate 0 0 0
$attachment "bonepreserve6" "ValveBiped.attach_shell_eject" 0 0 0 rotate 0 0 0
$attachment "bonepreserve7" "ValveBiped.attach_camera" 0 0 0 rotate 0 0 0
$attachment "bonepreserve8" "ValveBiped.Bip01_Spine" 0 0 0 rotate 0 0 0
$attachment "bonepreserve9" "ValveBiped.Bip01_Spine1" 0 0 0 rotate 0 0 0
$attachment "bonepreserve10" "ValveBiped.Bip01_Spine2" 0 0 0 rotate 0 0 0
$attachment "bonepreserve11" "ValveBiped.Bip01_Spine4" 0 0 0 rotate 0 0 0
$attachment "bonepreserve12" "ValveBiped.Bip01_L_Clavicle" 0 0 0 rotate 0 0 0
$attachment "bonepreserve13" "ValveBiped.Bip01_L_UpperArm" 0 0 0 rotate 0 0 0
$attachment "bonepreserve14" "ValveBiped.Bip01_L_Forearm" 0 0 0 rotate 0 0 0
$attachment "bonepreserve15" "ValveBiped.Bip01_L_Hand" 0 0 0 rotate 0 0 0
$attachment "bonepreserve16" "ValveBiped.Bip01_L_Finger4" 0 0 0 rotate 0 0 0
$attachment "bonepreserve17" "ValveBiped.Bip01_L_Finger41" 0 0 0 rotate 0 0 0
$attachment "bonepreserve18" "ValveBiped.Bip01_L_Finger42" 0 0 0 rotate 0 0 0
$attachment "bonepreserve19" "ValveBiped.Bip01_L_Finger3" 0 0 0 rotate 0 0 0
$attachment "bonepreserve20" "ValveBiped.Bip01_L_Finger31" 0 0 0 rotate 0 0 0
$attachment "bonepreserve21" "ValveBiped.Bip01_L_Finger32" 0 0 0 rotate 0 0 0
$attachment "bonepreserve22" "ValveBiped.Bip01_L_Finger2" 0 0 0 rotate 0 0 0
$attachment "bonepreserve23" "ValveBiped.Bip01_L_Finger21" 0 0 0 rotate 0 0 0
$attachment "bonepreserve24" "ValveBiped.Bip01_L_Finger22" 0 0 0 rotate 0 0 0
$attachment "bonepreserve25" "ValveBiped.Bip01_L_Finger1" 0 0 0 rotate 0 0 0
$attachment "bonepreserve26" "ValveBiped.Bip01_L_Finger11" 0 0 0 rotate 0 0 0
$attachment "bonepreserve27" "ValveBiped.Bip01_L_Finger12" 0 0 0 rotate 0 0 0
$attachment "bonepreserve28" "ValveBiped.Bip01_L_Finger0" 0 0 0 rotate 0 0 0
$attachment "bonepreserve29" "ValveBiped.Bip01_L_Finger01" 0 0 0 rotate 0 0 0
$attachment "bonepreserve30" "ValveBiped.Bip01_L_Finger02" 0 0 0 rotate 0 0 0
$attachment "bonepreserve31" "ValveBiped.Bip01_R_Clavicle" 0 0 0 rotate 0 0 0
$attachment "bonepreserve32" "ValveBiped.Bip01_R_UpperArm" 0 0 0 rotate 0 0 0
$attachment "bonepreserve33" "ValveBiped.Bip01_R_Forearm" 0 0 0 rotate 0 0 0
$attachment "bonepreserve34" "ValveBiped.Bip01_R_Hand" 0 0 0 rotate 0 0 0
$attachment "bonepreserve35" "ValveBiped.Bip01_R_Finger4" 0 0 0 rotate 0 0 0
$attachment "bonepreserve36" "ValveBiped.Bip01_R_Finger41" 0 0 0 rotate 0 0 0
$attachment "bonepreserve37" "ValveBiped.Bip01_R_Finger42" 0 0 0 rotate 0 0 0
$attachment "bonepreserve38" "ValveBiped.Bip01_R_Finger3" 0 0 0 rotate 0 0 0
$attachment "bonepreserve39" "ValveBiped.Bip01_R_Finger31" 0 0 0 rotate 0 0 0
$attachment "bonepreserve40" "ValveBiped.Bip01_R_Finger32" 0 0 0 rotate 0 0 0
$attachment "bonepreserve41" "ValveBiped.Bip01_R_Finger2" 0 0 0 rotate 0 0 0
$attachment "bonepreserve42" "ValveBiped.Bip01_R_Finger21" 0 0 0 rotate 0 0 0
$attachment "bonepreserve43" "ValveBiped.Bip01_R_Finger22" 0 0 0 rotate 0 0 0
$attachment "bonepreserve44" "ValveBiped.Bip01_R_Finger1" 0 0 0 rotate 0 0 0
$attachment "bonepreserve45" "ValveBiped.Bip01_R_Finger11" 0 0 0 rotate 0 0 0
$attachment "bonepreserve46" "ValveBiped.Bip01_R_Finger12" 0 0 0 rotate 0 0 0
$attachment "bonepreserve47" "ValveBiped.Bip01_R_Finger0" 0 0 0 rotate 0 0 0
$attachment "bonepreserve48" "ValveBiped.Bip01_R_Finger01" 0 0 0 rotate 0 0 0
$attachment "bonepreserve49" "ValveBiped.Bip01_R_Finger02" 0 0 0 rotate 0 0 0
$attachment "bonepreserve58" "ValveBiped.Bip01_R_Forearm_driven" 0 0 0 rotate 0 0 0
$attachment "bonepreserve59" "ValveBiped.Bip01_R_Driven_ulna" 0 0 0 rotate 0 0 0
$attachment "bonepreserve60" "ValveBiped.Bip01_R_thumbroot" 0 0 0 rotate 0 0 0
$attachment "bonepreserve61" "ValveBiped.Bip01_L_Forearm_driven" 0 0 0 rotate 0 0 0
$attachment "bonepreserve62" "ValveBiped.Bip01_L_Driven_ulna" 0 0 0 rotate 0 0 0
$attachment "bonepreserve63" "ValveBiped.Bip01_L_thumbroot" 0 0 0 rotate 0 0 0

// $include "v_sniper_military_box.qci"

$include "v_sniper_military_bone.qci"

$include "v_sniper_military_animation.qci"
