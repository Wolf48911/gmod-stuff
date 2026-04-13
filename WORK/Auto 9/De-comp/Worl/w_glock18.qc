// Created by Crowbar 0.74

$ModelName "weapons\tacint_extras\w_auto_9.mdl"

$bodygroup "0"
{
	studio "frame.smd"
}
$bodygroup "1"
{
	studio "sight.smd"
}

$SurfaceProp "weapon"

$Contents "solid"

$IllumPosition -0.19 -1.517 0.469

$cdmaterials "models\weapons\Auto_9\"

// This list shows the VMT file names used in the SMD files.
// "mag.vmt"
// "slide.vmt"
// "frame.vmt"

$Attachment "muzzle_flash" "ValveBiped.Bip01_R_Hand" 10.7 -1.2 -4.3 rotate 0 0 -90
$Attachment "bolt" "ValveBiped.Bip01_R_Hand" 6 -1.3 -4 rotate 77 90 -90

// $Include "w_glock18_box.qci"

$Include "w_glock18_bone.qci"

$Include "w_glock18_animation.qci"
