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
	bbdoc: Implements a Very hedge
End Rem
Type TFzVery Extends TFuzzyTerm
	Field m_Set:TFuzzySet
	
	Rem
		bbdoc: Create a Very term
	End Rem
	Method Create:TFzVery(ft:TFzVery)
		Self.m_set = ft.m_Set
		Return Self
	End Method
	
	Rem
		bbdoc: Returns DOM
	End Rem
	Method GetDOM:Double()
		Return Self.m_Set.GetDOM() * Self.m_Set.GetDOM()
	End Method
	
	Rem
		bbdoc: Clones TFzVery
	End Rem
	Method Clone:TFuzzyTerm()
		Return New TFzVery.Create(Self)
	End Method
	
	Rem
		bbdoc: Clears DOM
	End Rem
	Method ClearDOM()
		Self.m_Set.ClearDOM()
	End Method
	
	Rem
		bbdoc:
	End Rem
	Method ORwithDOM(val:Double)
		Self.m_Set.ORwithDOM(val * val)
	End Method
End Type

Rem
	bbdoc: Implements a Fairly hedge
End Rem
Type TFzFairly Extends TFuzzyTerm
	Field m_Set:TFuzzySet
	
	Rem
		bbdoc: Create a Fairly term
	End Rem
	Method Create:TFzFairly(ft:TFzFairly)
		Self.m_set = ft.m_Set
		Return Self
	End Method
	
	Rem
		bbdoc: Returns DOM
	End Rem
	Method GetDOM:Double()
		Return Sqr(Self.m_Set.GetDOM())
	End Method
	
	Rem
		bbdoc: Clones DOM
	End Rem
	Method Clone:TFuzzyTerm()
		Return New TFzFairly.Create(Self)
	End Method
	
	Rem
		bbdoc: Clears DOM
	End Rem
	Method ClearDOM()
		Self.m_Set.ClearDOM()
	End Method
	
	Rem
		bbdoc:
	End Rem
	Method ORwithDOM(val:Double)
		Self.m_Set.ORwithDOM(Sqr(val))
	End Method
End Type
