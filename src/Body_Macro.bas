' I guess you need to add your name at the beggining of your code so that a reader will get an idea who worte it
' Overall your comment looks great but you wrote too much info and takecare for word counts
' You need also to have a file name that explains the work to be done. Meaning your code is not only the 
' body but also it includes other sections. 
' Really great job in coding the body and other sections

Attribute VB_Name = "Macros"

Sub MainHeaders_and_Body_FULLYAUTOMATIC()

    ' This Macro requires that you use Word's Styles functions, such as "Header 1" for main headers
    ' This Macro takes advantage of the fact that there's going to be a header titled "Introduction" within the text.
    ' It searches for an "Introduction" string and selects it. Make sure to have the cursor at the top of the page
    ' so that the macro selects the Introduction string for the header and not one that may be possibly located elsewhere.
    '
    ' By recording macros while playing around with styles, specifically when using the "Select all" command from within a style menu
    ' I was able to find the WordBasic command to select all text using the same style. This allowed my macro to select all the headings
    ' using the Header 1 style and then change the Header 1 fonts and paragraphs to match the IEEE Template

    Selection.Find.Execute FindText:="Introduction"
    WordBasic.SelectSimilarFormatting
    Selection.Style = ActiveDocument.Styles("Heading 1")
    
    ' This section formats the selected headings (main headings)
    
     With ActiveDocument.Styles("Heading 1").Font
        .Name = "Times New Roman"
        .Size = 10
        .Bold = False
        .Italic = False
        .Underline = wdUnderlineNone
        .UnderlineColor = wdColorAutomatic
        .StrikeThrough = False
        .DoubleStrikeThrough = False
        .Outline = False
        .Emboss = False
        .Shadow = False
        .Hidden = False
        .SmallCaps = True
        .AllCaps = False
        .Color = wdColorAutomatic
        .Engrave = False
        .Superscript = False
        .Subscript = False
        .Scaling = 100
        .Kerning = 0
        .Animation = wdAnimationNone
        .Ligatures = wdLigaturesNone
        .NumberSpacing = wdNumberSpacingDefault
        .NumberForm = wdNumberFormDefault
        .StylisticSet = wdStylisticSetDefault
        .ContextualAlternates = 0
    End With
    With ActiveDocument.Styles("Heading 1").ParagraphFormat
        .LeftIndent = InchesToPoints(0)
        .RightIndent = InchesToPoints(0)
        .SpaceBefore = 8
        .SpaceBeforeAuto = False
        .SpaceAfter = 4
        .SpaceAfterAuto = False
        .LineSpacingRule = wdLineSpaceSingle
        .Alignment = wdAlignParagraphCenter
        .WidowControl = True
        .KeepWithNext = True
        .KeepTogether = True
        .PageBreakBefore = False
        .NoLineNumber = False
        .Hyphenation = True
        .FirstLineIndent = InchesToPoints(0)
        .OutlineLevel = wdOutlineLevel1
        .CharacterUnitLeftIndent = 0
        .CharacterUnitRightIndent = 0
        .CharacterUnitFirstLineIndent = 0
        .LineUnitBefore = 0
        .LineUnitAfter = 0
        .MirrorIndents = False
        .TextboxTightWrap = wdTightNone
        .CollapsedByDefault = False
    End With
    ActiveDocument.Styles("Heading 1").NoSpaceBetweenParagraphsOfSameStyle = _
        False
    ActiveDocument.Styles("Heading 1").ParagraphFormat.TabStops.ClearAll
    ActiveDocument.Styles("Heading 1").ParagraphFormat.TabStops.Add Position:= _
        InchesToPoints(0.15), Alignment:=wdAlignTabLeft, Leader:= _
        wdTabLeaderSpaces
    With ActiveDocument.Styles("Heading 1")
        .AutomaticallyUpdate = False
        .BaseStyle = "Normal"
        .NextParagraphStyle = "Normal"
    End With
    
    
    'Now that the main headers are done I was also able to automate the selection of a sample of the Body text, which would be located
    'right below the Introduction header. I began by clearing the current selection, moving down, and selecting some of the body
    'and then using the SelectSimilarFormatting method to select all Body text (excluding numbered/bullet lists which will have to
    'be selected manual and automated with a different macro
    
    Selection.EscapeKey
    Selection.EscapeKey
    Selection.Find.Execute FindText:="Introduction"
    Selection.MoveDown
    WordBasic.SelectSimilarFormatting
    
    Selection.Style = ActiveDocument.Styles("Normal")
    With ActiveDocument.Styles("Normal").Font
        .Name = "Times New Roman"
        .Size = 10
        .Bold = False
        .Italic = False
        .Underline = wdUnderlineNone
        .UnderlineColor = wdColorAutomatic
        .StrikeThrough = False
        .DoubleStrikeThrough = False
        .Outline = False
        .Emboss = False
        .Shadow = False
        .Hidden = False
        .SmallCaps = False
        .AllCaps = False
        .Color = wdColorAutomatic
        .Engrave = False
        .Superscript = False
        .Subscript = False
        .Spacing = -0.05
        .Scaling = 100
        .Kerning = 0
        .Animation = wdAnimationNone
        .Ligatures = wdLigaturesNone
        .NumberSpacing = wdNumberSpacingDefault
        .NumberForm = wdNumberFormDefault
        .StylisticSet = wdStylisticSetDefault
        .ContextualAlternates = 0
    End With
    With ActiveDocument.Styles("Normal").ParagraphFormat
        .LeftIndent = InchesToPoints(0)
        .RightIndent = InchesToPoints(0)
        .SpaceBefore = 0
        .SpaceBeforeAuto = False
        .SpaceAfter = 6
        .SpaceAfterAuto = False
        .LineSpacingRule = wdLineSpaceMultiple
        .LineSpacing = LinesToPoints(0.95)
        .Alignment = wdAlignParagraphJustify
        .WidowControl = True
        .KeepWithNext = False
        .KeepTogether = False
        .PageBreakBefore = False
        .NoLineNumber = False
        .Hyphenation = True
        .FirstLineIndent = InchesToPoints(0.2)
        .OutlineLevel = wdOutlineLevelBodyText
        .CharacterUnitLeftIndent = 0
        .CharacterUnitRightIndent = 0
        .CharacterUnitFirstLineIndent = 0
        .LineUnitBefore = 0
        .LineUnitAfter = 0
        .MirrorIndents = False
        .TextboxTightWrap = wdTightNone
        .CollapsedByDefault = False
    End With
    ActiveDocument.Styles("Normal").NoSpaceBetweenParagraphsOfSameStyle = _
        False
    With ActiveDocument.Styles("Normal")
        .AutomaticallyUpdate = False
        .NextParagraphStyle = "Normal"
   
    End With

