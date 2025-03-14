// Created by Crowbar 0.74

$modelname "weapons\tacint\v_m4.mdl"

$bodygroup "gun"
{
	studio "v_m4_reference.smd"
}
$bodygroup "stock"
{
	studio "v_m4_stock.smd"
	studio "v_m4_stock_in.smd"
}
$bodygroup "sights"
{
	studio "v_m4_sight.smd"
	studio "v_m4_sight_down.smd"
}


$surfaceprop "default"

$contents "solid"

$illumposition -4.775 -18.604 -1.864

$cdmaterials "models\tacint\weapons\v_models\m4\"
$cdmaterials "models\tacint\weapons\v_models\hands\"
$cdmaterials "models\tacint\weapons\v_models\_accessories1\"
$cdmaterials "models\tacint\weapons\v_models\frag\"
$cdmaterials "models\tacint\weapons\v_models\flashbang\"
$cdmaterials "models\tacint\weapons\v_models\smoke\"

$attachment "muzzle" "ValveBiped.m4_rootbone" -4 0 21 rotate -90 90 0
$attachment "bolt" "ValveBiped.bolt" 1.5 0.9 0.5 rotate -15 0 90
$attachment "muzzle_silencer" "ValveBiped.m4_rootbone" -4 0 27.5 rotate -90 90 0
$attachment "magazine" "ValveBiped.magazine" 0 -10 0 rotate 0 0 0

$cbox 0 0 0 0 0 0

$bbox -3.286 -13.317 -9.608 40.493 3.767 5.88

