// Created by Crowbar 0.74

$modelname "humans\personalrebels\pm_suitfemale_01.mdl"

$model "female_01" "female_01_reference.smd" {

	eyeball "eye_right" "ValveBiped.Bip01_Head1" -1.261012 -3.702028 64.973994 "eyeball_r" 1 4 "iris_unused" 0.66
	eyeball "eye_left" "ValveBiped.Bip01_Head1" 1.188988 -3.702029 64.972010 "eyeball_l" 1 -4 "iris_unused" 0.66


	mouth 0 "mouth" "ValveBiped.Bip01_Head1" 0 1 0

	$include "pm_suitfemale_01_flex.qci"
}
$bodygroup "body"
{
	studio "blacksuit_body_female_2.smd"
}
$bodygroup "body2"
{
	studio "blacksuit_body_female_3.smd"
}
$bodygroup "hands"
{
	studio "female_01_female_hands_glove.smd"
	studio "female_01_female_hands_glove_white.smd"
	studio "female_01_female_hands_white.smd"
}
$bodygroup "headgear"
{
	studio "female_01_unknownmodelname.smd"
	studio "female_01_capwrap.smd"
	studio "female_01_facewrap.smd"
	studio "female_01_beanie_wrap.smd"
	studio "female_01_beanie.smd"
	studio "hat_female_01.smd"
	studio "female_01_gasmask.smd"
}
$bodygroup "backpieces"
{
	blank
	studio "backpack_female.smd"
	studio "bag_female.smd"
	studio "satchel_female.smd"
}
$bodygroup "radio"
{
	blank
	studio "radio_female.smd"
}
$bodygroup "glasses"
{
	blank
	studio "female_01_glasses_reference.smd"
}

$include "pm_suitfemale_01_lod.qci"

$surfaceprop "flesh"

$contents "solid"

$illumposition -0.058 -0.087 33.286

$eyeposition 0 0 70

$opaque

$cdmaterials "models\tnb\citizens\"
$cdmaterials "models\asais10\specopsrebel\"
$cdmaterials "models\humans\tacfem\"
$cdmaterials "models\humans\newbetacits\"
$cdmaterials "models\humans\bloo_ltcom_zel\citizens\female\"
$cdmaterials "models\humans\bloo_ltcom_zel\citizens\facemaps\"
$cdmaterials "models\humans\bloo_ltcom_zel\citizens\"
$cdmaterials "models\stalkertnb\humans\"
$cdmaterials "models\player\attachments\"

$texturegroup "skinfamilies"
{
	{ "joey_facemap"  }
	{ "joey_facemap2" }
	{ "joey_facemap3" }
	{ "joey_facemap4" }
	{ "joey_facemap"  }
	{ "joey_facemap2" }
	{ "joey_facemap3" }
	{ "joey_facemap4" }
	{ "joey_facemap"  }
	{ "joey_facemap2" }
	{ "joey_facemap3" }
	{ "joey_facemap4" }
}

// This list shows the VMT file names used in the SMD files.
// "mouth.vmt"
// "joey_facemap.vmt"
// "eyeball_l.vmt"
// "eyeball_r.vmt"
// "lambdam_sheet.vmt"
// "rex_marine.vmt"
// "female_hands_glove.vmt"
// "female_hands_glove2.vmt"
// "female_hands.vmt"
// "hat.vmt"
// "facewrap1.vmt"
// "female_rebel1.vmt"
// "gasmask1.vmt"
// "gasmask_glass.vmt"
// "us_ins_attachments_color.vmt"
// "glassesfront_walter.vmt"
// "glassesside_walter.vmt"
// "glass2.vmt"
// "joey_facemap2.vmt"
// "joey_facemap3.vmt"
// "joey_facemap4.vmt"

$attachment "eyes" "ValveBiped.Bip01_Head1" 2.66 -4.29 0.04 rotate 0 -80.1 -90
$attachment "mouth" "ValveBiped.Bip01_Head1" 0.1 -5.7 0 rotate 0 -80 -90
$attachment "chest" "ValveBiped.Bip01_Spine2" 4 4 0 rotate 0 95 90
$attachment "forward" "ValveBiped.forward" 0 0 0 rotate 0 0 0
$attachment "anim_attachment_RH" "ValveBiped.Anim_Attachment_RH" 0 0 0 rotate -90 -90 0
$attachment "anim_attachment_LH" "ValveBiped.Anim_Attachment_LH" 0 0 0 rotate -90 -90 0

// $include "pm_suitfemale_01_box.qci"

$include "pm_suitfemale_01_bone.qci"

$include "pm_suitfemale_01_animation.qci"

$include "pm_suitfemale_01_collision.qci"
