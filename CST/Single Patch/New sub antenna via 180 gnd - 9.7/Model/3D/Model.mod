'# MWS Version: Version 2024.0 - Sep 01 2023 - ACIS 33.0.1 -

'# length = mm
'# frequency = GHz
'# time = ns
'# frequency range: fmin = 8 fmax = 11.5
'# created = '[VERSION]2023.5|32.0.1|20230608[/VERSION]


'@ use template: Antenna - Planar_1.cfg

'[VERSION]2023.5|32.0.1|20230608[/VERSION]
'set the units
With Units
    .SetUnit "Length", "mm"
    .SetUnit "Frequency", "GHz"
    .SetUnit "Voltage", "V"
    .SetUnit "Resistance", "Ohm"
    .SetUnit "Inductance", "nH"
    .SetUnit "Temperature",  "degC"
    .SetUnit "Time", "ns"
    .SetUnit "Current", "A"
    .SetUnit "Conductance", "S"
    .SetUnit "Capacitance", "pF"
End With

ThermalSolver.AmbientTemperature "0"

'----------------------------------------------------------------------------

'set the frequency range
Solver.FrequencyRange "9", "11.5"

'----------------------------------------------------------------------------

Plot.DrawBox True

With Background
     .Type "Normal"
     .Epsilon "1.0"
     .Mu "1.0"
     .XminSpace "0.0"
     .XmaxSpace "0.0"
     .YminSpace "0.0"
     .YmaxSpace "0.0"
     .ZminSpace "0.0"
     .ZmaxSpace "0.0"
End With

With Boundary
     .Xmin "expanded open"
     .Xmax "expanded open"
     .Ymin "expanded open"
     .Ymax "expanded open"
     .Zmin "expanded open"
     .Zmax "expanded open"
     .Xsymmetry "none"
     .Ysymmetry "none"
     .Zsymmetry "none"
End With

' optimize mesh settings for planar structures

With Mesh
     .MergeThinPECLayerFixpoints "True"
     .RatioLimit "20"
     .AutomeshRefineAtPecLines "True", "6"
     .FPBAAvoidNonRegUnite "True"
     .ConsiderSpaceForLowerMeshLimit "False"
     .MinimumStepNumber "5"
     .AnisotropicCurvatureRefinement "True"
     .AnisotropicCurvatureRefinementFSM "True"
End With

With MeshSettings
     .SetMeshType "Hex"
     .Set "RatioLimitGeometry", "20"
     .Set "EdgeRefinementOn", "1"
     .Set "EdgeRefinementRatio", "6"
End With

With MeshSettings
     .SetMeshType "HexTLM"
     .Set "RatioLimitGeometry", "20"
End With

With MeshSettings
     .SetMeshType "Tet"
     .Set "VolMeshGradation", "1.5"
     .Set "SrfMeshGradation", "1.5"
End With

' change mesh adaption scheme to energy
' 		(planar structures tend to store high energy
'     	 locally at edges rather than globally in volume)

MeshAdaption3D.SetAdaptionStrategy "Energy"

' switch on FD-TET setting for accurate farfields

FDSolver.ExtrudeOpenBC "True"

PostProcess1D.ActivateOperation "vswr", "true"
PostProcess1D.ActivateOperation "yz-matrices", "true"

With FarfieldPlot
	.ClearCuts ' lateral=phi, polar=theta
	.AddCut "lateral", "0", "1"
	.AddCut "lateral", "90", "1"
	.AddCut "polar", "90", "1"
End With

'----------------------------------------------------------------------------

Dim sDefineAt As String
sDefineAt = "9;10.25;11.5"
Dim sDefineAtName As String
sDefineAtName = "9;10.25;11.5"
Dim sDefineAtToken As String
sDefineAtToken = "f="
Dim aFreq() As String
aFreq = Split(sDefineAt, ";")
Dim aNames() As String
aNames = Split(sDefineAtName, ";")

Dim nIndex As Integer
For nIndex = LBound(aFreq) To UBound(aFreq)

Dim zz_val As String
zz_val = aFreq (nIndex)
Dim zz_name As String
zz_name = sDefineAtToken & aNames (nIndex)

' Define Farfield Monitors
With Monitor
    .Reset
    .Name "farfield ("& zz_name &")"
    .Domain "Frequency"
    .FieldType "Farfield"
    .MonitorValue  zz_val
    .ExportFarfieldSource "False"
    .Create
End With

Next

'----------------------------------------------------------------------------

With MeshSettings
     .SetMeshType "Tet"
     .Set "Version", 1%
End With

With Mesh
     .MeshType "Tetrahedral"
End With

'set the solver type
ChangeSolverType("HF Frequency Domain")

'----------------------------------------------------------------------------

'@ define material: Rogers RO4003C (loss free)

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
With Material
     .Reset
     .Name "Rogers RO4003C (loss free)"
     .Folder ""
     .FrqType "all"
     .Type "Normal"
     .SetMaterialUnit "GHz", "mm"
     .Epsilon "3.55"
     .Mu "1.0"
     .Kappa "0.0"
     .TanD "0.0"
     .TanDFreq "0.0"
     .TanDGiven "False"
     .TanDModel "ConstTanD"
     .KappaM "0.0"
     .TanDM "0.0"
     .TanDMFreq "0.0"
     .TanDMGiven "False"
     .TanDMModel "ConstKappa"
     .DispModelEps "None"
     .DispModelMu "None"
     .DispersiveFittingSchemeEps "General 1st"
     .DispersiveFittingSchemeMu "General 1st"
     .UseGeneralDispersionEps "False"
     .UseGeneralDispersionMu "False"
     .Rho "0.0"
     .ThermalType "Normal"
     .ThermalConductivity "0.71"
     .SetActiveMaterial "all"
     .Colour "0.75", "0.95", "0.85"
     .Wireframe "False"
     .Transparency "0"
     .Create
End With

'@ define material: Rogers RO4450F (lossy)

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
With Material
     .Reset
     .Name "Rogers RO4450F (lossy)"
     .Folder ""
     .FrqType "all"
     .Type "Normal"
     .SetMaterialUnit "GHz", "mm"
     .Epsilon "3.7"
     .Mu "1.0"
     .Kappa "0.0"
     .TanD "0.004"
     .TanDFreq "10.0"
     .TanDGiven "True"
     .TanDModel "ConstTanD"
     .KappaM "0.0"
     .TanDM "0.0"
     .TanDMFreq "0.0"
     .TanDMGiven "False"
     .TanDMModel "ConstKappa"
     .DispModelEps "None"
     .DispModelMu "None"
     .DispersiveFittingSchemeEps "General 1st"
     .DispersiveFittingSchemeMu "General 1st"
     .UseGeneralDispersionEps "False"
     .UseGeneralDispersionMu "False"
     .Rho "0.0"
     .ThermalType "Normal"
     .ThermalConductivity "0.65"
     .SetActiveMaterial "all"
     .Colour "0.94", "0.82", "0.76"
     .Wireframe "False"
     .Transparency "0"
     .Create
