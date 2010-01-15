Rem
	Copyright (c) 2010 Christiaan Kras
	
	Permission is hereby granted, free of charge, to any person obtaining a copy
	of this software and associated documentation files (the "Software"), to deal
	in the Software without restriction, including without limitation the rights
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the Software is
	furnished to do so, subject to the following conditions:
	
	The above copyright notice and this permission notice shall be included in
	all copies or substantial portions of the Software.
	
	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
	THE SOFTWARE.
End Rem

Rem
	bbdoc: Singleton set
	about:
	This defines a fuzzy set that is a singleton (a range over which the DOM is always 1.0)
End Rem
Type TFuzzySetSingleton Extends TFuzzySet
	'the values that define the shape of this FLV
	Field m_dPeakPoint:Double
	Field m_dRightOffset:Double
	Field m_dLeftOffset:Double
	
	Rem
		bbdoc: Creates a TFuzzySetSingleton object
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
