Rem
	bbdoc: 
	about:
	This defines a fuzzy set that is a singleton (a range over which the DOM is always 1.0)
End Rem
Type TFuzzySetSingleton Extends TFuzzySet
	'the values that define the shape of this FLV
	Field m_dPeakPoint:Double
	Field m_dRightOffset:Double
	Field m_dLeftOffset:Double
	
	Rem
		bbdoc:
	End Rem
	Method Create:TFuzzySetSingleton(peak:Double, leftOffset:Double, rightOffset:Double)
		Self.m_dPeakPoint = peak
		Self.m_dLeftOffset = leftOffset
		Self.m_dRightOffset = rightOffset
		Super.CreateBase(peak)
		Return Self
	End Method
	
	Rem
		bbdoc: this method calculates the degree of membership for a particular value
	End Rem
	Method CalculateDOM:Double(val:Double)
		If (val >= Self.m_dPeakPoint - Self.m_dLeftOffset) And (val <= Self.m_dPeakPoint + Self.m_dRightOffset)
			Return 1.0
		'out of range of this FLV, return zero
		Else
			Return 0.0
		End If
	End Method
End Type
