/**
# FocusableUIPractice: View.swift
Copyright © 2023 zumuya
Permission is hereby granted, free of charge, to any person obtaining a copy of this software
and associated documentation files (the "Software"), to deal in the Software without restriction,
including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,
and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all copies or substantial
portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR
APARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
**/

import SwiftUI

struct FolderView: View
{
	@StateObject var folder: Folder
	@FocusState private var isFocused: Bool
	
	var body: some View
	{
		ZStack(alignment: .topLeading) {
			Color(nsColor: .windowBackgroundColor)
			if let childFolder = folder.child {
				FolderView(folder: childFolder)
					.padding(40)
			} else {
				Color.clear.frame(width: 60, height: 40)
			}
			Rectangle().stroke(style: .init(lineWidth: 2))
			TextField("Name", text: $folder.name)
				.frame(width: 100)
				.padding(.top, 8)
				.padding(.leading, 8)
		}
		.contentShape(.focusEffect, Rectangle())
		.focusable(true)
		.focused($isFocused)
		.focusedValue(\.outputDescriptionCommandTarget, folder)
		.onTapGesture {
			isFocused = true
		}
	}
}