End With

'@ define material: Copper (annealed)

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
With Material
     .Reset
     .Name "Copper (annealed)"
     .Folder ""
     .FrqType "static"
     .Type "Normal"
     .SetMaterialUnit "Hz", "mm"
     .Epsilon "1"
     .Mu "1.0"
     .Kappa "5.8e+007"
     .TanD "0.0"
     .TanDFreq "0.0"
     .TanDGiven "False"
     .TanDModel "ConstTanD"
     .KappaM "0"
     .TanDM "0.0"
     .TanDMFreq "0.0"
     .TanDMGiven "False"
     .TanDMModel "ConstTanD"
     .DispModelEps "None"
     .DispModelMu "None"
     .DispersiveFittingSchemeEps "Nth Order"
     .DispersiveFittingSchemeMu "Nth Order"
     .UseGeneralDispersionEps "False"
     .UseGeneralDispersionMu "False"
     .FrqType "all"
     .Type "Lossy metal"
     .SetMaterialUnit "GHz", "mm"
     .Mu "1.0"
     .Kappa "5.8e+007"
     .Rho "8930.0"
     .ThermalType "Normal"
     .ThermalConductivity "401.0"
     .SpecificHeat "390", "J/K/kg"
     .MetabolicRate "0"
     .BloodFlow "0"
     .VoxelConvection "0"
     .MechanicsType "Isotropic"
     .YoungsModulus "120"
     .PoissonsRatio "0.33"
     .ThermalExpansionRate "17"
     .Colour "1", "1", "0"
     .Wireframe "False"
     .Reflection "False"
     .Allowoutline "True"
     .Transparentoutline "False"
     .Transparency "0"
     .Create
End With

'@ new component: component1

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Component.New "component1"

'@ define brick: component1:sub0

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
With Brick
     .Reset 
     .Name "sub0" 
     .Component "component1" 
     .Material "Rogers RO4003C (loss free)" 
     .Xrange "-pcb_w/2", "pcb_w/2" 
     .Yrange "-pcb_l/2", "pcb_l/2" 
     .Zrange "0", "sub0_h" 
     .Create
End With

'@ store picked point: 1

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Pick.NextPickToDatabase "1" 
Pick.PickEndpointFromId "component1:sub0", "1"

'@ store picked point: 2

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Pick.NextPickToDatabase "2" 
Pick.PickEndpointFromId "component1:sub0", "1"

'@ store picked point: 3

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Pick.NextPickToDatabase "3" 
Pick.PickEndpointFromId "component1:sub0", "3"

'@ store picked point: 4

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Pick.NextPickToDatabase "4" 
Pick.PickEndpointFromId "component1:sub0", "3"

'@ define brick: component1:copper0

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
With Brick
     .Reset 
     .Name "copper0" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Xrange "xp(3)", "xp(2)" 
     .Yrange "yp(2)", "yp(3)" 
     .Zrange "zp(4)+0.035", "zp(4)" 
     .Create
End With

'@ pick face

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Pick.PickFaceFromId "component1:copper0", "1"

'@ align wcs with face

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
WCS.AlignWCSWithSelected "Face"

'@ store picked point: 5

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Pick.NextPickToDatabase "5" 
Pick.PickEndpointFromId "component1:copper0", "1"

'@ store picked point: 6

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Pick.NextPickToDatabase "6" 
Pick.PickEndpointFromId "component1:copper0", "3"

'@ define brick: component1:sub1

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
With Brick
     .Reset 
     .Name "sub1" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Xrange "xp(6)", "xp(5)" 
     .Yrange "yp(5)", "yp(6)" 
     .Zrange "0", "sub1_h" 
     .Create
End With

'@ delete material: Rogers RO4450F (lossy)

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Material.Delete "Rogers RO4450F (lossy)"

'@ define material: Rogers RO4450F (loss free)

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
With Material
     .Reset
     .Name "Rogers RO4450F (loss free)"
     .Folder ""
     .FrqType "all"
     .Type "Normal"
     .SetMaterialUnit "GHz", "mm"
     .Epsilon "3.7"
     .Mu "1.0"
     .Kappa "0.0"
     .TanD "0.0"
     .TanDFreq "0.0"
     .TanDGiven "False"
     .TanDModel "ConstTanD"
     .KappaM "0.0"
     .TanDM "0.0"
     .TanDMFreq "0.0"
     .TanDMGiven "False"
     .TanDMModel "ConstKappa"
     .DispModelEps "None"
     .DispModelMu "None"
     .DispersiveFittingSchemeEps "General 1st"
     .DispersiveFittingSchemeMu "General 1st"
     .UseGeneralDispersionEps "False"
     .UseGeneralDispersionMu "False"
     .Rho "0.0"
     .ThermalType "Normal"
     .ThermalConductivity "0.65"
     .SetActiveMaterial "all"
     .Colour "0.75", "0.95", "0.85"
     .Wireframe "False"
     .Transparency "0"
     .Create
End With

'@ change material: component1:sub1 to: Rogers RO4450F (loss free)

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Solid.ChangeMaterial "component1:sub1", "Rogers RO4450F (loss free)"

'@ define material colour: Rogers RO4450F (loss free)

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
With Material 
     .Name "Rogers RO4450F (loss free)"
     .Folder ""
     .Colour "1", "0.501961", "0.25098" 
     .Wireframe "False" 
     .Reflection "False" 
     .Allowoutline "True" 
     .Transparentoutline "False" 
     .Transparency "0" 
     .ChangeColour 
End With

'@ pick face

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Pick.PickFaceFromId "component1:sub1", "1"

'@ align wcs with face

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
WCS.AlignWCSWithSelected "Face"

'@ store picked point: 7

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Pick.NextPickToDatabase "7" 
Pick.PickEndpointFromId "component1:sub1", "1"

'@ store picked point: 8

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Pick.NextPickToDatabase "8" 
Pick.PickEndpointFromId "component1:sub1", "3"

'@ define brick: component1:sub3

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
With Brick
     .Reset 
     .Name "sub3" 
     .Component "component1" 
     .Material "Rogers RO4450F (loss free)" 
     .Xrange "xp(8)", "xp(7)" 
     .Yrange "yp(7)", "yp(8)" 
     .Zrange "0", "sub3_h" 
     .Create
