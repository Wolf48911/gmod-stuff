// Created by Crowbar 0.74

$modelname "lightshoro_workshop/goofycat/boykisser_v2.mdl"

$model "Boykisser (Goofy Cat)" "Body.smd" {

	flexfile "boykisser_v2_01.vta" 
	{
		defaultflex frame 0
		flex "vrc_vaa" frame 1
		flex "vrc_vch" frame 2
		flex "vrc_vdd" frame 3
		flex "vrc_ve" frame 4
		flex "vrc_vff" frame 5
		flex "vrc_vih" frame 6
		flex "vrc_vkk" frame 7
		flex "vrc_vnn" frame 8
		flex "vrc_voh" frame 9
		flex "vrc_vou" frame 10
		flex "vrc_vpp" frame 11
		flex "vrc_vrr" frame 12
		flex "vrc_vss" frame 13
		flex "vrc_vth" frame 14
		flex "CH" frame 15
		flex "EyesClosed_L" frame 16
		flex "EyesClosed_R" frame 17
		flex "Suspect_L" frame 18
		flex "Suspect_R" frame 19
		flex "Scare" frame 20
		flex "AA" frame 21
		flex "OH" frame 22
		flex "Scare_001" frame 23
		flex "Scare_002" frame 24
		flex "Sad" frame 25
		flex "YouLikeKissingBoys" frame 26
	}

	flexcontroller vrc_vaa range 0 1 "vrc_vaa"
	flexcontroller vrc_vch range 0 1 "vrc_vch"
	flexcontroller vrc_vdd range 0 1 "vrc_vdd"
	flexcontroller vrc_ve range 0 1 "vrc_ve"
	flexcontroller vrc_vff range 0 1 "vrc_vff"
	flexcontroller vrc_vih range 0 1 "vrc_vih"
	flexcontroller vrc_vkk range 0 1 "vrc_vkk"
	flexcontroller vrc_vnn range 0 1 "vrc_vnn"
	flexcontroller vrc_voh range 0 1 "vrc_voh"
	flexcontroller vrc_vou range 0 1 "vrc_vou"
	flexcontroller vrc_vpp range 0 1 "vrc_vpp"
	flexcontroller vrc_vrr range 0 1 "vrc_vrr"
	flexcontroller vrc_vsil range 0 1 "vrc_vsil"
	flexcontroller vrc_vss range 0 1 "vrc_vss"
	flexcontroller vrc_vth range 0 1 "vrc_vth"
	flexcontroller CH range 0 1 "CH"
	flexcontroller EyesClosed_L range 0 1 "EyesClosed_L"
	flexcontroller EyesClosed_R range 0 1 "EyesClosed_R"
	flexcontroller Suspect_L range 0 1 "Suspect_L"
	flexcontroller Suspect_R range 0 1 "Suspect_R"
	flexcontroller Scare range 0 1 "Scare"
	flexcontroller AA range 0 1 "AA"
	flexcontroller OH range 0 1 "OH"
	flexcontroller Scare_001 range 0 1 "Scare_001"
	flexcontroller Scare_002 range 0 1 "Scare_002"
	flexcontroller Sad range 0 1 "Sad"
	flexcontroller YouLikeKissingBoys range 0 1 "YouLikeKissingBoys"

	localvar vrc_vsil
	%vrc_vaa = vrc_vaa
	%vrc_vch = vrc_vch
	%vrc_vdd = vrc_vdd
	%vrc_ve = vrc_ve
	%vrc_vff = vrc_vff
	%vrc_vih = vrc_vih
	%vrc_vkk = vrc_vkk
	%vrc_vnn = vrc_vnn
	%vrc_voh = vrc_voh
	%vrc_vou = vrc_vou
	%vrc_vpp = vrc_vpp
	%vrc_vrr = vrc_vrr
	%vrc_vsil = vrc_vsil
	%vrc_vss = vrc_vss
	%vrc_vth = vrc_vth
	%CH = CH
	%EyesClosed_L = EyesClosed_L
	%EyesClosed_R = EyesClosed_R
	%Suspect_L = Suspect_L
	%Suspect_R = Suspect_R
	%Scare = Scare
	%AA = AA
	%OH = OH
	%Scare_001 = Scare_001
	%Scare_002 = Scare_002
	%Sad = Sad
	%YouLikeKissingBoys = YouLikeKissingBoys
}
$bodygroup "Fur (Arms)"
{
	studio "fur_arms.smd"
	blank
}
$bodygroup "Fur (Chest)"
{
	studio "fur_chest.smd"
	blank
}
$bodygroup "Fur (Thighs)"
{
	studio "fur_thighs.smd"
	blank
}
$bodygroup "Claws (Hands)"
{
	studio "claws_hands.smd"
	blank
}
$bodygroup "Claws (Feet)"
{
	studio "claws_feet.smd"
	blank
}
$bodygroup "Collar"
{
	blank
	studio "collar.smd"
}
$bodygroup "Thigh-highs"
{
	blank
	studio "thighhighs.smd"
}
$bodygroup "Arm Warmers"
{
	blank
	studio "arm_warmers.smd"
}
$bodygroup "Hoodie"
{
	blank
	studio "hoodie.smd"
}
$bodygroup "Shorts"
{
	blank
	studio "shorts.smd"
}
$bodygroup "Shirt"
{
	blank
	studio "shirt.smd"
}
$bodygroup "decal"
{
	blank
	studio "decal.smd"
	studio "decalhood.smd"
	studio "decal2.smd"
	studio "decalhood2.smd"
	studio "decal3.smd"
	studio "decalhood3.smd"
}

