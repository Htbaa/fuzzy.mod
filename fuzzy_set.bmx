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
	bbdoc: class to define an interface for a fuzzy set
End Rem
Type TFuzzySet Abstract
	Field m_dDOM:Double
	
	'this is the maximum of the set's membership function. For instamce, if
	'the set is triangular then this will be the peak point of the triangular.
	'if the set has a plateau then this value will be the mid point of the 
	'plateau. This value is set in the constructor to avoid run-time
	'calculation of mid-point values.
	Field m_dRepresentativeValue:Double

	Rem
		bbdoc:
	End Rem	
	Method New()
		Self.m_dDOM = 0.0
	End Method
	
	Rem
		bbdoc:
	End Rem
	Method CreateBase:TFuzzySet(repVal:Double)
		Self.m_dRepresentativeValue = repVal
		Return Self
	End Method

	Rem
		bbdoc:
		about:
		return the degree of membership in this set of the given value. NOTE,
		this does not set m_dDOM to the DOM of the value passed as the parameter.
		This is because the centroid defuzzification method also uses this method
		to determine the DOMs of the values it uses as its sample points.
	End Rem
	Method CalculateDOM:Double(val:Double) Abstract
	
	Rem
		bbdoc:
		about:
		if this fuzzy set is part of a consequent FLV, and it is fired by a rule 
		then this method sets the DOM (in this context, the DOM represents a
		confidence level)to the maximum of the parameter value or the set's 
		existing m_dDOM value
	End Rem
	Method ORwithDOM(val:Double)
		If val > Self.m_dDOM
			Self.m_dDOM = val
		End If
	End Method
	
	Rem
		bbdoc:
	End Rem
	Method GetRepresentativeVal:Double()
		Return Self.m_dRepresentativeValue
	End Method
	
	Rem
		bbdoc: Resets DOM
	End Rem
	Method ClearDOM()
		Self.m_dDOM = 0.0
	End Method
	
	Rem
		bbdoc: Returns DOM
	End Rem
	Method GetDOM:Double()
		Return Self.m_dDOM
	End Method
	
	Rem
		bbdoc: Set DOM
	End Rem
	Method SetDOM(val:Double)
		Assert (val <= 1 And val >= 0), "TFuzzySet.SetDOM: invalid value"
		Self.m_dDOM = val
	End Method
End Type