End With

'@ pick face

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Pick.PickFaceFromId "component1:sub3", "1"

'@ change material: component1:sub3 to: Rogers RO4003C (loss free)

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Solid.ChangeMaterial "component1:sub3", "Rogers RO4003C (loss free)"

'@ align wcs with face

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
WCS.AlignWCSWithSelected "Face"

'@ pick mid point

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Pick.PickMidpointFromId "component1:sub3", "4"

'@ align wcs with point

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
WCS.AlignWCSWithSelected "Point"

'@ store picked point: 9

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Pick.NextPickToDatabase "9" 
Pick.PickEndpointFromId "component1:sub3", "2"

'@ pick face

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Pick.PickFaceFromId "component1:sub3", "1"

'@ align wcs with face

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
WCS.AlignWCSWithSelected "Face"

'@ define brick: component1:patch

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
With Brick
     .Reset 
     .Name "patch" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Xrange "-W0/2", "W0/2" 
     .Yrange "-L0/2", "L0/2" 
     .Zrange "0", "0.035" 
     .Create
End With

'@ store picked point: 10

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Pick.NextPickToDatabase "10" 
Pick.PickMidpointFromId "component1:sub3", "4"

'@ define brick: component1:feed

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
With Brick
     .Reset 
     .Name "feed" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Xrange "-trace_50/2", "trace_50/2" 
     .Yrange "-trace_50_l", "0" 
     .Zrange "0", "0.035" 
     .Create
End With

'@ pick mid point

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Pick.PickMidpointFromId "component1:patch", "4"

'@ align wcs with point

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
WCS.AlignWCSWithSelected "Point"

'@ define brick: component1:inset

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
With Brick
     .Reset 
     .Name "inset" 
     .Component "component1" 
     .Material "Vacuum" 
     .Xrange "-trace_50/2 - inset_gap", "trace_50/2 + inset_gap" 
     .Yrange "0", "inset_l" 
     .Zrange "-0.035", "0" 
     .Create
End With

'@ boolean subtract shapes: component1:patch, component1:inset

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Solid.Subtract "component1:patch", "component1:inset"

'@ boolean add shapes: component1:patch, component1:feed

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Solid.Add "component1:patch", "component1:feed"

'@ pick face

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Pick.PickFaceFromId "component1:patch", "3"

'@ define port: 1

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
With Port 
     .Reset 
     .PortNumber "1" 
     .Label ""
     .Folder ""
     .NumberOfModes "1"
     .AdjustPolarization "False"
     .PolarizationAngle "0.0"
     .ReferencePlaneDistance "0"
     .TextSize "50"
     .TextMaxLimit "0"
     .Coordinates "Picks"
     .Orientation "positive"
     .PortOnBound "False"
     .ClipPickedPortToBound "False"
     .Xrange "-0.3405", "0.3405"
     .Yrange "-12.5", "-12.5"
     .Zrange "0.538", "0.573"
     .XrangeAdd "0.3*7", "0.3*7"
     .YrangeAdd "0.0", "0.0"
     .ZrangeAdd "0.3", "0.3*7"
     .SingleEnded "False"
     .WaveguideMonitor "False"
     .Create 
End With

'@ activate global coordinates

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
WCS.ActivateWCS "global"

'@ delete monitor: farfield (f=9)

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
With Monitor 
     .Delete "farfield (f=9)" 
End With

'@ define farfield monitor: farfield (f=9.5)

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
With Monitor 
     .Reset 
     .Name "farfield (f=9.5)" 
     .Domain "Frequency" 
     .FieldType "Farfield" 
     .MonitorValue "9.5" 
     .ExportFarfieldSource "False" 
     .UseSubvolume "False" 
     .Coordinates "Free" 
     .SetSubvolume "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .SetSubvolumeOffsetType "Absolute" 
     .EnableNearfieldCalculation "True" 
     .Create 
End With

'@ delete monitor: farfield (f=11.5)

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
With Monitor 
     .Delete "farfield (f=11.5)" 
End With

'@ define farfield monitor: farfield (f=10)

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
With Monitor 
     .Reset 
     .Name "farfield (f=10)" 
     .Domain "Frequency" 
     .FieldType "Farfield" 
     .MonitorValue "10" 
     .ExportFarfieldSource "False" 
     .UseSubvolume "False" 
     .Coordinates "Free" 
     .SetSubvolume "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .SetSubvolumeOffsetType "Absolute" 
     .EnableNearfieldCalculation "True" 
     .Create 
End With

'@ delete monitor: farfield (f=10.25)

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
With Monitor 
     .Delete "farfield (f=10.25)" 
End With

'@ define farfield monitor: farfield (f=9.75)

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
With Monitor 
     .Reset 
     .Name "farfield (f=9.75)" 
     .Domain "Frequency" 
     .FieldType "Farfield" 
     .MonitorValue "9.75" 
     .ExportFarfieldSource "False" 
     .UseSubvolume "False" 
     .Coordinates "Free" 
     .SetSubvolume "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .SetSubvolumeOffsetType "Absolute" 
     .EnableNearfieldCalculation "True" 
     .Create 
End With

'@ define frequency range

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Solver.FrequencyRange "9", "11.5"

'@ define frequency domain solver parameters

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Mesh.SetCreator "High Frequency" 