$definebone "ValveBiped.HandControlPosParentL" "" 7.723854 -1.379981 0.132446 12.451519 -30.482902 89.106341 0 0 0 0 0 0
$definebone "ValveBiped.HandControlRotGrandmaL" "" 19.406099 -1.270759 0.611 -2.422351 -1.008406 -2.813567 0 0 0 0 0 0
$definebone "ValveBiped.HandControlPosParentR" "" -7.723807 -1.38 0.132464 12.451519 -30.482902 89.106341 0 0 0 0 0 0
$definebone "ValveBiped.HandControlRotGrandmaR" "" -19.406013 -1.280387 0.61405 -2.405792 -178.994765 -178.293414 0 0 0 0 0 0
$definebone "ValveBiped.Bip01" "" 0 0 0 0 0 89.999982 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_Spine1" "ValveBiped.Bip01" 0 0 0 0 0 0 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_Spine2" "ValveBiped.Bip01_Spine1" 0 0 0 0 0 0 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_Spine4" "ValveBiped.Bip01_Spine2" 0 0 0 0 0 0 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Clavicle" "ValveBiped.Bip01_Spine4" -1.93761 1.822822 1.346623 -0.31723 -163.71499 175.489293 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_UpperArm" "ValveBiped.Bip01_R_Clavicle" 6.028143 0 0 -2.227431 18.534092 95.923914 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Forearm" "ValveBiped.Bip01_R_UpperArm" 11.692553 0 0 -0.000002 -1.493185 -0.000001 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Hand" "ValveBiped.Bip01_R_Forearm" 11.481699 0 0.000001 -3.954046 2.504114 -89.225568 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger4" "ValveBiped.Bip01_R_Hand" 2.6527 0.1722 1.4083 -4.999973 -60.000049 0.000002 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger41" "ValveBiped.Bip01_R_Finger4" 1.35 0.000002 0 0.000001 -24.999986 0.000003 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger42" "ValveBiped.Bip01_R_Finger41" 0.9 0 0 0.000003 -44.999974 0.000001 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger3" "ValveBiped.Bip01_R_Hand" 2.957499 0.1954 0.4403 -2.499987 -50.000041 0.000002 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger31" "ValveBiped.Bip01_R_Finger3" 1.6 0 0 0.000001 -34.999986 0.000003 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger32" "ValveBiped.Bip01_R_Finger31" 1.2 0.000008 0 0.000002 -40.000012 0.000002 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger2" "ValveBiped.Bip01_R_Hand" 3.484098 0.2884 -0.4578 -0.000002 -60.000049 0.000002 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger21" "ValveBiped.Bip01_R_Finger2" 1.770001 0.000002 0 0 -21.999969 0.000003 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger22" "ValveBiped.Bip01_R_Finger21" 1.2 0 0 0.000001 -44.999974 0.000002 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger1" "ValveBiped.Bip01_R_Hand" 3.50289 0.2797 -1.343 -0.000001 -50.000048 0.000002 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger11" "ValveBiped.Bip01_R_Finger1" 1.700006 0 0 0 -21.99998 0.000002 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger12" "ValveBiped.Bip01_R_Finger11" 1.099999 0 0 0.000001 -44.999971 0.000002 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger0" "ValveBiped.Bip01_R_Hand" 0.885323 -0.785479 -1.086804 50.000024 -38.000014 65.000001 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger01" "ValveBiped.Bip01_R_Finger0" 1.920004 0 -0.000001 -0.000015 40.000006 0.000009 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger02" "ValveBiped.Bip01_R_Finger01" 1.199999 0 0 -0.00002 30.000018 -0.000002 0 0 0 0 0 0
$definebone "ValveBiped.Rthumb_muscle4" "ValveBiped.Bip01_R_Finger02" 0.517796 0.068181 0.000001 -0.00002 0.000004 -0.000002 0 0 0 0 0 0
$definebone "ValveBiped.Rthumb_muscle2" "ValveBiped.Bip01_R_Finger01" 0.6618 0.1 -0.000002 -0.000012 -0.00001 0.000008 0 0 0 0 0 0
$definebone "ValveBiped.Rthumb_muscle3" "ValveBiped.Bip01_R_Finger01" 0.93478 0.479219 0 -0.000012 -2.864795 0.000009 0 0 0 0 0 0
$definebone "ValveBiped.Rthumb_muscle1" "ValveBiped.Bip01_R_Finger0" 1.095695 -0.000006 0.202001 -0.000006 -0.000007 0.000017 0 0 0 0 0 0
$definebone "ValveBiped.HOLD_righthand" "ValveBiped.Bip01_R_Hand" 1.788519 -2.98883 0.093953 -1.446749 -178.440523 -177.416418 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Clavicle" "ValveBiped.Bip01_Spine4" 1.93766 1.822816 1.346618 -0.317132 -16.285124 0.395169 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_UpperArm" "ValveBiped.Bip01_L_Clavicle" 6.028142 0 0 0.961939 18.626233 -93.129076 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Forearm" "ValveBiped.Bip01_L_UpperArm" 11.692556 0 0 0.000003 -1.544637 0 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Hand" "ValveBiped.Bip01_L_Forearm" 11.48167 0 -0.000032 3.891476 2.555851 90.136285 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger4" "ValveBiped.Bip01_L_Hand" 2.660234 0.17217 -1.408328 4.999979 -60.000036 0 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger41" "ValveBiped.Bip01_L_Finger4" 1.350005 -0.000002 0 0.000003 -24.99998 0 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger42" "ValveBiped.Bip01_L_Finger41" 0.9 0 0 0 -44.999971 -0.000003 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger3" "ValveBiped.Bip01_L_Hand" 2.965002 0.19541 -0.440341 2.49999 -50.000034 0 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger31" "ValveBiped.Bip01_L_Finger3" 1.600006 -0.000004 0 0.000003 -34.999986 -0.000002 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger32" "ValveBiped.Bip01_L_Finger31" 1.2 0.000011 0 0 -40.000006 -0.000003 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger2" "ValveBiped.Bip01_L_Hand" 3.491583 0.288377 0.457809 0 -60.000029 0 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger21" "ValveBiped.Bip01_L_Finger2" 1.769997 -0.000002 0 0 -21.999973 0 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger22" "ValveBiped.Bip01_L_Finger21" 1.2 0 0 0 -44.999988 0 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger1" "ValveBiped.Bip01_L_Hand" 3.510382 0.27966 1.34302 0 -50.000031 0 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger11" "ValveBiped.Bip01_L_Finger1" 1.700008 0.000006 0 0.000002 -21.999973 0 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger12" "ValveBiped.Bip01_L_Finger11" 1.099997 0.000004 0 0 -44.999981 -0.000001 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger0" "ValveBiped.Bip01_L_Hand" 0.886395 -0.781378 1.094145 -50.000048 -38.000007 -65.000008 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger01" "ValveBiped.Bip01_L_Finger0" 1.919998 -0.000004 -0.000002 0.000014 40.000016 -0.000015 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger02" "ValveBiped.Bip01_L_Finger01" 1.200005 -0.000002 0 0.000022 30.000049 -0.000008 0 0 0 0 0 0
$definebone "ValveBiped.thumb_muscle4" "ValveBiped.Bip01_L_Finger02" 0.517775 0.06818 0.000001 0.000015 0.000028 -0.000009 0 0 0 0 0 0
$definebone "ValveBiped.thumb_muscle3" "ValveBiped.Bip01_L_Finger01" 0.916674 0.46757 0.000001 0.000015 -2.864795 -0.000016 0 0 0 0 0 0
$definebone "ValveBiped.thumb_muscle2" "ValveBiped.Bip01_L_Finger01" 0.661804 0.099997 0.000001 0.000015 -0.000003 -0.000017 0 0 0 0 0 0
$definebone "ValveBiped.thumb_muscle1" "ValveBiped.Bip01_L_Finger0" 1.095688 0.042246 -0.681379 0.000002 -0.000029 -0.000019 0 0 0 0 0 0
$definebone "ValveBiped.HOLD_lefthand" "ValveBiped.Bip01_L_Hand" 1.520723 -3.689481 -0.145827 -1.42403 1.524635 2.781023 0 0 0 0 0 0
$definebone "ValveBiped.m4_rootbone" "" 0 7.116833 -3.659959 89.999982 -89.999982 0 0 0 0 0 0 0
$definebone "ValveBiped.trigger" "ValveBiped.m4_rootbone" -2.093077 0.147351 2.458115 0 0 0 0 0 0 0 0 0
$definebone "ValveBiped.mag_release" "ValveBiped.m4_rootbone" -2.424957 0 3.608857 0 0 0 0 0 0 0 0 0
$definebone "ValveBiped.magazine" "ValveBiped.m4_rootbone" 0.273864 0 5.40611 0 89.999982 0 0 0 0 0 0 0
$definebone "ValveBiped.bullet" "ValveBiped.magazine" 0.026841 4.177545 -0.312768 0 0 -93.803564 0 0 0 0 0 0
$definebone "ValveBiped.bolt" "ValveBiped.m4_rootbone" -4.013935 0 2.127416 0 89.999982 -89.999982 0 0 0 0 0 0
$definebone "ValveBiped.charging_handle" "ValveBiped.m4_rootbone" -4.72705 0 1.072693 0 89.999982 -89.999982 0 0 0 0 0 0
$definebone "ValveBiped.charging_handle_release" "ValveBiped.charging_handle" -0.431461 1.477018 -0.058143 0 0 89.999982 0 0 0 0 0 0
$definebone "ValveBiped.rear_sight2" "ValveBiped.m4_rootbone" -5.266669 0 0.05694 0 0 0 0 0 0 0 0 0
$definebone "ValveBiped.rear_sight1" "ValveBiped.m4_rootbone" -5.349383 0 1.954096 0 0 0 0 0 0 0 0 0
$definebone "ValveBiped.port_cover" "ValveBiped.m4_rootbone" -3.831692 0.746918 5.01055 0 89.999982 -89.999982 0 0 0 0 0 0
$definebone "ValveBiped.HOLD_forearm" "ValveBiped.m4_rootbone" -2.853707 0 10.789087 0 89.999982 0 0 0 0 0 0 0
$definebone "ValveBiped.AK47_rootbone" "" -3.286123 -6.713109 -7.673535 89.073392 -51.3082 38.736588 0 0 0 0 0 0
$definebone "rightarm" "" 0 0 0 0 0 89.999982 0 0 0 0 0 0