$surfaceprop "default"

$contents "solid"

$illumposition -0.003 15.952 38.237

$cdmaterials "models\lightshoro_workshop\goofycat\"
$cdmaterials "models\stas_jacovlev\goofycat\"
$cdmaterials ""

$texturegroup "skinfamilies"
{
	{ "Toon2"   "Eyes"    }
	{ "BodyOwO" "EyesOwO" }
	{ "Toon2"   "EyesOhO" }
}

$attachment "eyes" "ValveBiped.Bip01_Head1" 5.5 -2.5 0 rotate 0 -75.73 -90
$attachment "mouth" "ValveBiped.Bip01_Head1" 0.8 -5.8 -0.15 rotate 0 -80 -90
$attachment "chest" "ValveBiped.Bip01_Spine2" 4 4 0 rotate 0 95 90
$attachment "forward" "ValveBiped.forward" 0 0 0 rotate 0 0 0
$attachment "anim_attachment_RH" "ValveBiped.Anim_Attachment_RH" 0 0 0 rotate -90 -90 0
$attachment "anim_attachment_LH" "ValveBiped.Anim_Attachment_LH" 0 0 0 rotate -90 -90 0

$cbox 0 0 0 0 0 0

$bbox -41.067 -39.779 -2.625 9.163 39.773 79.099

