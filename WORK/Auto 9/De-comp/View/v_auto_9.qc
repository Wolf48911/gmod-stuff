// Created by Crowbar 0.74

$ModelName "weapons\v_models\v_auto_9.mdl"

$BodyGroup "gun"
{
	studio "frame.smd"
}

$Include "v_woodsman_lod.qci"

$SurfaceProp "default"

$Contents "solid"

$IllumPosition -5.782 -10.195 -1.729

$CDMaterials "models\weapons\Auto_9\"

// This list shows the VMT file names used in the SMD files.
// "Woodsman.vmt"
// "vertec.vmt"

$Attachment "muzzleflash" "ValveBiped.Bip01" -4.2 -4.4 26.5 rotate -90 0 0
$Attachment "bolt" "ValveBiped.slide" 0.2 9 3 rotate 66 0 -90
$Attachment "muzzle_silencer" "ValveBiped.Bip01" -4.2 -4.4 33 rotate -90 0 0
$Attachment "muzzle" "ValveBiped.barrel" -0.32 0 4.2 rotate -90 0 0
$Attachment "magazine" "ValveBiped.magazine" 0 -10 0 rotate 0 0 0
$Attachment "muzzleflash_blind" "ValveBiped.Bip01" -1.2 2.5 25.2 rotate -88 0 0

// $Include "v_woodsman_box.qci"

$Include "v_woodsman_bone.qci"

$Include "v_woodsman_animation.qci"