With FDSolver
     .Reset 
     .SetMethod "Tetrahedral", "General purpose" 
     .OrderTet "Second" 
     .OrderSrf "First" 
     .Stimulation "All", "All" 
     .ResetExcitationList 
     .AutoNormImpedance "False" 
     .NormingImpedance "50" 
     .ModesOnly "False" 
     .ConsiderPortLossesTet "True" 
     .SetShieldAllPorts "False" 
     .AccuracyHex "1e-6" 
     .AccuracyTet "1e-4" 
     .AccuracySrf "1e-3" 
     .LimitIterations "False" 
     .MaxIterations "0" 
     .SetCalcBlockExcitationsInParallel "True", "True", "" 
     .StoreAllResults "False" 
     .StoreResultsInCache "False" 
     .UseHelmholtzEquation "True" 
     .LowFrequencyStabilization "True" 
     .Type "Auto" 
     .MeshAdaptionHex "False" 
     .MeshAdaptionTet "True" 
     .AcceleratedRestart "True" 
     .FreqDistAdaptMode "Distributed" 
     .NewIterativeSolver "True" 
     .TDCompatibleMaterials "False" 
     .ExtrudeOpenBC "True" 
     .SetOpenBCTypeHex "Default" 
     .SetOpenBCTypeTet "Default" 
     .AddMonitorSamples "True" 
     .CalcPowerLoss "True" 
     .CalcPowerLossPerComponent "False" 
     .SetKeepSolutionCoefficients "MonitorsAndMeshAdaptation" 
     .UseDoublePrecision "False" 
     .UseDoublePrecision_ML "True" 
     .MixedOrderSrf "False" 
     .MixedOrderTet "False" 
     .PreconditionerAccuracyIntEq "0.15" 
     .MLFMMAccuracy "Default" 
     .MinMLFMMBoxSize "0.3" 
     .UseCFIEForCPECIntEq "True" 
     .UseEnhancedCFIE2 "True" 
     .UseFastRCSSweepIntEq "false" 
     .UseSensitivityAnalysis "False" 
     .UseEnhancedNFSImprint "True" 
     .UseFastDirectFFCalc "False" 
     .RemoveAllStopCriteria "Hex"
     .AddStopCriterion "All S-Parameters", "0.01", "2", "Hex", "True"
     .AddStopCriterion "Reflection S-Parameters", "0.01", "2", "Hex", "False"
     .AddStopCriterion "Transmission S-Parameters", "0.01", "2", "Hex", "False"
     .RemoveAllStopCriteria "Tet"
     .AddStopCriterion "All S-Parameters", "0.01", "2", "Tet", "True"
     .AddStopCriterion "Reflection S-Parameters", "0.01", "2", "Tet", "False"
     .AddStopCriterion "Transmission S-Parameters", "0.01", "2", "Tet", "False"
     .AddStopCriterion "All Probes", "0.05", "2", "Tet", "True"
     .RemoveAllStopCriteria "Srf"
     .AddStopCriterion "All S-Parameters", "0.01", "2", "Srf", "True"
     .AddStopCriterion "Reflection S-Parameters", "0.01", "2", "Srf", "False"
     .AddStopCriterion "Transmission S-Parameters", "0.01", "2", "Srf", "False"
     .SweepMinimumSamples "3" 
     .SetNumberOfResultDataSamples "1001" 
     .SetResultDataSamplingMode "Automatic" 
     .SweepWeightEvanescent "1.0" 
     .AccuracyROM "1e-4" 
     .AddSampleInterval "", "", "1", "Automatic", "True" 
     .AddSampleInterval "", "", "", "Automatic", "False" 
     .MPIParallelization "False"
     .UseDistributedComputing "False"
     .NetworkComputingStrategy "RunRemote"
     .NetworkComputingJobCount "3"
     .UseParallelization "True"
     .MaxCPUs "1024"
     .MaximumNumberOfCPUDevices "2"
End With

With IESolver
     .Reset 
     .UseFastFrequencySweep "True" 
     .UseIEGroundPlane "False" 
     .SetRealGroundMaterialName "" 
     .CalcFarFieldInRealGround "False" 
     .RealGroundModelType "Auto" 
     .PreconditionerType "Auto" 
     .ExtendThinWireModelByWireNubs "False" 
     .ExtraPreconditioning "False" 
End With

With IESolver
     .SetFMMFFCalcStopLevel "0" 
     .SetFMMFFCalcNumInterpPoints "6" 
     .UseFMMFarfieldCalc "True" 
     .SetCFIEAlpha "0.500000" 
     .LowFrequencyStabilization "False" 
     .LowFrequencyStabilizationML "True" 
     .Multilayer "False" 
     .SetiMoMACC_I "0.0001" 
     .SetiMoMACC_M "0.0001" 
     .DeembedExternalPorts "True" 
     .SetOpenBC_XY "True" 
     .OldRCSSweepDefintion "False" 
     .SetRCSOptimizationProperties "True", "100", "0.00001" 
     .SetAccuracySetting "Custom" 
     .CalculateSParaforFieldsources "True" 
     .ModeTrackingCMA "True" 
     .NumberOfModesCMA "3" 
     .StartFrequencyCMA "-1.0" 
     .SetAccuracySettingCMA "Default" 
     .FrequencySamplesCMA "0" 
     .SetMemSettingCMA "Auto" 
     .CalculateModalWeightingCoefficientsCMA "True" 
     .DetectThinDielectrics "True" 
End With

'@ set 3d mesh adaptation properties

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
With MeshAdaption3D
    .SetType "HighFrequencyTet" 
    .SetAdaptionStrategy "ExpertSystem" 
    .MinPasses "3" 
    .MaxPasses "20" 
    .ClearStopCriteria 
    .MaxDeltaS "0.02" 
    .NumberOfDeltaSChecks "1" 
    .EnableInnerSParameterAdaptation "True" 
    .PropagationConstantAccuracy "0.005" 
    .NumberOfPropConstChecks "2" 
    .EnablePortPropagationConstantAdaptation "True" 
    .RemoveAllUserDefinedStopCriteria 
    .AddStopCriterion "All S-Parameters", "0.02", "1", "True" 
    .AddStopCriterion "Reflection S-Parameters", "0.02", "1", "False" 
    .AddStopCriterion "Transmission S-Parameters", "0.02", "1", "False" 
    .AddStopCriterion "Portmode kz/k0", "0.005", "2", "True" 
    .AddStopCriterion "All Probes", "0.05", "2", "False" 
    .AddSParameterStopCriterion "True", "", "", "0.02", "1", "False" 
    .MinimumAcceptedCellGrowth "0.5" 
    .RefThetaFactor "" 
    .SetMinimumMeshCellGrowth "5" 
    .ErrorEstimatorType "Automatic" 
    .RefinementType "Automatic" 
    .SnapToGeometry "True" 
    .SubsequentChecksOnlyOnce "False" 
    .WavelengthBasedRefinement "True" 
    .EnableLinearGrowthLimitation "True" 
    .SetLinearGrowthLimitation "" 
    .SingularEdgeRefinement "2" 
    .DDMRefinementType "Automatic" 
End With

'@ define frequency range

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Solver.FrequencyRange "8", "11.5"

'@ clear picks

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Pick.ClearAllPicks

'@ define frequency domain solver parameters

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Mesh.SetCreator "High Frequency" 

