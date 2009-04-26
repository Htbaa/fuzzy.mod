Rem
	bbdoc: This is a simple class to define fuzzy sets that have a triangular shape and can be defined by a mid point, a left displacement and a right displacement.
	about:
End Rem
Type TFuzzySetTriangle Extends TFuzzySet
	'the values that define the shape of this FLV
	Field m_dPeakPoint:Double
	Field m_dRightOffset:Double
	Field m_dLeftOffset:Double

	Rem
		bbdoc:
	End Rem
	Method Create:TFuzzySetTriangle(peak:Double, leftOffset:Double, rightOffset:Double)
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
		'test for the case where the triangle's left or right offsets are zero (to prevent divide by zero errors below)
		If (Self.m_dRightOffset = 0 And Self.m_dPeakPoint = val) Or (Self.m_dLeftOffset = 0 And Self.m_dPeakPoint = val)
			Return 1.0
		'find DOM if left of center
		Else If val <= Self.m_dPeakPoint And val >= Self.m_dPeakPoint - Self.m_dLeftOffset
			Local grad:Double = 1.0 / Self.m_dLeftOffset
			Return grad * (val - (Self.m_dPeakPoint - Self.m_dLeftOffset))
		'find DOM if right of center
		Else If val > Self.m_dPeakPoint And val <= Self.m_dPeakPoint + Self.m_dRightOffset
			Local grad:Double = 1.0 / -Self.m_dRightOffset
			Return grad * (val - Self.m_dPeakPoint) + Self.m_dLeftOffset
		'out of range of this FLV, return zero
		Else
			Return 0.0
		End If
	End Method
End Type