End Sub

Sub InnerHeadings()
Attribute InnerHeadings.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.InnerHeadings"
'
' InnerHeadings Macro
'
'
' To use this Macro first select a single inner heading (which should be using the Heading 2 style)
' and simply run the Macro to automatically change all inner headings to the correct font/formatting

    WordBasic.SelectSimilarFormatting
    With ActiveDocument.Styles("Heading 2").Font
        .Name = "Times New Roman"
        .Size = 10
        .Bold = False
        .Italic = True
        .Underline = wdUnderlineNone
        .UnderlineColor = wdColorAutomatic
        .StrikeThrough = False
        .DoubleStrikeThrough = False
        .Outline = False
        .Emboss = False
        .Shadow = False
        .Hidden = False
        .SmallCaps = False
        .AllCaps = False
        .Color = wdColorAutomatic
        .Engrave = False
        .Superscript = False
        .Subscript = False
        .Scaling = 100
        .Kerning = 0
        .Animation = wdAnimationNone
        .Ligatures = wdLigaturesNone
        .NumberSpacing = wdNumberSpacingDefault
        .NumberForm = wdNumberFormDefault
        .StylisticSet = wdStylisticSetDefault
        .ContextualAlternates = 0
    End With
    With ActiveDocument.Styles("Heading 2").ParagraphFormat
        .LeftIndent = InchesToPoints(0.2)
        .RightIndent = InchesToPoints(0)
        .SpaceBefore = 6
        .SpaceBeforeAuto = False
        .SpaceAfter = 3
        .SpaceAfterAuto = False
        .LineSpacingRule = wdLineSpaceSingle
        .Alignment = wdAlignParagraphLeft
        .WidowControl = True
        .KeepWithNext = True
        .KeepTogether = True
        .PageBreakBefore = False
        .NoLineNumber = False
        .Hyphenation = True
        .FirstLineIndent = InchesToPoints(-0.2)
        .OutlineLevel = wdOutlineLevel2
        .CharacterUnitLeftIndent = 0
        .CharacterUnitRightIndent = 0
        .CharacterUnitFirstLineIndent = 0
        .LineUnitBefore = 0
        .LineUnitAfter = 0
        .MirrorIndents = False
        .TextboxTightWrap = wdTightNone
        .CollapsedByDefault = False
    End With
    ActiveDocument.Styles("Heading 2").NoSpaceBetweenParagraphsOfSameStyle = _
        False
    ActiveDocument.Styles("Heading 2").ParagraphFormat.TabStops.ClearAll
    With ActiveDocument.Styles("Heading 2").ParagraphFormat
        With .Shading
            .Texture = wdTextureNone
            .ForegroundPatternColor = wdColorAutomatic
            .BackgroundPatternColor = wdColorAutomatic
        End With
        .Borders(wdBorderLeft).LineStyle = wdLineStyleNone
        .Borders(wdBorderRight).LineStyle = wdLineStyleNone
        .Borders(wdBorderTop).LineStyle = wdLineStyleNone
        .Borders(wdBorderBottom).LineStyle = wdLineStyleNone
        With .Borders
            .DistanceFromTop = 1
            .DistanceFromLeft = 4
            .DistanceFromBottom = 1
            .DistanceFromRight = 4
            .Shadow = False
        End With
    End With
    With ActiveDocument.Styles("Heading 2")
        .AutomaticallyUpdate = False
        .BaseStyle = "Normal"
        .NextParagraphStyle = "Normal"
    End With