$bonemerge "ValveBiped.HandControlPosParentL"
$bonemerge "ValveBiped.HandControlRotGrandmaL"
$bonemerge "ValveBiped.HandControlPosParentR"
$bonemerge "ValveBiped.HandControlRotGrandmaR"
$bonemerge "ValveBiped.Bip01"
$bonemerge "ValveBiped.Bip01_Spine1"
$bonemerge "ValveBiped.Bip01_Spine2"
$bonemerge "ValveBiped.Bip01_Spine4"
$bonemerge "ValveBiped.Bip01_R_Clavicle"
$bonemerge "ValveBiped.Bip01_R_UpperArm"
$bonemerge "ValveBiped.Bip01_R_Forearm"
$bonemerge "ValveBiped.Bip01_R_Hand"
$bonemerge "ValveBiped.Bip01_R_Finger4"
$bonemerge "ValveBiped.Bip01_R_Finger41"
$bonemerge "ValveBiped.Bip01_R_Finger42"
$bonemerge "ValveBiped.Bip01_R_Finger3"
$bonemerge "ValveBiped.Bip01_R_Finger31"
$bonemerge "ValveBiped.Bip01_R_Finger32"
$bonemerge "ValveBiped.Bip01_R_Finger2"
$bonemerge "ValveBiped.Bip01_R_Finger21"
$bonemerge "ValveBiped.Bip01_R_Finger22"
$bonemerge "ValveBiped.Bip01_R_Finger1"
$bonemerge "ValveBiped.Bip01_R_Finger11"
$bonemerge "ValveBiped.Bip01_R_Finger12"
$bonemerge "ValveBiped.Bip01_R_Finger0"
$bonemerge "ValveBiped.Bip01_R_Finger01"
$bonemerge "ValveBiped.Bip01_R_Finger02"
$bonemerge "ValveBiped.Rthumb_muscle4"
$bonemerge "ValveBiped.Rthumb_muscle2"
$bonemerge "ValveBiped.Rthumb_muscle3"
$bonemerge "ValveBiped.Rthumb_muscle1"
$bonemerge "ValveBiped.HOLD_righthand"
$bonemerge "ValveBiped.Bip01_L_Clavicle"
$bonemerge "ValveBiped.Bip01_L_UpperArm"
$bonemerge "ValveBiped.Bip01_L_Forearm"
$bonemerge "ValveBiped.Bip01_L_Hand"
$bonemerge "ValveBiped.Bip01_L_Finger4"
$bonemerge "ValveBiped.Bip01_L_Finger41"
$bonemerge "ValveBiped.Bip01_L_Finger42"
$bonemerge "ValveBiped.Bip01_L_Finger3"
$bonemerge "ValveBiped.Bip01_L_Finger31"
$bonemerge "ValveBiped.Bip01_L_Finger32"
$bonemerge "ValveBiped.Bip01_L_Finger2"
$bonemerge "ValveBiped.Bip01_L_Finger21"
$bonemerge "ValveBiped.Bip01_L_Finger22"
$bonemerge "ValveBiped.Bip01_L_Finger1"
$bonemerge "ValveBiped.Bip01_L_Finger11"
$bonemerge "ValveBiped.Bip01_L_Finger12"
$bonemerge "ValveBiped.Bip01_L_Finger0"
$bonemerge "ValveBiped.Bip01_L_Finger01"
$bonemerge "ValveBiped.Bip01_L_Finger02"
$bonemerge "ValveBiped.thumb_muscle4"
$bonemerge "ValveBiped.thumb_muscle3"
$bonemerge "ValveBiped.thumb_muscle2"
$bonemerge "ValveBiped.thumb_muscle1"
$bonemerge "ValveBiped.HOLD_lefthand"
$bonemerge "ValveBiped.m4_rootbone"
$bonemerge "ValveBiped.HOLD_forearm"
$bonemerge "ValveBiped.AK47_rootbone"
$bonemerge "rightarm"


$sectionframes 30 30

$weightlist "weights_sight_down" {
	 "ValveBiped.HandControlPosParentL" 0
	 "ValveBiped.HandControlRotGrandmaL" 0
	 "ValveBiped.HandControlPosParentR" 0
	 "ValveBiped.HandControlRotGrandmaR" 0
	 "ValveBiped.Bip01" 0
	 "ValveBiped.Bip01_Spine1" 0
	 "ValveBiped.Bip01_Spine2" 0
	 "ValveBiped.Bip01_Spine4" 0
	 "ValveBiped.Bip01_R_Clavicle" 0
	 "ValveBiped.Bip01_R_UpperArm" 0
	 "ValveBiped.Bip01_R_Forearm" 0
	 "ValveBiped.Bip01_R_Hand" 0
	 "ValveBiped.Bip01_R_Finger4" 0
	 "ValveBiped.Bip01_R_Finger41" 0
	 "ValveBiped.Bip01_R_Finger42" 0
	 "ValveBiped.Bip01_R_Finger3" 0
	 "ValveBiped.Bip01_R_Finger31" 0
	 "ValveBiped.Bip01_R_Finger32" 0
	 "ValveBiped.Bip01_R_Finger2" 0
	 "ValveBiped.Bip01_R_Finger21" 0
	 "ValveBiped.Bip01_R_Finger22" 0
	 "ValveBiped.Bip01_R_Finger1" 0
	 "ValveBiped.Bip01_R_Finger11" 0
	 "ValveBiped.Bip01_R_Finger12" 0
	 "ValveBiped.Bip01_R_Finger0" 0
	 "ValveBiped.Bip01_R_Finger01" 0
	 "ValveBiped.Bip01_R_Finger02" 0
	 "ValveBiped.Rthumb_muscle4" 0
	 "ValveBiped.Rthumb_muscle2" 0
	 "ValveBiped.Rthumb_muscle3" 0
	 "ValveBiped.Rthumb_muscle1" 0
	 "ValveBiped.HOLD_righthand" 0
	 "ValveBiped.Bip01_L_Clavicle" 0
	 "ValveBiped.Bip01_L_UpperArm" 0
	 "ValveBiped.Bip01_L_Forearm" 0
	 "ValveBiped.Bip01_L_Hand" 0
	 "ValveBiped.Bip01_L_Finger4" 0
	 "ValveBiped.Bip01_L_Finger41" 0
	 "ValveBiped.Bip01_L_Finger42" 0
	 "ValveBiped.Bip01_L_Finger3" 0
	 "ValveBiped.Bip01_L_Finger31" 0
	 "ValveBiped.Bip01_L_Finger32" 0
	 "ValveBiped.Bip01_L_Finger2" 0
	 "ValveBiped.Bip01_L_Finger21" 0
	 "ValveBiped.Bip01_L_Finger22" 0
	 "ValveBiped.Bip01_L_Finger1" 0
	 "ValveBiped.Bip01_L_Finger11" 0
	 "ValveBiped.Bip01_L_Finger12" 0
	 "ValveBiped.Bip01_L_Finger0" 0
	 "ValveBiped.Bip01_L_Finger01" 0
	 "ValveBiped.Bip01_L_Finger02" 0
	 "ValveBiped.thumb_muscle4" 0
	 "ValveBiped.thumb_muscle3" 0
	 "ValveBiped.thumb_muscle2" 0
	 "ValveBiped.thumb_muscle1" 0
	 "ValveBiped.HOLD_lefthand" 0
	 "ValveBiped.m4_rootbone" 0
	 "ValveBiped.trigger" 0
	 "ValveBiped.mag_release" 0
	 "ValveBiped.magazine" 0
	 "ValveBiped.bullet" 0
	 "ValveBiped.bolt" 0
	 "ValveBiped.charging_handle" 0
	 "ValveBiped.charging_handle_release" 0
	 "ValveBiped.rear_sight2" 1
	 "ValveBiped.rear_sight1" 1
	 "ValveBiped.port_cover" 0
	 "ValveBiped.HOLD_forearm" 0
	 "ValveBiped.AK47_rootbone" 0
	 "rightarm" 0
}

