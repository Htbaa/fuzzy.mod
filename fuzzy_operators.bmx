Rem
	bbdoc: a fuzzy AND operator type
	about: Type to provider the fuzzy AND operator to be used in the creation of a fuzzy rule base
End Rem
Type TFzAND Extends TFuzzyTerm
	'an instance of this class may AND together up to 4 terms
	Field m_Terms:TList
	
	Rem
		bbdoc: 
	End Rem
	Method Create2:TFzAND(op1:TFuzzyTerm, op2:TFuzzyTerm)
	End Method
	
	Rem
		bbdoc: 
	End Rem
	Method Create3:TFzAND(op1:TFuzzyTerm, op2:TFuzzyTerm, op3:TFuzzyTerm)
	End Method
	
	Rem
		bbdoc: 
	End Rem
	Method Create4:TFzAND(op1:TFuzzyTerm, op2:TFuzzyTerm, op3:TFuzzyTerm, op4:TFuzzyTerm)
	End Method
	Rem
		bbdoc:
	End Rem
	
	Rem
		bbdoc:
	End Rem
	Method Clone:TFuzzyTerm()
		DebugLog "return new FzAND(*this);"
		Return Null
	End Method
	
	Rem
		bbdoc: 
	End Rem
	Method GetDOM:Double()
	End Method
	
	Rem
		bbdoc:
	End Rem
	Method ClearDOM()
	End Method
	
	Rem
		bbdoc: 
	End Rem
	Method ORwithDOM(val:Double)
	End Method
End Type

Rem
	bbdoc:
End Rem
Function FzAND:TFzAND(ops:TFuzzyTerm[])
	Select ops.Length
		Case 2
			Return New TFzAND.Create2(ops[0], ops[1])
		Case 3
			Return New TFzAND.Create3(ops[0], ops[1], ops[2])
		Case 4
			Return New TFzAND.Create4(ops[0], ops[1], ops[2], ops[3])
		Default
			Throw "FzAND can not handle " + ops.Length + " parameters"
	End Select
End Function

Rem
	bbdoc: a fuzzy OR operator type
	about: Type to provider the fuzzy OR operator to be used in the creation of a fuzzy rule base
End Rem
Type TFzOR Extends TFuzzyTerm
	'an instance of this class may OR together up to 4 terms
	Field m_Terms:TList
	
	Rem
		bbdoc: 
	End Rem
	Method Create2:TFzOR(op1:TFuzzyTerm, op2:TFuzzyTerm)
	End Method
	
	Rem
		bbdoc: 
	End Rem
	Method Create3:TFzOR(op1:TFuzzyTerm, op2:TFuzzyTerm, op3:TFuzzyTerm)
	End Method
	
	Rem
		bbdoc: 
	End Rem
	Method Create4:TFzOR(op1:TFuzzyTerm, op2:TFuzzyTerm, op3:TFuzzyTerm, op4:TFuzzyTerm)
	End Method
	Rem
		bbdoc:
	End Rem
	
	Rem
		bbdoc:
	End Rem
	Method Clone:TFuzzyTerm()
		DebugLog "return new FzOR(*this);"
		Return Null
	End Method
	
	Rem
		bbdoc: 
	End Rem
	Method GetDOM:Double()
	End Method
	
	Rem
		bbdoc:
	End Rem
	Method ClearDOM()
		Assert 0, "TFzOr.ClearDOM: invalid context"
	End Method
	
	Rem
		bbdoc: 
	End Rem
	Method ORwithDOM(val:Double)
		Assert 0, "TFzOr.ORwithDOM: invalid context"
	End Method
End Type

Rem
	bbdoc:
End Rem
Function FzOR:TFzOR(ops:TFuzzyTerm[])
	Select ops.Length
		Case 2
			Return New TFzOR.Create2(ops[0], ops[1])
		Case 3
			Return New TFzOR.Create3(ops[0], ops[1], ops[2])
		Case 4
			Return New TFzOR.Create4(ops[0], ops[1], ops[2], ops[3])
		Default
			Throw "FzOR can not handle " + ops.Length + " parameters"
	End Select
End Function