$hboxset "default"
$hbox 3 "ValveBiped.Bip01_Pelvis" -6 -1.79 -5 6 8.21 5
$hbox 6 "ValveBiped.Bip01_L_Thigh" -4 -4 -5 12 4 3
$hbox 6 "ValveBiped.Bip01_L_Calf" -2.86 -2.87 -3.86 17.139999 4.13 3.14
$hbox 6 "ValveBiped.Bip01_L_Foot" -1.92 -5.14 -3.74 5.08 1.86 3.26
$hbox 7 "ValveBiped.Bip01_R_Thigh" -4 -4 -3 12 4 5
$hbox 7 "ValveBiped.Bip01_R_Calf" -2.86 -2.87 -3.14 17.139999 4.13 3.86
$hbox 7 "ValveBiped.Bip01_R_Foot" -1.92 -5.14 -3.25 5.08 1.86 3.75
$hbox 3 "ValveBiped.Bip01_Spine" -3 -3.35 -5 7 4.65 5
$hbox 2 "ValveBiped.Bip01_Spine4" -1 -4.73 -5.23 9 5.16 5.23
$hbox 2 "ValveBiped.Bip01_Neck1" -1.5 -1.5 -2.5 3.5 3.5 2.5
$hbox 1 "ValveBiped.Bip01_Head1" 0.17 -6.04 -5 10.17 5.96 5
$hbox 4 "ValveBiped.Bip01_L_UpperArm" 0.18 -2.51 -2.75 8.18 3.15 2.79
$hbox 4 "ValveBiped.Bip01_L_Forearm" -1 -2.63 -2.24 7 2.61 1.9
$hbox 4 "ValveBiped.Bip01_L_Hand" 0 -2.8 -3.33 8 1.85 3.95
$hbox 5 "ValveBiped.Bip01_R_UpperArm" 0.18 -2.51 -2.79 8.18 3.15 2.76
$hbox 5 "ValveBiped.Bip01_R_Forearm" -1 -2.63 -1.91 7 2.61 2.23
$hbox 5 "ValveBiped.Bip01_R_Hand" -0.01 -2.8 -3.94 8.01 1.85 3.35
$skipboneinbbox

