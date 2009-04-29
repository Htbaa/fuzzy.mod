SuperStrict

Import htbaapub.fuzzy

Local fm:TFuzzyModule = New TFuzzyModule

Local distToTarget:TFuzzyVariable = fm.CreateFLV("DistToTarget")
Local TargetClose:TFzSet = distToTarget.AddLeftShoulderSet("TargetClose", 0, 25, 150)
Local TargetMedium:TFzSet = distToTarget.AddTriangularSet("TargetMedium", 25, 50, 300)
Local TargetFar:TFzSet = distToTarget.AddRightShoulderSet("TargetFar", 150, 300, 1000)

Local desirability:TFuzzyVariable = fm.CreateFLV("Desirability")
Local VeryDesirable:TFzSet = desirability.AddRightShoulderSet("VeryDesirable", 50, 75, 100)
Local Desirable:TFzSet = desirability.AddTriangularSet("Desirable", 25, 50, 75)
Local Undesirable:TFzSet = desirability.AddLeftShoulderSet("Undesirable", 0, 25, 50)

Local ammoStatus:TFuzzyVariable = fm.CreateFLV("AmmoStatus")
Local AmmoLoads:TFzSet = ammoStatus.AddRightShoulderSet("AmmoLoads", 10, 30, 100)
Local AmmoOkay:TFzSet = ammoStatus.AddTriangularSet("AmmoOkay", 0, 10, 30)
Local AmmoLow:TFzSet = ammoStatus.AddTriangularSet("AmmoLow", 0, 0, 10)


fm.AddRule(FzAND([TargetClose, AmmoLoads]), Undesirable)
fm.AddRule(FzAND([TargetClose, AmmoOkay]), Undesirable)
fm.AddRule(FzAND([TargetClose, AmmoLow]), Undesirable)

fm.AddRule(FzAND([TargetMedium, AmmoLoads]), VeryDesirable)
fm.AddRule(FzAND([TargetMedium, AmmoOkay]), VeryDesirable)
fm.AddRule(FzAND([TargetMedium, AmmoLow]), Desirable)

fm.AddRule(FzAND([TargetFar, AmmoLoads]), Desirable)
fm.AddRule(FzAND([TargetFar, AmmoOkay]), Undesirable)
fm.AddRule(FzAND([TargetFar, AmmoLow]), Undesirable)

'fuzzify distance and amount of ammo
fm.Fuzzify("DistToTarget", 200)
fm.Fuzzify("AmmoStatus", 20)
'Try MaxAV method
Local result1:Double = fm.Defuzzify("Desirability", TFuzzyModule.DefuzzifyMethod_MaxAv)
DebugLog result1
Local s:String
DebugLog fm.WriteAllDOMs(s)

'fuzzify distance and amount of ammo
fm.Fuzzify("DistToTarget", 200)
fm.Fuzzify("AmmoStatus", 20)
'Try Centroid method
Local result2:Double = fm.Defuzzify("Desirability", TFuzzyModule.DefuzzifyMethod_Centroid)
DebugLog result2
s = ""
DebugLog fm.WriteAllDOMs(s)