With FDSolver
     .Reset 
     .SetMethod "Tetrahedral", "General purpose" 
     .OrderTet "Second" 
     .OrderSrf "First" 
     .Stimulation "All", "All" 
     .ResetExcitationList 
     .AutoNormImpedance "False" 
     .NormingImpedance "50" 
     .ModesOnly "False" 
     .ConsiderPortLossesTet "True" 
     .SetShieldAllPorts "False" 
     .AccuracyHex "1e-6" 
     .AccuracyTet "1e-4" 
     .AccuracySrf "1e-3" 
     .LimitIterations "False" 
     .MaxIterations "0" 
     .SetCalcBlockExcitationsInParallel "True", "True", "" 
     .StoreAllResults "False" 
     .StoreResultsInCache "False" 
     .UseHelmholtzEquation "True" 
     .LowFrequencyStabilization "True" 
     .Type "Auto" 
     .MeshAdaptionHex "False" 
     .MeshAdaptionTet "True" 
     .AcceleratedRestart "True" 
     .FreqDistAdaptMode "Distributed" 
     .NewIterativeSolver "True" 
     .TDCompatibleMaterials "False" 
     .ExtrudeOpenBC "True" 
     .SetOpenBCTypeHex "Default" 
     .SetOpenBCTypeTet "Default" 
     .AddMonitorSamples "True" 
     .CalcPowerLoss "True" 
     .CalcPowerLossPerComponent "False" 
     .SetKeepSolutionCoefficients "MonitorsAndMeshAdaptation" 
     .UseDoublePrecision "False" 
     .UseDoublePrecision_ML "True" 
     .MixedOrderSrf "False" 
     .MixedOrderTet "False" 
     .PreconditionerAccuracyIntEq "0.15" 
     .MLFMMAccuracy "Default" 
     .MinMLFMMBoxSize "0.3" 
     .UseCFIEForCPECIntEq "True" 
     .UseEnhancedCFIE2 "True" 
     .UseFastRCSSweepIntEq "false" 
     .UseSensitivityAnalysis "False" 
     .UseEnhancedNFSImprint "True" 
     .UseFastDirectFFCalc "False" 
     .RemoveAllStopCriteria "Hex"
     .AddStopCriterion "All S-Parameters", "0.01", "2", "Hex", "True"
     .AddStopCriterion "Reflection S-Parameters", "0.01", "2", "Hex", "False"
     .AddStopCriterion "Transmission S-Parameters", "0.01", "2", "Hex", "False"
     .RemoveAllStopCriteria "Tet"
     .AddStopCriterion "All S-Parameters", "0.01", "2", "Tet", "True"
     .AddStopCriterion "Reflection S-Parameters", "0.01", "2", "Tet", "False"
     .AddStopCriterion "Transmission S-Parameters", "0.01", "2", "Tet", "False"
     .AddStopCriterion "All Probes", "0.05", "2", "Tet", "True"
     .RemoveAllStopCriteria "Srf"
     .AddStopCriterion "All S-Parameters", "0.01", "2", "Srf", "True"
     .AddStopCriterion "Reflection S-Parameters", "0.01", "2", "Srf", "False"
     .AddStopCriterion "Transmission S-Parameters", "0.01", "2", "Srf", "False"
     .SweepMinimumSamples "3" 
     .SetNumberOfResultDataSamples "1001" 
     .SetResultDataSamplingMode "Automatic" 
     .SweepWeightEvanescent "1.0" 
     .AccuracyROM "1e-4" 
     .AddSampleInterval "", "", "2", "Automatic", "True" 
     .AddSampleInterval "", "", "", "Automatic", "False" 
     .MPIParallelization "False"
     .UseDistributedComputing "False"
     .NetworkComputingStrategy "RunRemote"
     .NetworkComputingJobCount "3"
     .UseParallelization "True"
     .MaxCPUs "1024"
     .MaximumNumberOfCPUDevices "2"
End With

With IESolver
     .Reset 
     .UseFastFrequencySweep "True" 
     .UseIEGroundPlane "False" 
     .SetRealGroundMaterialName "" 
     .CalcFarFieldInRealGround "False" 
     .RealGroundModelType "Auto" 
     .PreconditionerType "Auto" 
     .ExtendThinWireModelByWireNubs "False" 
     .ExtraPreconditioning "False" 
End With

With IESolver
     .SetFMMFFCalcStopLevel "0" 
     .SetFMMFFCalcNumInterpPoints "6" 
     .UseFMMFarfieldCalc "True" 
     .SetCFIEAlpha "0.500000" 
     .LowFrequencyStabilization "False" 
     .LowFrequencyStabilizationML "True" 
     .Multilayer "False" 
     .SetiMoMACC_I "0.0001" 
     .SetiMoMACC_M "0.0001" 
     .DeembedExternalPorts "True" 
     .SetOpenBC_XY "True" 
     .OldRCSSweepDefintion "False" 
     .SetRCSOptimizationProperties "True", "100", "0.00001" 
     .SetAccuracySetting "Custom" 
     .CalculateSParaforFieldsources "True" 
     .ModeTrackingCMA "True" 
     .NumberOfModesCMA "3" 
     .StartFrequencyCMA "-1.0" 
     .SetAccuracySettingCMA "Default" 
     .FrequencySamplesCMA "0" 
     .SetMemSettingCMA "Auto" 
     .CalculateModalWeightingCoefficientsCMA "True" 
     .DetectThinDielectrics "True" 
End With

'@ delete port: port1

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Port.Delete "1"

'@ activate local coordinates

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
WCS.ActivateWCS "local"

'@ pick mid point

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Pick.PickMidpointFromId "component1:patch", "4"

'@ align wcs with point

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
WCS.AlignWCSWithSelected "Point"

'@ define brick: component1:matching1

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
With Brick
     .Reset 
     .Name "matching1" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Xrange "-mt_w/2", "mt_w/2" 
     .Yrange "-mt_l", "0" 
     .Zrange "-0.035", "0" 
     .Create
End With

'@ pick mid point

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Pick.PickMidpointFromId "component1:matching1", "4"

'@ align wcs with point

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
WCS.AlignWCSWithSelected "Point"

'@ define cylinder: component1:pad1

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
With Cylinder 
     .Reset 
     .Name "pad1" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .OuterRadius "pad_rad_top" 
     .InnerRadius "0" 
     .Axis "z" 
     .Zrange "-0.035", "0" 
     .Xcenter "0" 
     .Ycenter "0" 
     .Segments "0" 
     .Create 
End With

'@ define cylinder: component1:hole0

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
With Cylinder 
     .Reset 
     .Name "hole0" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .OuterRadius "hole_rad" 
     .InnerRadius "0" 
     .Axis "z" 
     .Zrange "-board_thick", "0" 
     .Xcenter "0" 
     .Ycenter "0" 
     .Segments "0" 
     .Create 
End With

'@ define cylinder: component1:gap0

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
With Cylinder 
     .Reset 
     .Name "gap0" 
     .Component "component1" 
     .Material "Rogers RO4450F (loss free)" 
     .OuterRadius "outer_cond_rad" 
     .InnerRadius "0" 
     .Axis "z" 
     .Zrange "-board_thick", "0" 
     .Xcenter "0" 
     .Ycenter "0" 
     .Segments "0" 
     .Create 
