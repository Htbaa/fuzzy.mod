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

SuperStrict

Rem
	bbdoc: htbaapub.fuzzy
EndRem
Module htbaapub.fuzzy
ModuleInfo "Name: htbaapub.fuzzy"
ModuleInfo "Version: 1.01"
ModuleInfo "License: MIT"
ModuleInfo "Author: Christiaan Kras"
ModuleInfo "Author of C++ code: Mat Buckland <a href='http://www.ai-junkie.com'>http://www.ai-junkie.com</a>"
ModuleInfo "Git repository: <a href='http://github.com/Htbaa/fuzzy.mod/'>http://github.com/Htbaa/fuzzy.mod/</a>"


Import brl.linkedlist
Import brl.map
Import brl.math

Include "fuzzy_module.bmx"

Include "fuzzy_fzset.bmx"
Include "fuzzy_hedges.bmx"
Include "fuzzy_operators.bmx"
Include "fuzzy_rule.bmx"
Include "fuzzy_set.bmx"
Include "fuzzy_set_left_shoulder.bmx"
Include "fuzzy_set_right_shoulder.bmx"
Include "fuzzy_set_singleton.bmx"
Include "fuzzy_set_triangle.bmx"
Include "fuzzy_term.bmx"
Include "fuzzy_variable.bmx"