$sequence "range_attack" {
	"v_m4_anims\range_attack.smd"
	activity "ACT_RANGE_ATTACK1" 1
	fadein 0.2
	fadeout 0.2
	fps 12
}

$sequence "range_attack2" {
	"v_m4_anims\range_attack2.smd"
	activity "ACT_RANGE_ATTACK2" 1
	fadein 0.2
	fadeout 0.2
	fps 12
}

$sequence "idle" {
	"v_m4_anims\idle.smd"
	activity "ACT_VM_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 12
}

$sequence "waveover" {
	"v_m4_anims\waveover.smd"
	activity "ACT_VM_WAVEOVER" 1
	fadein 0.2
	fadeout 0.2
	fps 55
}

$sequence "waveover2" {
	"v_m4_anims\waveover2.smd"
	activity "ACT_VM_WAVEOVER2" 1
	fadein 0.2
	fadeout 0.2
	fps 55
}

$sequence "halt" {
	"v_m4_anims\halt.smd"
	activity "ACT_VM_HALT" 1
	fadein 0.2
	fadeout 0.2
	fps 55
}

$sequence "halt2" {
	"v_m4_anims\halt2.smd"
	activity "ACT_VM_HALT2" 1
	fadein 0.2
	fadeout 0.2
	fps 55
}

$sequence "reload" {
	"v_m4_anims\reload.smd"
	activity "ACT_VM_RELOAD" 1
	{ event 5004 1 "tacint_GenericRifle.Jingle" }
	{ event 5004 12 "tacint_m4.Remove_Clip" }
	{ event 5004 37 "tacint_m4.Insert_Clip" }
	{ event 5004 78 "tacint_m4.Bolt_Slap" }
	fadein 0.2
	fadeout 0.2
	fps 40
}

$sequence "midreload" {
	"v_m4_anims\midreload.smd"
	activity "ACT_VM_MIDRELOAD" 1
	{ event 5004 0 "tacint_m4.Insert_Clip-Mid" }
	{ event 5004 26 "tacint_m4.Bolt_Slap" }
	fadein 0.2
	fadeout 0.2
	fps 32
}

$sequence "deploy" {
	"v_m4_anims\deploy.smd"
	activity "ACT_VM_DRAW" 1
	{ event 5004 0 "tacint_m4.Throw_Catch" }
	{ event 5004 25 "tacint_m4.Bolt_Action" }
	fadein 0.2
	fadeout 0.2
	fps 40
}

$sequence "dryfire" {
	"v_m4_anims\dryfire.smd"
	activity "ACT_VM_DRYFIRE" 1
	fadein 0.2
	fadeout 0.2
	snap
	fps 33
}

$sequence "holster" {
	"v_m4_anims\holster.smd"
	activity "ACT_VM_HOLSTER" 1
	{ event 5004 1 "tacint_GenericRifle.Jingle" }
	fadein 0.2
	fadeout 0.2
	fps 33
}

$sequence "unholster" {
	"v_m4_anims\unholster.smd"
	activity "ACT_VM_UNHOLSTER" 1
	{ event 5004 1 "tacint_GenericRifle.Jingle" }
	fadein 0.2
	fadeout 0.2
	fps 33
}

$sequence "prime_grenade" {
	"v_m4_anims\prime_grenade.smd"
	activity "ACT_VM_PRIME_GRENADE" 1
	{ event 5004 7 "Grenade.PullPin" }
	fadein 0.2
	fadeout 0.2
	fps 48
}

$sequence "throw_grenade" {
	"v_m4_anims\throw_grenade.smd"
	activity "ACT_VM_THROW_GRENADE" 1
	{ event 5004 2 "Grenade.Throw" }
	fadein 0.2
	fadeout 0.2
	fps 41
}

$sequence "throw_grenade_underhand" {
	"v_m4_anims\throw_grenade_underhand.smd"
	activity "ACT_VM_THROW_GRENADE_UNDERHAND" 1
	{ event 5004 2 "Grenade.Throw" }
	fadein 0.2
	fadeout 0.2
	fps 41
}

$sequence "melee1" {
	"v_m4_anims\melee1.smd"
	activity "ACT_VM_SECONDARYATTACK" 1
	{ event 5004 2 "Weapon.Thrust" }
	fadein 0.2
	fadeout 0.2
	fps 61
}

$sequence "melee2" {
	"v_m4_anims\melee2.smd"
	activity "ACT_VM_SECONDARYATTACK2" 1
	{ event 5004 2 "Weapon.Swing" }
	fadein 0.2
	fadeout 0.2
	fps 63
}

$sequence "fire1_M" {
	"v_m4_anims\fire1_M.smd"
	activity "ACT_VM_PRIMARYATTACK_1" 1
	{ event 9001 0 "TI_MuzzleFlash_X" }
	{ event 6001 1 "1" }
	fadein 0.2
	fadeout 0.2
	snap
	fps 24
}