End Sub
Sub BulletList()

    Selection.Style = ActiveDocument.Styles("List Paragraph")
    
    ActiveDocument.Styles("List Paragraph").AutomaticallyUpdate = False
    With ActiveDocument.Styles("List Paragraph").Font
        .Name = "Times New Roman"
        .Size = 10
        .Bold = False
        .Italic = False
        .Underline = wdUnderlineNone
        .UnderlineColor = wdColorAutomatic
        .StrikeThrough = False
        .DoubleStrikeThrough = False
        .Outline = False
        .Emboss = False
        .Shadow = False
        .Hidden = False
        .SmallCaps = False
        .AllCaps = False
        .Color = wdColorAutomatic
        .Engrave = False
        .Superscript = False
        .Subscript = False
        .Spacing = -0.05
        .Scaling = 100
        .Kerning = 0
        .Animation = wdAnimationNone
        .Ligatures = wdLigaturesNone
        .NumberSpacing = wdNumberSpacingDefault
        .NumberForm = wdNumberFormDefault
        .StylisticSet = wdStylisticSetDefault
        .ContextualAlternates = 0
    End With
    With ActiveDocument.Styles("List Paragraph").ParagraphFormat
        .LeftIndent = InchesToPoints(0.4)
        .RightIndent = InchesToPoints(0)
        .SpaceBefore = 0
        .SpaceBeforeAuto = False
        .SpaceAfter = 6
        .SpaceAfterAuto = False
        .LineSpacingRule = wdLineSpaceMultiple
        .LineSpacing = LinesToPoints(0.95)
        .Alignment = wdAlignParagraphJustify
        .WidowControl = True
        .KeepWithNext = False
        .KeepTogether = False
        .PageBreakBefore = False
        .NoLineNumber = False
        .Hyphenation = True
        .FirstLineIndent = InchesToPoints(-0.15)
        .OutlineLevel = wdOutlineLevelBodyText
        .CharacterUnitLeftIndent = 0
        .CharacterUnitRightIndent = 0
        .CharacterUnitFirstLineIndent = 0
        .LineUnitBefore = 0
        .LineUnitAfter = 0
        .MirrorIndents = False
        .TextboxTightWrap = wdTightNone
        .CollapsedByDefault = False
    End With
    ActiveDocument.Styles("List Paragraph"). _
        NoSpaceBetweenParagraphsOfSameStyle = False
    ActiveDocument.Styles("List Paragraph").ParagraphFormat.TabStops.ClearAll
    ActiveDocument.Styles("List Paragraph").ParagraphFormat.TabStops.Add _
        Position:=InchesToPoints(0.2), Alignment:=wdAlignTabLeft, Leader:= _
        wdTabLeaderSpaces
    With ActiveDocument.Styles("List Paragraph").ParagraphFormat
        With .Shading
            .Texture = wdTextureNone
            .ForegroundPatternColor = wdColorAutomatic
            .BackgroundPatternColor = wdColorAutomatic
        End With
        .Borders(wdBorderLeft).LineStyle = wdLineStyleNone
        .Borders(wdBorderRight).LineStyle = wdLineStyleNone
        .Borders(wdBorderTop).LineStyle = wdLineStyleNone
        .Borders(wdBorderBottom).LineStyle = wdLineStyleNone
        .Borders(wdBorderHorizontal).LineStyle = wdLineStyleNone
        With .Borders
            .DistanceFromTop = 1
            .DistanceFromLeft = 4
            .DistanceFromBottom = 1
            .DistanceFromRight = 4
            .Shadow = False
        End With
    End With
    ActiveDocument.Styles("List Paragraph").NoProofing = False
    ActiveDocument.Styles("List Paragraph").Frame.Delete
    
    With Selection.ParagraphFormat
        .LeftIndent = InchesToPoints(0.45)
        .RightIndent = InchesToPoints(0)
        .SpaceBefore = 0
        .SpaceBeforeAuto = False
        .SpaceAfter = 6
        .SpaceAfterAuto = False
        .LineSpacingRule = wdLineSpaceMultiple
        .LineSpacing = LinesToPoints(0.95)
        .Alignment = wdAlignParagraphJustify
        .WidowControl = True
        .KeepWithNext = False
        .KeepTogether = False
        .PageBreakBefore = False
        .NoLineNumber = False
        .Hyphenation = True
        .FirstLineIndent = InchesToPoints(-0.25)
        .OutlineLevel = wdOutlineLevelBodyText
        .CharacterUnitLeftIndent = 0
        .CharacterUnitRightIndent = 0
        .CharacterUnitFirstLineIndent = 0
        .LineUnitBefore = 0
        .LineUnitAfter = 0
        .MirrorIndents = False
        .TextboxTightWrap = wdTightNone
        .CollapsedByDefault = False
    End With
    With Selection.ParagraphFormat
        .LeftIndent = InchesToPoints(0.45)
        .RightIndent = InchesToPoints(0)
        .SpaceBefore = 0
        .SpaceBeforeAuto = False
        .SpaceAfter = 0
        .SpaceAfterAuto = False
        .LineSpacingRule = wdLineSpaceMultiple
        .LineSpacing = LinesToPoints(0.95)
        .Alignment = wdAlignParagraphJustify
        .WidowControl = True
        .KeepWithNext = False
        .KeepTogether = False
        .PageBreakBefore = False
        .NoLineNumber = False
        .Hyphenation = True
        .FirstLineIndent = InchesToPoints(-0.25)
        .OutlineLevel = wdOutlineLevelBodyText
        .CharacterUnitLeftIndent = 0
        .CharacterUnitRightIndent = 0
        .CharacterUnitFirstLineIndent = 0
        .LineUnitBefore = 0
        .LineUnitAfter = 0
        .MirrorIndents = False
        .TextboxTightWrap = wdTightNone
        .CollapsedByDefault = False
    End With
    With Selection.ParagraphFormat
        .LeftIndent = InchesToPoints(0.45)
        .RightIndent = InchesToPoints(0)
        .SpaceBefore = 0
        .SpaceBeforeAuto = False
        .SpaceAfter = 6
        .SpaceAfterAuto = False
        .LineSpacingRule = wdLineSpaceMultiple
        .LineSpacing = LinesToPoints(0.95)
        .Alignment = wdAlignParagraphJustify
        .WidowControl = True
        .KeepWithNext = False
        .KeepTogether = False
        .PageBreakBefore = False
        .NoLineNumber = False
        .Hyphenation = True
        .FirstLineIndent = InchesToPoints(-0.25)
        .OutlineLevel = wdOutlineLevelBodyText
        .CharacterUnitLeftIndent = 0
        .CharacterUnitRightIndent = 0
        .CharacterUnitFirstLineIndent = 0
        .LineUnitBefore = 0
        .LineUnitAfter = 0
        .MirrorIndents = False
        .TextboxTightWrap = wdTightNone
        .CollapsedByDefault = False
    End With
    With Selection.ParagraphFormat
        .LeftIndent = InchesToPoints(0.35)
        .RightIndent = InchesToPoints(0)
        .SpaceBefore = 0
        .SpaceBeforeAuto = False
        .SpaceAfter = 6
        .SpaceAfterAuto = False
        .LineSpacingRule = wdLineSpaceMultiple
        .LineSpacing = LinesToPoints(0.95)
        .Alignment = wdAlignParagraphJustify
        .WidowControl = True
        .KeepWithNext = False
        .KeepTogether = False
        .PageBreakBefore = False
        .NoLineNumber = False
        .Hyphenation = True
        .FirstLineIndent = InchesToPoints(-0.25)
        .OutlineLevel = wdOutlineLevelBodyText
        .CharacterUnitLeftIndent = 0
        .CharacterUnitRightIndent = 0
        .CharacterUnitFirstLineIndent = 0
        .LineUnitBefore = 0
        .LineUnitAfter = 0
        .MirrorIndents = False
        .TextboxTightWrap = wdTightNone
        .CollapsedByDefault = False
    End With
    With Selection.ParagraphFormat
        .LeftIndent = InchesToPoints(0.45)
        .RightIndent = InchesToPoints(0)
        .SpaceBefore = 0
        .SpaceBeforeAuto = False
        .SpaceAfter = 6
        .SpaceAfterAuto = False
        .LineSpacingRule = wdLineSpaceMultiple
        .LineSpacing = LinesToPoints(0.95)
        .Alignment = wdAlignParagraphJustify
        .WidowControl = True
        .KeepWithNext = False
        .KeepTogether = False
        .PageBreakBefore = False
        .NoLineNumber = False
        .Hyphenation = True
        .FirstLineIndent = InchesToPoints(-0.25)
        .OutlineLevel = wdOutlineLevelBodyText
        .CharacterUnitLeftIndent = 0
        .CharacterUnitRightIndent = 0
        .CharacterUnitFirstLineIndent = 0
        .LineUnitBefore = 0
        .LineUnitAfter = 0
        .MirrorIndents = False
        .TextboxTightWrap = wdTightNone
        .CollapsedByDefault = False
    End With
    Selection.Range.ListFormat.RemoveNumbers NumberType:=wdNumberParagraph
    With ListGalleries(wdBulletGallery).ListTemplates(1).ListLevels(1)
        .NumberFormat = ChrW(61623)
        .TrailingCharacter = wdTrailingTab
        .NumberStyle = wdListNumberStyleBullet
        .NumberPosition = InchesToPoints(0.2)
        .Alignment = wdListLevelAlignLeft
        .TextPosition = InchesToPoints(0.45)
        .TabPosition = InchesToPoints(0.45)
        .ResetOnHigher = 0
        .StartAt = 1
        With .Font
            .Bold = wdUndefined
            .Italic = wdUndefined
            .StrikeThrough = wdUndefined
            .Subscript = wdUndefined
            .Superscript = wdUndefined
            .Shadow = wdUndefined
            .Outline = wdUndefined
            .Emboss = wdUndefined
            .Engrave = wdUndefined
            .AllCaps = wdUndefined
            .Hidden = wdUndefined
            .Underline = wdUndefined
            .Color = wdUndefined
            .Size = wdUndefined
            .Animation = wdUndefined
            .DoubleStrikeThrough = wdUndefined
            .Name = "Symbol"
        End With
        .LinkedStyle = "bullet list"
    End With
    ListGalleries(wdBulletGallery).ListTemplates(1).Name = ""
    Selection.Range.ListFormat.ApplyListTemplateWithLevel ListTemplate:= _
        ListGalleries(wdBulletGallery).ListTemplates(1), ContinuePreviousList:= _
        True, ApplyTo:=wdListApplyToWholeList, DefaultListBehavior:= _
        wdWord10ListBehavior
 