End With

'@ transform: translate component1:copper0

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
With Transform 
     .Reset 
     .Name "component1:copper0" 
     .Vector "0", "0", "0" 
     .UsePickedPoints "False" 
     .InvertPickedPoints "False" 
     .MultipleObjects "True" 
     .GroupObjects "False" 
     .Repetitions "1" 
     .MultipleSelection "False" 
     .Destination "" 
     .Material "" 
     .AutoDestination "True" 
     .Transform "Shape", "Translate" 
End With

'@ boolean intersect shapes: component1:gap0, component1:copper0_1

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Solid.Intersect "component1:gap0", "component1:copper0_1"

'@ transform: translate component1:gap0

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
With Transform 
     .Reset 
     .Name "component1:gap0" 
     .Vector "0", "0", "0" 
     .UsePickedPoints "False" 
     .InvertPickedPoints "False" 
     .MultipleObjects "True" 
     .GroupObjects "False" 
     .Repetitions "1" 
     .MultipleSelection "False" 
     .Destination "" 
     .Material "" 
     .AutoDestination "True" 
     .Transform "Shape", "Translate" 
End With

'@ boolean subtract shapes: component1:copper0, component1:gap0_1

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Solid.Subtract "component1:copper0", "component1:gap0_1"

'@ boolean add shapes: component1:sub1, component1:gap0

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Solid.Add "component1:sub1", "component1:gap0"

'@ pick face

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Pick.PickFaceFromId "component1:hole0", "1"

'@ align wcs with face

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
WCS.AlignWCSWithSelected "Face"

'@ define cylinder: component1:pad0

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
With Cylinder 
     .Reset 
     .Name "pad0" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .OuterRadius "pad_rad_bot" 
     .InnerRadius "0" 
     .Axis "z" 
     .Zrange "-0.035", "0" 
     .Xcenter "0" 
     .Ycenter "0" 
     .Segments "0" 
     .Create 
End With

'@ define brick: component1:matching0

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
With Brick
     .Reset 
     .Name "matching0" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Xrange "-mt_w/2", "mt_w/2" 
     .Yrange "0", "-mt_l" 
     .Zrange "-0.035", "0" 
     .Create
End With

'@ pick mid point

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Pick.PickMidpointFromId "component1:matching0", "2"

'@ align wcs with point

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
WCS.AlignWCSWithSelected "Point"

'@ store picked point: 11

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Pick.NextPickToDatabase "11" 
Pick.PickMidpointFromId "component1:sub0", "6"

'@ define brick: component1:port0

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
With Brick
     .Reset 
     .Name "port0" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Xrange "-trace_50/2", "trace_50/2" 
     .Yrange "0", "yp(11)" 
     .Zrange "-0.035", "0" 
     .Create
End With

'@ pick face

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Pick.PickFaceFromId "component1:port0", "5"

'@ define port:1

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
' Port constructed by macro Solver -> Ports -> Calculate port extension coefficient


With Port
  .Reset
  .PortNumber "1"
  .NumberOfModes "1"
  .AdjustPolarization False
  .PolarizationAngle "0.0"
  .ReferencePlaneDistance "0"
  .TextSize "50"
  .Coordinates "Picks"
  .Orientation "Positive"
  .PortOnBound "True"
  .ClipPickedPortToBound "False"
  .XrangeAdd "0.203*4.5", "0.203*4.5"
  .YrangeAdd "0", "0"
  .ZrangeAdd "0.203*4.5", "0.203"
  .Shield "PEC"
  .SingleEnded "False"
  .Create
End With

'@ modify port: 1

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
With Port 
     .Reset 
     .LoadContentForModify "1" 
     .Label ""
     .Folder ""
     .NumberOfModes "1"
     .AdjustPolarization "False"
     .PolarizationAngle "0.0"
     .ReferencePlaneDistance "0"
     .TextSize "50"
     .TextMaxLimit "1"
     .Coordinates "Picks"
     .Orientation "positive"
     .PortOnBound "True"
     .ClipPickedPortToBound "False"
     .Xrange "-0.3405", "0.3405"
     .Yrange "-12.5", "-12.5"
     .Zrange "-0.035", "-2.7755575615629e-17"
     .XrangeAdd "0.203*7", "0.203*7"
     .YrangeAdd "0.0", "0.0"
     .ZrangeAdd "0.203*7", "0.203"
     .SingleEnded "False"
     .Shield "PEC"
     .WaveguideMonitor "False"
     .Modify 
End With

'@ delete shape: component1:port0

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Solid.Delete "component1:port0"

'@ pick mid point

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Pick.PickMidpointFromId "component1:matching0", "4"

'@ align wcs with point

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
WCS.AlignWCSWithSelected "Point"

'@ define brick: component1:port0

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
With Brick
     .Reset 
     .Name "port0" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Xrange "-trace_50/2", "trace_50/2" 
     .Yrange "-port_l", "0" 
     .Zrange "-0.035", "0" 
     .Create
End With

'@ delete port: port1

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Port.Delete "1"

'@ pick face

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Pick.PickFaceFromId "component1:port0", "3"

'@ activate global coordinates

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
WCS.ActivateWCS "global"

'@ define port: 1

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
With Port 
     .Reset 
     .PortNumber "1" 
     .Label ""
     .Folder ""
     .NumberOfModes "1"
     .AdjustPolarization "False"
     .PolarizationAngle "0.0"
     .ReferencePlaneDistance "0"
     .TextSize "50"
     .TextMaxLimit "0"
     .Coordinates "Picks"
     .Orientation "positive"
     .PortOnBound "False"
     .ClipPickedPortToBound "False"
     .Xrange "-0.3405", "0.3405"
     .Yrange "-2", "-2"
     .Zrange "-0.035", "-2.7755575615629e-17"
     .XrangeAdd "0.203*7", "0.203*7"
     .YrangeAdd "0.0", "0.0"
     .ZrangeAdd "0.203*7", "0.203"
     .SingleEnded "False"
     .WaveguideMonitor "False"
     .Create 
End With