$definebone "ValveBiped.Bip01_Pelvis" "" 0 0.125034 32.086365 0 0.000041 90.000009 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Thigh" "ValveBiped.Bip01_Pelvis" 4.304712 0.348675 0.000003 -1.06891 -90.000003 -90.01757 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Calf" "ValveBiped.Bip01_L_Thigh" 11.226997 -0.000133 0 -0.002371 7.720334 -0.285231 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Foot" "ValveBiped.Bip01_L_Calf" 19.719959 0.000074 0.000001 0.984752 -57.434391 0.504212 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Toe0" "ValveBiped.Bip01_L_Foot" 2.379977 -1.942026 0.041879 -0.199853 -31.819973 -0.060197 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Thigh" "ValveBiped.Bip01_Pelvis" -4.304713 0.348675 -0.000003 -1.068896 -89.999968 -89.982333 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Calf" "ValveBiped.Bip01_R_Thigh" 11.227018 -0.000131 -0.000002 0.002388 7.720568 0.291725 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Foot" "ValveBiped.Bip01_R_Calf" 19.71998 -0.000005 0.000002 -1.114169 -57.426202 -0.122058 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Toe0" "ValveBiped.Bip01_R_Foot" 2.379634 -1.942601 -0.033948 0.372141 -31.858584 -3.502499 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_Spine" "ValveBiped.Bip01_Pelvis" 0.000001 6.061371 0.000001 4.944515 89.999709 89.999921 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_Spine1" "ValveBiped.Bip01_Spine" 5.288132 0.457495 -0.000027 0.00005 -1.674987 -0.000011 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_Spine2" "ValveBiped.Bip01_Spine1" -0.000004 0 0 -0.002502 5.748663 0.000023 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_Spine4" "ValveBiped.Bip01_Spine2" 0 0 0 0.002961 11.121356 0.000528 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_Neck1" "ValveBiped.Bip01_Spine4" 8.257679 -1.493304 0.000038 -0.001123 21.369913 179.999759 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_Head1" "ValveBiped.Bip01_Neck1" 2.873138 1.61735 0.000048 0.000591 17.3468 -0.000252 0 0 0 0 0 0
$definebone "Eye.L" "ValveBiped.Bip01_Head1" 4.686569 0.159497 -1.757966 89.998643 -165.726358 0 0 0 0 0 0 0
$definebone "Eye.R" "ValveBiped.Bip01_Head1" 4.68647 0.159488 1.758209 89.998397 -165.726358 0 0 0 0 0 0 0
$definebone "Ear.L.001" "ValveBiped.Bip01_Head1" 6.545063 2.522651 -3.76725 62.413654 -156.639761 -66.789954 0 0 0 0 0 0
$definebone "Ear.L.002" "Ear.L.001" -0.000006 2.238403 0 -0.854177 -0.916189 0.913557 0 0 0 0 0 0
$definebone "Ear.L.003" "Ear.L.002" 0.000011 2.479095 0.000007 1.084065 1.331964 -1.893036 0 0 0 0 0 0
$definebone "Ear.R.001" "ValveBiped.Bip01_Head1" 6.544865 2.522628 3.767601 62.410854 23.358496 113.208145 0 0 0 0 0 0
$definebone "Ear.R.002" "Ear.R.001" 0.000004 2.238403 -0.000003 0.854181 0.916187 0.913534 0 0 0 0 0 0
$definebone "Ear.R.003" "Ear.R.002" -0.000017 2.479088 0.000008 -1.084011 -1.331965 -1.892987 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Clavicle" "ValveBiped.Bip01_Spine4" 6.70509 0.009945 1.356977 -63.945454 170.170079 89.633372 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_UpperArm" "ValveBiped.Bip01_L_Clavicle" 3.123327 1.447121 -1.124739 3.552918 21.489162 -90.419137 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Forearm" "ValveBiped.Bip01_L_UpperArm" 7.450422 -0.000006 0.000004 -2.683322 -6.551092 -0.029854 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Hand" "ValveBiped.Bip01_L_Forearm" 6.26655 0.000006 -0.000008 -6.115792 7.729179 90.152978 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger2" "ValveBiped.Bip01_L_Hand" 3.841063 -0.771828 0.731458 -4.953793 -4.23735 1.75212 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger21" "ValveBiped.Bip01_L_Finger2" 1.285677 -0.000004 -0.000003 0.001528 -0.000137 -1.900331 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger22" "ValveBiped.Bip01_L_Finger21" 0.895241 -0.000004 -0.000001 0.176028 -12.398276 0.000017 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger1" "ValveBiped.Bip01_L_Hand" 3.004602 -0.712967 1.606226 -4.942991 -4.237105 15.155018 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger11" "ValveBiped.Bip01_L_Finger1" 1.258438 -0.000004 -0.000003 0.000092 -0.000422 -2.424817 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger12" "ValveBiped.Bip01_L_Finger11" 0.787266 0.000004 0 0.148319 -13.99881 0.00008 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger0" "ValveBiped.Bip01_L_Hand" 1.180635 -0.580635 2.295284 -39.236783 -4.374518 -101.337461 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger01" "ValveBiped.Bip01_L_Finger0" 0.866852 -0.000005 0 -2.397238 11.787638 -8.18411 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger02" "ValveBiped.Bip01_L_Finger01" 0.843597 -0.000004 0.000004 0.645419 20.790763 0.001056 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger4" "ValveBiped.Bip01_L_Hand" 3.279665 -0.722797 -1.574007 -4.954708 -4.237566 -26.37663 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger41" "ValveBiped.Bip01_L_Finger4" 1.258436 0.000011 0.000002 0.000356 -0.000004 0.029234 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger42" "ValveBiped.Bip01_L_Finger41" 0.78726 0.000004 0.000002 0.285194 -13.99578 -0.000807 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger3" "ValveBiped.Bip01_L_Hand" 3.94898 -0.775681 -0.516314 -4.94296 -4.237042 -10.995528 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger31" "ValveBiped.Bip01_L_Finger3" 1.285669 0 -0.000006 0.000031 0.000051 0.463732 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger32" "ValveBiped.Bip01_L_Finger31" 0.895235 0.000004 -0.000001 0.42175 -24.684019 0.000071 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Clavicle" "ValveBiped.Bip01_Spine4" 6.705109 0.009948 -1.356914 64.042306 169.572833 -90.20861 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_UpperArm" "ValveBiped.Bip01_R_Clavicle" 3.120573 1.441128 1.139977 -3.810635 21.397125 90.26235 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Forearm" "ValveBiped.Bip01_R_UpperArm" 7.450419 0.000005 0.000004 2.694304 -6.54658 -0.00932 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Hand" "ValveBiped.Bip01_R_Forearm" 6.266551 0.000017 0 6.094505 7.462874 -89.591865 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger2" "ValveBiped.Bip01_R_Hand" 3.844608 -0.777271 -0.706569 4.641479 -4.269567 -1.544064 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger21" "ValveBiped.Bip01_R_Finger2" 1.285675 0.000011 0.000001 -0.001508 0.000192 1.832797 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger22" "ValveBiped.Bip01_R_Finger21" 0.895239 -0.000008 0 -0.255577 -12.395927 -0.000047 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger1" "ValveBiped.Bip01_R_Hand" 3.012423 -0.725464 -1.585844 4.630649 -4.269338 -15.142507 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger11" "ValveBiped.Bip01_R_Finger1" 1.258429 0.000008 -0.000001 -0.000039 -0.000507 2.529019 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger12" "ValveBiped.Bip01_R_Finger11" 0.787258 0.000004 0.000001 -0.240551 -13.998334 0.000057 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger0" "ValveBiped.Bip01_R_Hand" 1.191826 -0.59877 -2.284807 38.922475 -4.722005 117.991573 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger01" "ValveBiped.Bip01_R_Finger0" 0.866859 -0.000004 0 5.759523 10.574886 12.036869 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger02" "ValveBiped.Bip01_R_Finger01" 0.843596 0 -0.000008 -0.551279 20.791531 -0.001439 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger4" "ValveBiped.Bip01_R_Hand" 3.271986 -0.709946 1.595667 4.642425 -4.269905 26.377132 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger41" "ValveBiped.Bip01_R_Finger4" 1.258438 0.000011 0.000002 -0.000326 0.000303 -0.798175 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger42" "ValveBiped.Bip01_R_Finger41" 0.787271 -0.000004 -0.000004 -0.351648 -13.99615 -0.000087 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger3" "ValveBiped.Bip01_R_Hand" 3.946449 -0.771183 0.541703 4.630553 -4.269364 10.471453 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger31" "ValveBiped.Bip01_R_Finger3" 1.285671 0.000004 -0.000002 -0.000003 -0.000006 -0.308971 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger32" "ValveBiped.Bip01_R_Finger31" 0.895243 0.000004 0 -0.553487 -24.682115 0.000093 0 0 0 0 0 0
$definebone "Tail.001" "ValveBiped.Bip01_Pelvis" 0.000003 3.242302 -3.982147 -0.00006 0 -89.470437 0 0 0 0 0 0
$definebone "Tail.002" "Tail.001" 0 9.0387 0.000057 0 -0.000005 0.139682 0 0 0 0 0 0
$definebone "Tail.003" "Tail.002" 0 8.553045 -0.000004 0 -0.000003 0.096376 0 0 0 0 0 0
$definebone "Tail.004" "Tail.003" 0 8.554018 -0.000015 0 0.000006 -0.16622 0 0 0 0 0 0
$definebone "ValveBiped.forward" "ValveBiped.Bip01_Head1" 2.000008 -2.999997 0 89.998548 14.273534 0 0 0 0 0 0 0
$definebone "ValveBiped.Anim_Attachment_RH" "ValveBiped.Bip01_R_Hand" 2.676071 -1.712452 0 -4.630776 175.730454 90.624466 0 0 0 0 0 0
$definebone "ValveBiped.Anim_Attachment_LH" "ValveBiped.Bip01_L_Hand" 2.676094 -1.712429 0 -4.942875 -4.23703 -89.811189 0 0 0 0 0 0

