

$modelname "weapons\w_models\W_Chauchat.mdl"

$bodygroup "base"
{
 studio "Chauchat.smd"
}
$bodygroup "bolt"
{
    studio "bolt.smd"
}
$bodygroup "Model"
{
    studio "m1915.smd"
    studio "m1918.smd"
}

$surfaceprop "weapon"

$contents "solid"

$cdmaterials "models\v_models\weapons\Chauchat\"

$sequence "idle" {
	"anims\idle.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}


$include "DefineBones.qci"

$collisionmodel "w_ak47_physics.smd"
{
	$mass 5
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "

}