$sequence "fire1_L" {
	"v_m4_anims\fire1_L.smd"
	activity "ACT_VM_PRIMARYATTACK_1" 1
	{ event 9001 0 "TI_MuzzleFlash_X" }
	{ event 6001 1 "1" }
	fadein 0.2
	fadeout 0.2
	snap
	fps 24
}

$sequence "fire2_M" {
	"v_m4_anims\fire2_M.smd"
	activity "ACT_VM_PRIMARYATTACK_2" 1
	{ event 9001 0 "TI_MuzzleFlash_X" }
	{ event 6001 1 "1" }
	fadein 0.2
	fadeout 0.2
	snap
	fps 24
}

$sequence "fire2_L" {
	"v_m4_anims\fire2_L.smd"
	activity "ACT_VM_PRIMARYATTACK_2" 1
	{ event 9001 0 "TI_MuzzleFlash_X" }
	{ event 6001 1 "1" }
	fadein 0.2
	fadeout 0.2
	snap
	fps 24
}

$sequence "fire3_M" {
	"v_m4_anims\fire3_M.smd"
	activity "ACT_VM_PRIMARYATTACK_3" 1
	{ event 9001 0 "TI_MuzzleFlash_X" }
	{ event 6001 1 "1" }
	fadein 0.2
	fadeout 0.2
	snap
	fps 24
}

$sequence "fire3_L" {
	"v_m4_anims\fire3_L.smd"
	activity "ACT_VM_PRIMARYATTACK_3" 1
	{ event 9001 0 "TI_MuzzleFlash_X" }
	{ event 6001 1 "1" }
	fadein 0.2
	fadeout 0.2
	snap
	fps 24
}

$sequence "fire4_M" {
	"v_m4_anims\fire4_M.smd"
	activity "ACT_VM_PRIMARYATTACK_4" 1
	{ event 9001 0 "TI_MuzzleFlash_X" }
	{ event 6001 1 "1" }
	fadein 0.2
	fadeout 0.2
	snap
	fps 24
}

$sequence "fire4_L" {
	"v_m4_anims\fire4_L.smd"
	activity "ACT_VM_PRIMARYATTACK_4" 1
	{ event 9001 0 "TI_MuzzleFlash_X" }
	{ event 6001 1 "1" }
	fadein 0.2
	fadeout 0.2
	snap
	fps 24
}

$sequence "fire5_M" {
	"v_m4_anims\fire5_M.smd"
	activity "ACT_VM_PRIMARYATTACK_5_M" 1
	{ event 9001 0 "TI_MuzzleFlash_X" }
	{ event 6001 1 "1" }
	fadein 0.2
	fadeout 0.2
	snap
	fps 18
}

$sequence "fire5_L" {
	"v_m4_anims\fire5_L.smd"
	activity "ACT_VM_PRIMARYATTACK_5_L" 1
	{ event 9001 0 "TI_MuzzleFlash_X" }
	{ event 6001 1 "1" }
	fadein 0.2
	fadeout 0.2
	snap
	fps 18
}

$sequence "fire5_R" {
	"v_m4_anims\fire5_R.smd"
	activity "ACT_VM_PRIMARYATTACK_5_R" 1
	{ event 9001 0 "TI_MuzzleFlash_X" }
	{ event 6001 1 "1" }
	fadein 0.2
	fadeout 0.2
	snap
	fps 18
}

$sequence "Sfire1_M" {
	"v_m4_anims\Sfire1_M.smd"
	activity "ACT_VM_SILENCEDATTACK_1" 1
	{ event 9021 0 "TI_Silenced" }
	{ event 6001 1 "1" }
	fadein 0.2
	fadeout 0.2
	snap
	fps 24
}

$sequence "Sfire1_L" {
	"v_m4_anims\Sfire1_L.smd"
	activity "ACT_VM_SILENCEDATTACK_1" 1
	{ event 9021 0 "TI_Silenced" }
	{ event 6001 1 "1" }
	fadein 0.2
	fadeout 0.2
	snap
	fps 24
}

$sequence "Sfire2_M" {
	"v_m4_anims\Sfire2_M.smd"
	activity "ACT_VM_SILENCEDATTACK_2" 1
	{ event 9021 0 "TI_Silenced" }
	{ event 6001 1 "1" }
	fadein 0.2
	fadeout 0.2
	snap
	fps 24
}

$sequence "Sfire2_R" {
	"v_m4_anims\Sfire2_R.smd"
	activity "ACT_VM_SILENCEDATTACK_2" 1
	{ event 9021 0 "TI_Silenced" }
	{ event 6001 1 "1" }
	fadein 0.2
	fadeout 0.2
	snap
	fps 24
}

$sequence "Sfire3_M" {
	"v_m4_anims\Sfire3_M.smd"
	activity "ACT_VM_SILENCEDATTACK_3" 1
	{ event 9021 0 "TI_Silenced" }
	{ event 6001 1 "1" }
	fadein 0.2
	fadeout 0.2
	snap
	fps 24
}

$sequence "Sfire3_L" {
	"v_m4_anims\Sfire3_L.smd"
	activity "ACT_VM_SILENCEDATTACK_3" 1
	{ event 9021 0 "TI_Silenced" }
	{ event 6001 1 "1" }
	fadein 0.2
	fadeout 0.2
	snap
	fps 24
}

$sequence "Sfire4_M" {
	"v_m4_anims\Sfire4_M.smd"
	activity "ACT_VM_SILENCEDATTACK_4" 1
	{ event 9021 0 "TI_Silenced" }
	{ event 6001 1 "1" }
	fadein 0.2
	fadeout 0.2
	snap
	fps 24
}

$sequence "Sfire4_R" {
	"v_m4_anims\Sfire4_R.smd"
	activity "ACT_VM_SILENCEDATTACK_4" 1
	{ event 9021 0 "TI_Silenced" }
	{ event 6001 1 "1" }
	fadein 0.2
	fadeout 0.2
	snap
	fps 24
}

$sequence "Sfire5_M" {
	"v_m4_anims\Sfire5_M.smd"
	activity "ACT_VM_SILENCEDATTACK_5_M" 1
	{ event 9021 0 "TI_Silenced" }
	{ event 6001 1 "1" }
	fadein 0.2
	fadeout 0.2
	snap
	fps 18
}