'@ farfield plot options

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
With FarfieldPlot 
     .Plottype "Polar" 
     .Vary "angle1" 
     .Theta "90" 
     .Phi "90" 
     .Step "1" 
     .Step2 "1" 
     .SetLockSteps "True" 
     .SetPlotRangeOnly "False" 
     .SetThetaStart "0" 
     .SetThetaEnd "180" 
     .SetPhiStart "0" 
     .SetPhiEnd "360" 
     .SetTheta360 "False" 
     .SymmetricRange "False" 
     .SetTimeDomainFF "False" 
     .SetFrequency "-1" 
     .SetTime "0" 
     .SetColorByValue "True" 
     .DrawStepLines "False" 
     .DrawIsoLongitudeLatitudeLines "False" 
     .ShowStructure "False" 
     .ShowStructureProfile "False" 
     .SetStructureTransparent "False" 
     .SetFarfieldTransparent "False" 
     .AspectRatio "Free" 
     .ShowGridlines "True" 
     .InvertAxes "False", "False" 
     .SetSpecials "enablepolarextralines" 
     .SetPlotMode "Directivity" 
     .Distance "1" 
     .UseFarfieldApproximation "True" 
     .IncludeUnitCellSidewalls "True" 
     .SetScaleLinear "False" 
     .SetLogRange "40" 
     .SetLogNorm "0" 
     .DBUnit "0" 
     .SetMaxReferenceMode "abs" 
     .EnableFixPlotMaximum "False" 
     .SetFixPlotMaximumValue "1.0" 
     .SetInverseAxialRatio "False" 
     .SetAxesType "user" 
     .SetAntennaType "unknown" 
     .Phistart "1.000000e+00", "0.000000e+00", "0.000000e+00" 
     .Thetastart "0.000000e+00", "0.000000e+00", "1.000000e+00" 
     .PolarizationVector "0.000000e+00", "1.000000e+00", "0.000000e+00" 
     .SetCoordinateSystemType "spherical" 
     .SetAutomaticCoordinateSystem "True" 
     .SetPolarizationType "Linear" 
     .SlantAngle 0.000000e+00 
     .Origin "bbox" 
     .Userorigin "0.000000e+00", "0.000000e+00", "0.000000e+00" 
     .SetUserDecouplingPlane "False" 
     .UseDecouplingPlane "False" 
     .DecouplingPlaneAxis "X" 
     .DecouplingPlanePosition "0.000000e+00" 
     .LossyGround "False" 
     .GroundEpsilon "1" 
     .GroundKappa "0" 
     .EnablePhaseCenterCalculation "False" 
     .SetPhaseCenterAngularLimit "3.000000e+01" 
     .SetPhaseCenterComponent "boresight" 
     .SetPhaseCenterPlane "both" 
     .ShowPhaseCenter "True" 
     .ClearCuts 
     .AddCut "lateral", "0", "1"  
     .AddCut "lateral", "90", "1"  
     .AddCut "polar", "90", "1"  

     .StoreSettings
End With

'@ pick end point

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Pick.PickEndpointFromId "component1:sub0", "5"

'@ align wcs with point

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
WCS.AlignWCSWithSelected "Point"

'@ store picked point: 12

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Pick.NextPickToDatabase "12" 
Pick.PickEndpointFromId "component1:sub0", "7"

'@ store picked point: 13

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Pick.NextPickToDatabase "13" 
Pick.PickEndpointFromId "component1:port0", "4"

'@ define brick: component1:ground0

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
With Brick
     .Reset 
     .Name "ground0" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Xrange "xp(12)", "0" 
     .Yrange "0", "yp(12)" 
     .Zrange "0", "0.035" 
     .Create
End With

'@ clear picks

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Pick.ClearAllPicks

'@ pick face

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Pick.PickFaceFromId "component1:pad0", "3"

'@ align wcs with face

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
WCS.AlignWCSWithSelected "Face"

'@ define brick: component1:gap3

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
With Brick
     .Reset 
     .Name "gap3" 
     .Component "component1" 
     .Material "Vacuum" 
     .Xrange "-pad_rad_bot-gap0", "pad_rad_bot+gap0" 
     .Yrange "-mt_l-port_l-gap0", "pad_rad_bot+gap0" 
     .Zrange "-0.035", "0" 
     .Create
End With

'@ boolean subtract shapes: component1:ground0, component1:gap3

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Solid.Subtract "component1:ground0", "component1:gap3"

'@ pick end point

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Pick.PickEndpointFromId "component1:ground0", "18"

'@ align wcs with point

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
WCS.AlignWCSWithSelected "Point"

'@ define cylinder: component1:vias0

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
With Cylinder 
     .Reset 
     .Name "vias0" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .OuterRadius "0.15" 
     .InnerRadius "0" 
     .Axis "z" 
     .Zrange "-0.035-0.203-0.035", "0" 
     .Xcenter "-0.15" 
     .Ycenter "0" 
     .Segments "0" 
     .Create 
End With

'@ activate global coordinates

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
WCS.ActivateWCS "global"

'@ transform: mirror component1:vias0

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
With Transform 
     .Reset 
     .Name "component1:vias0" 
     .Origin "Free" 
     .Center "0", "0", "0" 
     .PlaneNormal "1", "0", "0" 
     .MultipleObjects "True" 
     .GroupObjects "False" 
     .Repetitions "1" 
     .MultipleSelection "False" 
     .Destination "" 
     .Material "" 
     .AutoDestination "True" 
     .Transform "Shape", "Mirror" 
End With

'@ rename block: component1:vias0_1 to: component1:vias1

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Solid.Rename "component1:vias0_1", "vias1"

'@ transform: translate component1:vias0

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
With Transform 
     .Reset 
     .Name "component1:vias0" 
     .Vector "0", "-vias_spacing", "0" 
     .UsePickedPoints "False" 
     .InvertPickedPoints "False" 
     .MultipleObjects "True" 
     .GroupObjects "False" 
     .Repetitions "rep_fact" 
     .MultipleSelection "True" 
     .Destination "" 
     .Material "" 
     .AutoDestination "True" 
     .Transform "Shape", "Translate" 
End With

'@ transform: translate component1:vias1

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
With Transform 
     .Reset 
     .Name "component1:vias1" 
     .Vector "0", "-vias_spacing", "0" 
     .UsePickedPoints "False" 
     .InvertPickedPoints "False" 
     .MultipleObjects "True" 
     .GroupObjects "False" 
     .Repetitions "rep_fact" 
     .MultipleSelection "False" 
     .Destination "" 
     .Material "" 
     .AutoDestination "True" 
     .Transform "Shape", "Translate" 
End With

'@ boolean add shapes: component1:vias0, component1:vias0_1

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Solid.Add "component1:vias0", "component1:vias0_1"

'@ boolean add shapes: component1:vias0_10, component1:vias0_11

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Solid.Add "component1:vias0_10", "component1:vias0_11"

'@ boolean add shapes: component1:vias0_2, component1:vias0_3

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Solid.Add "component1:vias0_2", "component1:vias0_3"