$jigglebone "Ear.L.001"
{
	is_flexible
	{
		length 100
		tip_mass 25
		pitch_stiffness 35
		pitch_damping 2
		yaw_stiffness 80
		yaw_damping 8
		along_stiffness 50
		along_damping 7
		pitch_constraint -19.999998 19.999998
		pitch_friction 0
		pitch_bounce 0
		yaw_constraint -20.000001 20.000001
		yaw_friction 0
		yaw_bounce 0
		angle_constraint 35
	}
}
$jigglebone "Ear.L.002"
{
	is_flexible
	{
		length 100
		tip_mass 25
		pitch_stiffness 35
		pitch_damping 2
		yaw_stiffness 80
		yaw_damping 8
		along_stiffness 50
		along_damping 7
		pitch_constraint -19.999998 19.999998
		pitch_friction 0
		pitch_bounce 0
		yaw_constraint -20.000001 20.000001
		yaw_friction 0
		yaw_bounce 0
		angle_constraint 35
	}
}
$jigglebone "Ear.L.003"
{
	is_flexible
	{
		length 100
		tip_mass 25
		pitch_stiffness 35
		pitch_damping 2
		yaw_stiffness 80
		yaw_damping 8
		along_stiffness 50
		along_damping 7
		pitch_constraint -19.999998 19.999998
		pitch_friction 0
		pitch_bounce 0
		yaw_constraint -20.000001 20.000001
		yaw_friction 0
		yaw_bounce 0
		angle_constraint 35
	}
}
$jigglebone "Ear.R.001"
{
	is_flexible
	{
		length 100
		tip_mass 25
		pitch_stiffness 35
		pitch_damping 2
		yaw_stiffness 80
		yaw_damping 8
		along_stiffness 50
		along_damping 7
		pitch_constraint -19.999998 19.999998
		pitch_friction 0
		pitch_bounce 0
		yaw_constraint -20.000001 20.000001
		yaw_friction 0
		yaw_bounce 0
		angle_constraint 35
	}
}
$jigglebone "Ear.R.002"
{
	is_flexible
	{
		length 100
		tip_mass 25
		pitch_stiffness 35
		pitch_damping 2
		yaw_stiffness 80
		yaw_damping 8
		along_stiffness 50
		along_damping 7
		pitch_constraint -19.999998 19.999998
		pitch_friction 0
		pitch_bounce 0
		yaw_constraint -20.000001 20.000001
		yaw_friction 0
		yaw_bounce 0
		angle_constraint 35
	}
}
$jigglebone "Ear.R.003"
{
	is_flexible
	{
		length 100
		tip_mass 25
		pitch_stiffness 35
		pitch_damping 2
		yaw_stiffness 80
		yaw_damping 8
		along_stiffness 50
		along_damping 7
		pitch_constraint -19.999998 19.999998
		pitch_friction 0
		pitch_bounce 0
		yaw_constraint -20.000001 20.000001
		yaw_friction 0
		yaw_bounce 0
		angle_constraint 35
	}
}
$jigglebone "Tail.001"
{
	is_flexible
	{
		length 40
		tip_mass 5
		pitch_stiffness 100
		pitch_damping 10
		yaw_stiffness 100
		yaw_damping 10
		along_stiffness 100
		along_damping 0
		angle_constraint 79.999998
	}
}
$jigglebone "Tail.002"
{
	is_flexible
	{
		length 40
		tip_mass 5
		pitch_stiffness 100
		pitch_damping 10
		yaw_stiffness 100
		yaw_damping 10
		along_stiffness 100
		along_damping 0
		angle_constraint 79.999998
	}
}
$jigglebone "Tail.003"
{
	is_flexible
	{
		length 40
		tip_mass 5
		pitch_stiffness 100
		pitch_damping 10
		yaw_stiffness 100
		yaw_damping 10
		along_stiffness 100
		along_damping 0
		angle_constraint 79.999998
	}
}
$jigglebone "Tail.004"
{
	is_flexible
	{
		length 40
		tip_mass 5
		pitch_stiffness 100
		pitch_damping 10
		yaw_stiffness 100
		yaw_damping 10
		along_stiffness 100
		along_damping 0
		angle_constraint 79.999998
	}
}

