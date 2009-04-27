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
	Method New()
		Self.m_Terms = New TList
	End Method
	
	Rem
		bbdoc: 
	End Rem
	Method Create:TFzAND(ops:TFuzzyTerm[])
		For Local op:TFuzzyTerm = EachIn ops
			Self.m_Terms.AddLast(op.Clone())
		Next
		Return Self
	End Method
	
	Rem
		bbdoc:
	End Rem
	Method Clone:TFuzzyTerm()
		Local term:TFzAND = New TFzAND
		term.m_Terms = Self.m_Terms.Copy()
		Return term
	End Method
	
	Rem
		bbdoc: the AND operator returns the minimum DOM of the sets it is operating on
	End Rem
	Method GetDOM:Double()
		Local smallest:Double = 10 ^ 308
		For Local curTerm:TFuzzyTerm = EachIn Self.m_Terms
			If curTerm.GetDOM() < smallest
				smallest = curTerm.GetDOM()
			End If
		Next
		Return smallest
	End Method
	
	Rem
		bbdoc:
	End Rem
	Method ClearDOM()
		For Local curTerm:TFuzzyTerm = EachIn Self.m_Terms
			curTerm.ClearDOM()
		Next
	End Method
	
	Rem
		bbdoc: 
	End Rem
	Method ORwithDOM(val:Double)
		For Local curTerm:TFuzzyTerm = EachIn Self.m_Terms
			curTerm.ORwithDOM(val)
		Next
	End Method
End Type


Rem
	bbdoc:
End Rem
Function FzAND:TFzAND(ops:TFuzzyTerm[])
	Return New TFzAND.Create(ops)
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
	Method New()
		Self.m_Terms = New TList
	End Method
	
	Rem
		bbdoc: 
	End Rem
	Method Create:TFzOR(ops:TFuzzyTerm[])
		For Local op:TFuzzyTerm = EachIn ops
			Self.m_Terms.AddLast(op.Clone())
		Next
		Return Self
	End Method
	
	Rem
		bbdoc:
	End Rem
	Method Clone:TFuzzyTerm()
		Local term:TFzOR = New TFzOR
		term.m_Terms = Self.m_Terms.Copy()
		Return term
	End Method
	
	Rem
		bbdoc: the OR operator returns the maximum DOM of the sets it is operating on
	End Rem
	Method GetDOM:Double()
		Local largest:Double = -(10 ^ -38)
		For Local curTerm:TFuzzyTerm = EachIn Self.m_Terms
			If curTerm.GetDOM() > largest
				largest = curTerm.GetDOM()
			End If
		Next
		Return largest
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
	Return New TFzOR.Create(ops)
End Function