'@ boolean add shapes: component1:vias0_4, component1:vias0_5

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Solid.Add "component1:vias0_4", "component1:vias0_5"

'@ boolean add shapes: component1:vias0_6, component1:vias0_7

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Solid.Add "component1:vias0_6", "component1:vias0_7"

'@ boolean add shapes: component1:vias0_8, component1:vias0_9

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Solid.Add "component1:vias0_8", "component1:vias0_9"

'@ boolean add shapes: component1:vias1, component1:vias1_1

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Solid.Add "component1:vias1", "component1:vias1_1"

'@ boolean add shapes: component1:vias1_10, component1:vias1_11

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Solid.Add "component1:vias1_10", "component1:vias1_11"

'@ boolean add shapes: component1:vias1_2, component1:vias1_3

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Solid.Add "component1:vias1_2", "component1:vias1_3"

'@ boolean add shapes: component1:vias1_4, component1:vias1_5

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Solid.Add "component1:vias1_4", "component1:vias1_5"

'@ boolean add shapes: component1:vias1_6, component1:vias1_7

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Solid.Add "component1:vias1_6", "component1:vias1_7"

'@ boolean add shapes: component1:vias1_8, component1:vias1_9

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Solid.Add "component1:vias1_8", "component1:vias1_9"

'@ boolean add shapes: component1:vias0, component1:vias0_10

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Solid.Add "component1:vias0", "component1:vias0_10"

'@ boolean add shapes: component1:vias0_2, component1:vias0_4

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Solid.Add "component1:vias0_2", "component1:vias0_4"

'@ boolean add shapes: component1:vias0_6, component1:vias0_8

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Solid.Add "component1:vias0_6", "component1:vias0_8"

'@ boolean add shapes: component1:vias1, component1:vias1_10

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Solid.Add "component1:vias1", "component1:vias1_10"

'@ boolean add shapes: component1:vias1_2, component1:vias1_4

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Solid.Add "component1:vias1_2", "component1:vias1_4"

'@ boolean add shapes: component1:vias1_6, component1:vias1_8

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Solid.Add "component1:vias1_6", "component1:vias1_8"

'@ boolean add shapes: component1:vias0, component1:vias0_2

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Solid.Add "component1:vias0", "component1:vias0_2"

'@ boolean add shapes: component1:vias0_6, component1:vias1

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Solid.Add "component1:vias0_6", "component1:vias1"

'@ boolean add shapes: component1:vias1_2, component1:vias1_6

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Solid.Add "component1:vias1_2", "component1:vias1_6"

'@ boolean add shapes: component1:vias0, component1:vias0_6

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Solid.Add "component1:vias0", "component1:vias0_6"

'@ boolean add shapes: component1:vias0, component1:vias1_2

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Solid.Add "component1:vias0", "component1:vias1_2"

'@ delete monitor: farfield (f=9.5)

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Monitor.Delete "farfield (f=9.5)"

'@ delete monitor: farfield (f=10)

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Monitor.Delete "farfield (f=10)"

'@ delete monitor: farfield (f=9.75)

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
With Monitor 
     .Delete "farfield (f=9.75)" 
End With

'@ define farfield monitor: farfield (f=9.7)

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
With Monitor 
     .Reset 
     .Name "farfield (f=9.7)" 
     .Domain "Frequency" 
     .FieldType "Farfield" 
     .MonitorValue "9.7" 
     .ExportFarfieldSource "False" 
     .UseSubvolume "False" 
     .Coordinates "Free" 
     .SetSubvolume "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .SetSubvolumeOffsetType "Absolute" 
     .EnableNearfieldCalculation "True" 
     .Create 
End With

'@ farfield plot options

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
With FarfieldPlot 
     .Plottype "3D" 
     .Vary "angle1" 
     .Theta "90" 
     .Phi "90" 
     .Step "5" 
     .Step2 "5" 
     .SetLockSteps "True" 
     .SetPlotRangeOnly "False" 
     .SetThetaStart "0" 
     .SetThetaEnd "180" 
     .SetPhiStart "0" 
     .SetPhiEnd "360" 
     .SetTheta360 "False" 
     .SymmetricRange "False" 
     .SetTimeDomainFF "False" 
     .SetFrequency "-1" 
     .SetTime "0" 
     .SetColorByValue "True" 
     .DrawStepLines "False" 
     .DrawIsoLongitudeLatitudeLines "False" 
     .ShowStructure "False" 
     .ShowStructureProfile "False" 
     .SetStructureTransparent "False" 
     .SetFarfieldTransparent "False" 
     .AspectRatio "Free" 
     .ShowGridlines "True" 
     .InvertAxes "False", "False" 
     .SetSpecials "enablepolarextralines" 
     .SetPlotMode "Directivity" 
     .Distance "1" 
     .UseFarfieldApproximation "True" 
     .IncludeUnitCellSidewalls "True" 
     .SetScaleLinear "False" 
     .SetLogRange "40" 
     .SetLogNorm "0" 
     .DBUnit "0" 
     .SetMaxReferenceMode "abs" 
     .EnableFixPlotMaximum "False" 
     .SetFixPlotMaximumValue "1.0" 
     .SetInverseAxialRatio "False" 
     .SetAxesType "user" 
     .SetAntennaType "unknown" 
     .Phistart "1.000000e+00", "0.000000e+00", "0.000000e+00" 
     .Thetastart "0.000000e+00", "0.000000e+00", "1.000000e+00" 
     .PolarizationVector "0.000000e+00", "1.000000e+00", "0.000000e+00" 
     .SetCoordinateSystemType "spherical" 
     .SetAutomaticCoordinateSystem "True" 
     .SetPolarizationType "Linear" 
     .SlantAngle 0.000000e+00 
     .Origin "bbox" 
     .Userorigin "0.000000e+00", "0.000000e+00", "0.000000e+00" 
     .SetUserDecouplingPlane "False" 
     .UseDecouplingPlane "False" 
     .DecouplingPlaneAxis "X" 
     .DecouplingPlanePosition "0.000000e+00" 
     .LossyGround "False" 
     .GroundEpsilon "1" 
     .GroundKappa "0" 
     .EnablePhaseCenterCalculation "False" 
     .SetPhaseCenterAngularLimit "3.000000e+01" 
     .SetPhaseCenterComponent "boresight" 
     .SetPhaseCenterPlane "both" 
     .ShowPhaseCenter "True" 
     .ClearCuts 
     .AddCut "lateral", "0", "1"  
     .AddCut "lateral", "90", "1"  
     .AddCut "polar", "90", "1"  

     .StoreSettings
End With