$ikchain "rhand" "ValveBiped.Bip01_R_Hand" knee 0.707 0.707 0
$ikchain "lhand" "ValveBiped.Bip01_L_Hand" knee 0.707 0.707 0
$ikchain "rfoot" "ValveBiped.Bip01_R_Foot" knee 0.707 -0.707 0
$ikchain "lfoot" "ValveBiped.Bip01_L_Foot" knee 0.707 -0.707 0

$ikautoplaylock "rfoot" 0.5 0.1
$ikautoplaylock "lfoot" 0.5 0.1

$animation "a_proportions_corrective_animation" "boykisser_v2_anims\a_proportions_corrective_animation.smd" {
	fps 30
	ikrule "rhand" release contact 0 fakeorigin 0 0 0 fakerotate 0 0 0 floor 0 height 0 radius 0 range 0 0 0 0 target 0
	ikrule "lhand" release contact 0 fakeorigin 0 0 0 fakerotate 0 0 0 floor 0 height 0 radius 0 range 0 0 0 0 target 1
	ikrule "rfoot" release contact 0 fakeorigin 0 0 0 fakerotate 0 0 0 floor 0 height 0 radius 0 range 0 0 0 0 target 2
	ikrule "lfoot" release contact 0 fakeorigin 0 0 0 fakerotate 0 0 0 floor 0 height 0 radius 0 range 0 0 0 0 target 3
}

