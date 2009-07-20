SuperStrict
Rem
	This example represents how a AI agent would determine if it's undesirable, desirable or very desirable
	to use the weapon (a Rocket Launcher) at the opponent. There are 2 factors which influence the decision:
	Distance to the target and the amount of ammo. For a rocket launcher it's of course not smart to fire it
	from a short distance, and also not from a very far distance as it's not very fast and maybe it's direction
	will also alter. But when the distance is far but the agent has loads of ammo then of course it's worth a
	shot to try and hit the target (desirability=Desirable). So a medium distance is very desirable, depending
	on the amount of ammo.
	
	Now imagine that all your weapons have a method called CalculateDesirability(). Each weapon will hold its
	own fuzzy module to determine if it's wise to use the weapon in the current situation or not. The agent will
	have a method called SelectWeapon() which executes the CalculateDesirability() method of each available weapon
	and the weapon with the highest score will, most likely, be the best choice. More importantly, it would most
	likely be a decision a human would make as well. Of course, it all very much depends on how you've set your
	FLV's, which in turn can also be tweaked to make agents that make smart or dumb decisions.
End Rem
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

'If TargetClose And AmmoLoads Then Undesirable... And so on
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