$sequence "Sfire5_L" {
	"v_m4_anims\Sfire5_L.smd"
	activity "ACT_VM_SILENCEDATTACK_5_L" 1
	{ event 9021 0 "TI_Silenced" }
	{ event 6001 1 "1" }
	fadein 0.2
	fadeout 0.2
	snap
	fps 18
}

$sequence "Sfire5_R" {
	"v_m4_anims\Sfire5_R.smd"
	activity "ACT_VM_SILENCEDATTACK_5_R" 1
	{ event 9021 0 "TI_Silenced" }
	{ event 6001 1 "1" }
	fadein 0.2
	fadeout 0.2
	snap
	fps 18
}

$sequence "sight_down" {
	"v_m4_anims\sight_down.smd"
	fadein 0.2
	fadeout 0.2
	fps 30
	weightlist "weights_sight_down"
}

$sequence "idle_SD" {
	"v_m4_anims\idle_SD.smd"
	activity "ACT_VM_IDLE_SD" 1
	fadein 0.2
	fadeout 0.2
	addlayer "sight_down"
	snap
	fps 12
}

$sequence "waveover_SD" {
	"v_m4_anims\waveover_SD.smd"
	activity "ACT_VM_WAVEOVER_SD" 1
	fadein 0.2
	fadeout 0.2
	addlayer "sight_down"
	fps 40
}

$sequence "waveover2_SD" {
	"v_m4_anims\waveover2_SD.smd"
	activity "ACT_VM_WAVEOVER_SD2" 1
	fadein 0.2
	fadeout 0.2
	addlayer "sight_down"
	fps 40
}

$sequence "halt_SD" {
	"v_m4_anims\halt_SD.smd"
	activity "ACT_VM_HALT_SD" 1
	fadein 0.2
	fadeout 0.2
	addlayer "sight_down"
	fps 30
}

$sequence "halt2_SD" {
	"v_m4_anims\halt2_SD.smd"
	activity "ACT_VM_HALT_SD2" 1
	fadein 0.2
	fadeout 0.2
	addlayer "sight_down"
	fps 30
}

$sequence "reload_SD" {
	"v_m4_anims\reload_SD.smd"
	activity "ACT_VM_RELOAD_SD" 1
	{ event 5004 1 "tacint_GenericRifle.Jingle" }
	{ event 5004 12 "tacint_m4.Remove_Clip" }
	{ event 5004 42 "tacint_m4.Insert_Clip" }
	{ event 5004 83 "tacint_m4.Bolt_Slap" }
	fadein 0.2
	fadeout 0.2
	addlayer "sight_down"
	fps 40
}

$sequence "midreload_SD" {
	"v_m4_anims\midreload_SD.smd"
	activity "ACT_VM_MIDRELOAD_SD" 1
	{ event 5004 0 "tacint_m4.Insert_Clip-Mid" }
	{ event 5004 29 "tacint_m4.Bolt_Slap" }
	fadein 0.2
	fadeout 0.2
	addlayer "sight_down"
	fps 32
}

$sequence "deploy_SD" {
	"v_m4_anims\deploy_SD.smd"
	activity "ACT_VM_DRAW_SD" 1
	{ event 5004 0 "tacint_m4.Throw_Catch" }
	{ event 5004 25 "tacint_m4.Bolt_Action" }
	fadein 0.2
	fadeout 0.2
	addlayer "sight_down"
	fps 40
}

$sequence "dryfire_SD" {
	"v_m4_anims\dryfire_SD.smd"
	activity "ACT_VM_DRYFIRE_SD" 1
	fadein 0.2
	fadeout 0.2
	addlayer "sight_down"
	snap
	fps 33
}

$sequence "holster_SD" {
	"v_m4_anims\holster_SD.smd"
	activity "ACT_VM_HOLSTER_SD" 1
	{ event 5004 1 "tacint_GenericRifle.Jingle" }
	fadein 0.2
	fadeout 0.2
	addlayer "sight_down"
	fps 33
}

$sequence "unholster_SD" {
	"v_m4_anims\unholster_SD.smd"
	activity "ACT_VM_UNHOLSTER_SD" 1
	{ event 5004 1 "tacint_GenericRifle.Jingle" }
	fadein 0.2
	fadeout 0.2
	addlayer "sight_down"
	fps 60
}

$sequence "melee1_SD" {
	"v_m4_anims\melee1_SD.smd"
	activity "ACT_VM_SECONDARYATTACK_SD" 1
	{ event 5004 2 "Weapon.Thrust" }
	fadein 0.2
	fadeout 0.2
	addlayer "sight_down"
	fps 61
}

$sequence "melee2_SD" {
	"v_m4_anims\melee2_SD.smd"
	activity "ACT_VM_SECONDARYATTACK_SD2" 1
	{ event 5004 2 "Weapon.Swing" }
	fadein 0.2
	fadeout 0.2
	addlayer "sight_down"
	fps 63
}

$sequence "fire1_M_SD" {
	"v_m4_anims\fire1_M_SD.smd"
	activity "ACT_VM_PRIMARYATTACK_1_SD" 1
	{ event 9001 0 "TI_MuzzleFlash_X" }
	{ event 6001 1 "1" }
	fadein 0.2
	fadeout 0.2
	addlayer "sight_down"
	snap
	fps 24
}

$sequence "fire1_L_SD" {
	"v_m4_anims\fire1_L_SD.smd"
	activity "ACT_VM_PRIMARYATTACK_1_SD" 1
	{ event 9001 0 "TI_MuzzleFlash_X" }
	{ event 6001 1 "1" }
	fadein 0.2
	fadeout 0.2
	addlayer "sight_down"
	snap
	fps 24
}

$sequence "fire2_M_SD" {
	"v_m4_anims\fire2_M_SD.smd"
	activity "ACT_VM_PRIMARYATTACK_2_SD" 1
	{ event 9001 0 "TI_MuzzleFlash_X" }
	{ event 6001 1 "1" }
	fadein 0.2
	fadeout 0.2
	addlayer "sight_down"
	snap
	fps 24
}

$sequence "fire2_L_SD" {
	"v_m4_anims\fire2_L_SD.smd"
	activity "ACT_VM_PRIMARYATTACK_2_SD" 1
	{ event 9001 0 "TI_MuzzleFlash_X" }
	{ event 6001 1 "1" }
	fadein 0.2
	fadeout 0.2
	addlayer "sight_down"
	snap
	fps 24
}