$animation "a_proportions" "boykisser_v2_anims\a_proportions.smd" {
	fps 30
	// Crowbar writes this subtract option to prevent jigglebone and poseparameter problems when delta sequences are recompiled.
	subtract "a_proportions_corrective_animation" 0
}

$sequence "reference" {
	"boykisser_v2_anims\reference.smd"
	fadein 0.2
	fadeout 0.2
	fps 1
	ikrule "rhand" release contact 0 fakeorigin 0 0 0 fakerotate 0 0 0 floor 0 height 0 radius 0 range 0 0 100 100 target 0
	ikrule "lhand" release contact 0 fakeorigin 0 0 0 fakerotate 0 0 0 floor 0 height 0 radius 0 range 0 0 100 100 target 1
	ikrule "rfoot" release contact 0 fakeorigin 0 0 0 fakerotate 0 0 0 floor 0 height 0 radius 0 range 0 0 100 100 target 2
	ikrule "lfoot" release contact 0 fakeorigin 0 0 0 fakerotate 0 0 0 floor 0 height 0 radius 0 range 0 0 100 100 target 3
}

$sequence "proportions" {
	"a_proportions"
	autoplay
	predelta
	fadein 0.2
	fadeout 0.2
}

$sequence "ragdoll" {
	"boykisser_v2_anims\ragdoll.smd"
	activity "ACT_DIERAGDOLL" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	ikrule "rhand" release contact 0 fakeorigin 0 0 0 fakerotate 0 0 0 floor 0 height 0 radius 0 range 0 0 1 1 target 0
	ikrule "lhand" release contact 0 fakeorigin 0 0 0 fakerotate 0 0 0 floor 0 height 0 radius 0 range 0 0 1 1 target 1
	ikrule "rfoot" release contact 0 fakeorigin 0 0 0 fakerotate 0 0 0 floor 0 height 0 radius 0 range 0 0 1 1 target 2
	ikrule "lfoot" release contact 0 fakeorigin 0 0 0 fakerotate 0 0 0 floor 0 height 0 radius 0 range 0 0 1 1 target 3
}

$includemodel "m_anm.mdl"