End Sub
Sub PageLayout_TwoColumns_Margins()
Attribute PageLayout_TwoColumns_Margins.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.Macro8"

    With Selection.PageSetup.TextColumns
        .SetCount NumColumns:=2
        .EvenlySpaced = True
        .LineBetween = False
    End With
     With Selection.PageSetup
        .LineNumbering.Active = False
        .Orientation = wdOrientPortrait
        .TopMargin = InchesToPoints(0.75)
        .BottomMargin = InchesToPoints(1)
        .LeftMargin = InchesToPoints(0.63)
        .RightMargin = InchesToPoints(0.63)
        .Gutter = InchesToPoints(0)
        .HeaderDistance = InchesToPoints(0.5)
        .FooterDistance = InchesToPoints(0.5)
        .PageWidth = InchesToPoints(8.5)
        .PageHeight = InchesToPoints(11)
        .FirstPageTray = wdPrinterDefaultBin
        .OtherPagesTray = wdPrinterDefaultBin
        .OddAndEvenPagesHeaderFooter = False
        .DifferentFirstPageHeaderFooter = False
        .VerticalAlignment = wdAlignVerticalTop
        .SuppressEndnotes = False
        .MirrorMargins = False
        .TwoPagesOnOne = False
        .BookFoldPrinting = False
        .BookFoldRevPrinting = False
        .BookFoldPrintingSheets = 1
        .GutterPos = wdGutterPosLeft
    End With