$sequence "fire3_M_SD" {
	"v_m4_anims\fire3_M_SD.smd"
	activity "ACT_VM_PRIMARYATTACK_3_SD" 1
	{ event 9001 0 "TI_MuzzleFlash_X" }
	{ event 6001 1 "1" }
	fadein 0.2
	fadeout 0.2
	addlayer "sight_down"
	snap
	fps 24
}

$sequence "fire3_L_SD" {
	"v_m4_anims\fire3_L_SD.smd"
	activity "ACT_VM_PRIMARYATTACK_3_SD" 1
	{ event 9001 0 "TI_MuzzleFlash_X" }
	{ event 6001 1 "1" }
	fadein 0.2
	fadeout 0.2
	addlayer "sight_down"
	snap
	fps 24
}

$sequence "fire4_M_SD" {
	"v_m4_anims\fire4_M_SD.smd"
	activity "ACT_VM_PRIMARYATTACK_4_SD" 1
	{ event 9001 0 "TI_MuzzleFlash_X" }
	{ event 6001 1 "1" }
	fadein 0.2
	fadeout 0.2
	addlayer "sight_down"
	snap
	fps 24
}

$sequence "fire4_L_SD" {
	"v_m4_anims\fire4_L_SD.smd"
	activity "ACT_VM_PRIMARYATTACK_4_SD" 1
	{ event 9001 0 "TI_MuzzleFlash_X" }
	{ event 6001 1 "1" }
	fadein 0.2
	fadeout 0.2
	addlayer "sight_down"
	snap
	fps 24
}

$sequence "fire5_M_SD" {
	"v_m4_anims\fire5_M_SD.smd"
	activity "ACT_VM_PRIMARYATTACK_5_SD_M" 1
	{ event 9001 0 "TI_MuzzleFlash_X" }
	{ event 6001 1 "1" }
	fadein 0.2
	fadeout 0.2
	addlayer "sight_down"
	snap
	fps 18
}

$sequence "fire5_L_SD" {
	"v_m4_anims\fire5_L_SD.smd"
	activity "ACT_VM_PRIMARYATTACK_5_SD_L" 1
	{ event 9001 0 "TI_MuzzleFlash_X" }
	{ event 6001 1 "1" }
	fadein 0.2
	fadeout 0.2
	addlayer "sight_down"
	snap
	fps 18
}

$sequence "fire5_R_SD" {
	"v_m4_anims\fire5_R_SD.smd"
	activity "ACT_VM_PRIMARYATTACK_5_SD_R" 1
	{ event 9001 0 "TI_MuzzleFlash_X" }
	{ event 6001 1 "1" }
	fadein 0.2
	fadeout 0.2
	addlayer "sight_down"
	snap
	fps 18
}

$sequence "Sfire1_M_SD" {
	"v_m4_anims\Sfire1_M_SD.smd"
	activity "ACT_VM_SILENCEDATTACK_1_SD" 1
	{ event 9021 0 "TI_Silenced" }
	{ event 6001 1 "1" }
	fadein 0.2
	fadeout 0.2
	addlayer "sight_down"
	snap
	fps 24
}

$sequence "Sfire1_L_SD" {
	"v_m4_anims\Sfire1_L_SD.smd"
	activity "ACT_VM_SILENCEDATTACK_1_SD" 1
	{ event 9021 0 "TI_Silenced" }
	{ event 6001 1 "1" }
	fadein 0.2
	fadeout 0.2
	addlayer "sight_down"
	snap
	fps 24
}

$sequence "Sfire2_M_SD" {
	"v_m4_anims\Sfire2_M_SD.smd"
	activity "ACT_VM_SILENCEDATTACK_2_SD" 1
	{ event 9021 0 "TI_Silenced" }
	{ event 6001 1 "1" }
	fadein 0.2
	fadeout 0.2
	addlayer "sight_down"
	snap
	fps 24
}

$sequence "Sfire2_R_SD" {
	"v_m4_anims\Sfire2_R_SD.smd"
	activity "ACT_VM_SILENCEDATTACK_2_SD" 1
	{ event 9021 0 "TI_Silenced" }
	{ event 6001 1 "1" }
	fadein 0.2
	fadeout 0.2
	addlayer "sight_down"
	snap
	fps 24
}

$sequence "Sfire3_M_SD" {
	"v_m4_anims\Sfire3_M_SD.smd"
	activity "ACT_VM_SILENCEDATTACK_3_SD" 1
	{ event 9021 0 "TI_Silenced" }
	{ event 6001 1 "1" }
	fadein 0.2
	fadeout 0.2
	addlayer "sight_down"
	snap
	fps 24
}

$sequence "Sfire3_L_SD" {
	"v_m4_anims\Sfire3_L_SD.smd"
	activity "ACT_VM_SILENCEDATTACK_3_SD" 1
	{ event 9021 0 "TI_Silenced" }
	{ event 6001 1 "1" }
	fadein 0.2
	fadeout 0.2
	addlayer "sight_down"
	snap
	fps 24
}

$sequence "Sfire4_M_SD" {
	"v_m4_anims\Sfire4_M_SD.smd"
	activity "ACT_VM_SILENCEDATTACK_4_SD" 1
	{ event 9021 0 "TI_Silenced" }
	{ event 6001 1 "1" }
	fadein 0.2
	fadeout 0.2
	addlayer "sight_down"
	snap
	fps 24
}

$sequence "Sfire4_R_SD" {
	"v_m4_anims\Sfire4_R_SD.smd"
	activity "ACT_VM_SILENCEDATTACK_4_SD" 1
	{ event 9021 0 "TI_Silenced" }
	{ event 6001 1 "1" }
	fadein 0.2
	fadeout 0.2
	addlayer "sight_down"
	snap
	fps 24
}

$sequence "Sfire5_M_SD" {
	"v_m4_anims\Sfire5_M_SD.smd"
	activity "ACT_VM_SILENCEDATTACK_5_SD_M" 1
	{ event 9021 0 "TI_Silenced" }
	{ event 6001 1 "1" }
	fadein 0.2
	fadeout 0.2
	addlayer "sight_down"
	snap
	fps 18
}