$collisionjoints "boykisser_v2_physics.smd"
{
	$mass 60
	$inertia 10
	$damping 0.01
	$rotdamping 1.5
	$rootbone "ValveBiped.Bip01_Pelvis"


	$jointconstrain "ValveBiped.Bip01_Spine1" x limit -58 58 0
	$jointconstrain "ValveBiped.Bip01_Spine1" y limit -35 35 0
	$jointconstrain "ValveBiped.Bip01_Spine1" z limit -35 50 0

	$jointconstrain "ValveBiped.Bip01_Spine2" x limit -58 58 0
	$jointconstrain "ValveBiped.Bip01_Spine2" y limit -35 35 0
	$jointconstrain "ValveBiped.Bip01_Spine2" z limit -35 50 0

	$jointconstrain "ValveBiped.Bip01_L_UpperArm" x limit -30 30 0
	$jointconstrain "ValveBiped.Bip01_L_UpperArm" y limit -58 100 0
	$jointconstrain "ValveBiped.Bip01_L_UpperArm" z limit -82 93 0

	$jointconstrain "ValveBiped.Bip01_L_Forearm" x limit -37 37 0
	$jointconstrain "ValveBiped.Bip01_L_Forearm" y limit -140 3 0
	$jointconstrain "ValveBiped.Bip01_L_Forearm" z limit 1 1 0

	$jointconstrain "ValveBiped.Bip01_L_Hand" x limit -97 97 0
	$jointconstrain "ValveBiped.Bip01_L_Hand" y limit -30 30 0
	$jointconstrain "ValveBiped.Bip01_L_Hand" z limit -77 99 0

	$jointconstrain "ValveBiped.Bip01_R_UpperArm" x limit -39 39 0
	$jointconstrain "ValveBiped.Bip01_R_UpperArm" y limit -84 84 0
	$jointconstrain "ValveBiped.Bip01_R_UpperArm" z limit -95 95 0

	$jointconstrain "ValveBiped.Bip01_R_Forearm" x limit -39 39 0
	$jointconstrain "ValveBiped.Bip01_R_Forearm" y limit -3 140 0
	$jointconstrain "ValveBiped.Bip01_R_Forearm" z limit 1 1 0

	$jointconstrain "ValveBiped.Bip01_R_Hand" x limit -90 90 0
	$jointconstrain "ValveBiped.Bip01_R_Hand" y limit -30 30 0
	$jointconstrain "ValveBiped.Bip01_R_Hand" z limit -77 90 0

	$jointconstrain "ValveBiped.Bip01_R_Thigh" x limit -42 42 0
	$jointconstrain "ValveBiped.Bip01_R_Thigh" y limit -38 115 0
	$jointconstrain "ValveBiped.Bip01_R_Thigh" z limit -32 86 0

	$jointconstrain "ValveBiped.Bip01_R_Calf" x limit 0 0 0
	$jointconstrain "ValveBiped.Bip01_R_Calf" y limit -125 0 0
	$jointconstrain "ValveBiped.Bip01_R_Calf" z limit 1 1 0

	$jointconstrain "ValveBiped.Bip01_R_Foot" x limit -64 64 0
	$jointconstrain "ValveBiped.Bip01_R_Foot" y limit -32 32 0
	$jointconstrain "ValveBiped.Bip01_R_Foot" z limit -57 57 0

	$jointconstrain "ValveBiped.Bip01_L_Thigh" x limit -42 42 0
	$jointconstrain "ValveBiped.Bip01_L_Thigh" y limit -44 97 0
	$jointconstrain "ValveBiped.Bip01_L_Thigh" z limit -91 26 0

	$jointconstrain "ValveBiped.Bip01_L_Calf" x limit -21 28 0
	$jointconstrain "ValveBiped.Bip01_L_Calf" y limit -113 11 0
	$jointconstrain "ValveBiped.Bip01_L_Calf" z limit 0 0 0.04

	$jointconstrain "ValveBiped.Bip01_L_Foot" x limit -47 47 0
	$jointconstrain "ValveBiped.Bip01_L_Foot" y limit -54 54 0
	$jointconstrain "ValveBiped.Bip01_L_Foot" z limit -64 64 0

	$jointconstrain "ValveBiped.Bip01_Head1" x limit -64 64 0
	$jointconstrain "ValveBiped.Bip01_Head1" y limit -45 45 0
	$jointconstrain "ValveBiped.Bip01_Head1" z limit -88 88 0
}