End Sub
Sub Citation()
Attribute Citation.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.Citation"
'
' Citation Macro
'
'
    Selection.Font.Name = "Times New Roman"
    Selection.Font.Size = 8
    Selection.ParagraphFormat.Alignment = wdAlignParagraphJustify
    Selection.ParagraphFormat.Alignment = wdAlignParagraphJustify
    With ListGalleries(wdNumberGallery).ListTemplates(1).ListLevels(1)
        .NumberFormat = "[%1.]"
        .TrailingCharacter = wdTrailingTab
        .NumberStyle = wdListNumberStyleArabic
        .NumberPosition = InchesToPoints(0.25)
        .Alignment = wdListLevelAlignLeft
        .TextPosition = InchesToPoints(0.5)
        .TabPosition = wdUndefined
        .ResetOnHigher = 0
        .StartAt = 1
        With .Font
            .Bold = wdUndefined
            .Italic = wdUndefined
            .StrikeThrough = wdUndefined
            .Subscript = wdUndefined
            .Superscript = wdUndefined
            .Shadow = wdUndefined
            .Outline = wdUndefined
            .Emboss = wdUndefined
            .Engrave = wdUndefined
            .AllCaps = wdUndefined
            .Hidden = wdUndefined
            .Underline = wdUndefined
            .Color = wdUndefined
            .Size = wdUndefined
            .Animation = wdUndefined
            .DoubleStrikeThrough = wdUndefined
            .Name = ""
        End With
        .LinkedStyle = ""
    End With
    ListGalleries(wdNumberGallery).ListTemplates(1).Name = ""
    Selection.Range.ListFormat.ApplyListTemplateWithLevel ListTemplate:= _
        ListGalleries(wdNumberGallery).ListTemplates(1), ContinuePreviousList:= _
        False, ApplyTo:=wdListApplyToWholeList, DefaultListBehavior:= _
        wdWord10ListBehavior
End Sub