$sequence "Sfire5_L_SD" {
	"v_m4_anims\Sfire5_L_SD.smd"
	activity "ACT_VM_SILENCEDATTACK_5_SD_L" 1
	{ event 9021 0 "TI_Silenced" }
	{ event 6001 1 "1" }
	fadein 0.2
	fadeout 0.2
	addlayer "sight_down"
	snap
	fps 18
}

$sequence "Sfire5_R_SD" {
	"v_m4_anims\Sfire5_R_SD.smd"
	activity "ACT_VM_SILENCEDATTACK_5_SD_R" 1
	{ event 9021 0 "TI_Silenced" }
	{ event 6001 1 "1" }
	fadein 0.2
	fadeout 0.2
	addlayer "sight_down"
	snap
	fps 18
}

$sequence "blind_idle" {
	"v_m4_anims\blind_idle.smd"
	activity "ACT_VM_IDLE_BLIND" 1
	fadein 0.2
	fadeout 0.2
	fps 12
}

$sequence "blind_dryfire" {
	"v_m4_anims\blind_dryfire.smd"
	activity "ACT_VM_BLIND_DRYFIRE" 1
	fadein 0.2
	fadeout 0.2
	snap
	fps 35
}

$sequence "blind_fire1" {
	"v_m4_anims\blind_fire1.smd"
	activity "ACT_VM_BLINDATTACK_1" 1
	{ event 9001 0 "TI_MuzzleFlash_X" }
	{ event 6001 1 "1" }
	fadein 0.2
	fadeout 0.2
	snap
	fps 24
}

$sequence "blind_fire2" {
	"v_m4_anims\blind_fire2.smd"
	activity "ACT_VM_BLINDATTACK_1" 1
	{ event 9001 0 "TI_MuzzleFlash_X" }
	{ event 6001 1 "1" }
	fadein 0.2
	fadeout 0.2
	snap
	fps 24
}

$sequence "blind_fire3" {
	"v_m4_anims\blind_fire3.smd"
	activity "ACT_VM_BLINDATTACK_1" 1
	{ event 9001 0 "TI_MuzzleFlash_X" }
	{ event 6001 1 "1" }
	fadein 0.2
	fadeout 0.2
	snap
	fps 24
}

$sequence "blind_Sfire1" {
	"v_m4_anims\blind_Sfire1.smd"
	activity "ACT_VM_BLINDSILENCEDATTACK_1" 1
	{ event 9021 0 "TI_Silenced" }
	{ event 6001 1 "1" }
	fadein 0.2
	fadeout 0.2
	snap
	fps 24
}

$sequence "blind_Sfire2" {
	"v_m4_anims\blind_Sfire2.smd"
	activity "ACT_VM_BLINDSILENCEDATTACK_1" 1
	{ event 9021 0 "TI_Silenced" }
	{ event 6001 1 "1" }
	fadein 0.2
	fadeout 0.2
	snap
	fps 24
}

$sequence "blind_Sfire3" {
	"v_m4_anims\blind_Sfire3.smd"
	activity "ACT_VM_BLINDSILENCEDATTACK_1" 1
	{ event 9021 0 "TI_Silenced" }
	{ event 6001 1 "1" }
	fadein 0.2
	fadeout 0.2
	snap
	fps 24
}

$sequence "blind_idle_SD" {
	"v_m4_anims\blind_idle_SD.smd"
	activity "ACT_VM_IDLE_BLIND_SD" 1
	fadein 0.2
	fadeout 0.2
	addlayer "sight_down"
	snap
	fps 12
}

$sequence "blind_dryfire_SD" {
	"v_m4_anims\blind_dryfire_SD.smd"
	activity "ACT_VM_BLIND_DRYFIRE_SD" 1
	fadein 0.2
	fadeout 0.2
	addlayer "sight_down"
	snap
	fps 35
}

$sequence "blind_fire1_SD" {
	"v_m4_anims\blind_fire1_SD.smd"
	activity "ACT_VM_BLINDATTACK_1_SD" 1
	{ event 9001 0 "TI_MuzzleFlash_X" }
	{ event 6001 1 "1" }
	fadein 0.2
	fadeout 0.2
	addlayer "sight_down"
	snap
	fps 24
}

$sequence "blind_fire2_SD" {
	"v_m4_anims\blind_fire2_SD.smd"
	activity "ACT_VM_BLINDATTACK_1_SD" 1
	{ event 9001 0 "TI_MuzzleFlash_X" }
	{ event 6001 1 "1" }
	fadein 0.2
	fadeout 0.2
	addlayer "sight_down"
	snap
	fps 24
}

$sequence "blind_fire3_SD" {
	"v_m4_anims\blind_fire3_SD.smd"
	activity "ACT_VM_BLINDATTACK_1_SD" 1
	{ event 9001 0 "TI_MuzzleFlash_X" }
	{ event 6001 1 "1" }
	fadein 0.2
	fadeout 0.2
	addlayer "sight_down"
	snap
	fps 24
}

$sequence "blind_Sfire1_SD" {
	"v_m4_anims\blind_Sfire1_SD.smd"
	activity "ACT_VM_BLINDSILENCEDATTACK_1_SD" 1
	{ event 9021 0 "TI_Silenced" }
	{ event 6001 1 "1" }
	fadein 0.2
	fadeout 0.2
	addlayer "sight_down"
	snap
	fps 24
}

$sequence "blind_Sfire2_SD" {
	"v_m4_anims\blind_Sfire2_SD.smd"
	activity "ACT_VM_BLINDSILENCEDATTACK_1_SD" 1
	{ event 9021 0 "TI_Silenced" }
	{ event 6001 1 "1" }
	fadein 0.2
	fadeout 0.2
	addlayer "sight_down"
	snap
	fps 24
}

$sequence "blind_Sfire3_SD" {
	"v_m4_anims\blind_Sfire3_SD.smd"
	activity "ACT_VM_BLINDSILENCEDATTACK_1_SD" 1
	{ event 9021 0 "TI_Silenced" }
	{ event 6001 1 "1" }
	fadein 0.2
	fadeout 0.2
	addlayer "sight_down"
	snap
	fps 24
}

$keyvalues
{
	qc_path models\weapons\v_models\m4\v_m4.qc
}
