// Created by Crowbar 0.74

$modelname "w_models\Weapons\w_smg_a.mdl"

$bodygroup "main"
{
	studio "w_smg_uzi_reference.smd"
}
$bodygroup "adds"
{
	studio "w_smg_uzi_reference_adds.smd"
}


$surfaceprop "weapon"

$contents "solid"

$illumposition 0 0 7

$cdmaterials "models\v_models\Weapons\ww2_pp43_batt44\"

$attachment "muzzle_flash" "ValveBiped.flash" 0 0 0 rotate -90 0 0
$attachment "flashlight" "ValveBiped.flashlight" 0 0 0 rotate 0 0 0
$attachment "shell" "ValveBiped.weapon_bone" -0.8 2.71 10.5 rotate 0 180 90

$cbox 0 0 0 0 0 0

$bbox -8.26 -2.111 -6.241 24.859 1.204 4.513

$definebone "ValveBiped" "" 0 0 0 0 0 89.999982 0 0 0 0 0 0
$definebone "ValveBiped.weapon_bone" "ValveBiped" 0 0.744264 2.049373 0 0 0 0 0 0 0 0 0
$definebone "ValveBiped.flash" "ValveBiped.weapon_bone" 0.002705 2.16089 22.809189 0 0 0 0 0 0 0 0 0
$definebone "ValveBiped.flashlight" "ValveBiped.weapon_bone" -1.106104 1.455318 17.699741 0 0 0 0 0 0 0 0 0


$sequence "idle" {
	"w_smg_a_anims\idle.smd"
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "w_smg_a_physics.smd"
{
	$mass 5
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "

}

$keyvalues
{
	prop_data 
	{
		"base" "Metal.Small"
	}
}
