library(readr)

profmapp <- read_csv("./prof-mapp.csv")
colnames(profmapp)[1] <- "app"

gplaydata <- read_csv("./gplaydata.csv")
gplaydata$app <- tolower(gplaydata$app)

lint <- read_csv("./lint.csv")
lint$app <- tolower(lint$app)

mate <- read_csv("./mate.csv")
colnames(mate)[1] <- "app"
mate$app <- tolower(mate$app)
colnames(mate)[5] <- "M-total_acc_issues"
colnames(mate)[9] <- "M-NonTextContent"
colnames(mate)[10] <- "M-IdentifyInputPurpose"
colnames(mate)[11] <- "M-ContrastMinimum"
colnames(mate)[12] <- "M-TargetSize"
colnames(mate)[13] <- "M-DuplicateContentDescription"
colnames(mate)[14] <- "M-Spacing"
colnames(mate)[15] <- "M-Orientation"
colnames(mate)[16] <- "M-PageTitled"

acc_dataset_full <- merge(profmapp, gplaydata)
acc_dataset_full <- merge(acc_dataset_full, lint)
acc_dataset_full <- merge(acc_dataset_full, mate)

write_csv(acc_dataset_full, "./acc_dataset_full.csv")

#to analyze data (non-normalized)
analyzeData <- data.frame(app = acc_dataset_full$app) 

# code elements

#perceivable
analyzeData$contentDescription <- acc_dataset_full$SRC_setContentDescription + acc_dataset_full$`XML_android:contentDescription`
analyzeData$addCaptioningChangeListener <- acc_dataset_full$SRC_addCaptioningChangeListener
analyzeData$getFontScale <- acc_dataset_full$SRC_getFontScale
analyzeData$getLocale <- acc_dataset_full$SRC_getLocale
analyzeData$getUserStyle <- acc_dataset_full$SRC_getUserStyle
analyzeData$isEnabled <- acc_dataset_full$SRC_isEnabled
analyzeData$removeCaptioningChangeListener <- acc_dataset_full$SRC_removeCaptioningChangeListener
analyzeData$screenOrientation <- acc_dataset_full$SRC_setScreenOrientation + acc_dataset_full$`XML_android:screenOrientation`
analyzeData$inputType <- acc_dataset_full$SRC_setInputType + acc_dataset_full$`XML_android:inputType`
analyzeData$inputMethod <- acc_dataset_full$`XML_android:inputMethod`
analyzeData$phoneNumber <- acc_dataset_full$`XML_android:phoneNumber`
analyzeData$password <- acc_dataset_full$`XML_android:password` + acc_dataset_full$SRC_setTransformationMethod
analyzeData$numeric <- acc_dataset_full$`XML_android:numeric`
analyzeData$digits <- acc_dataset_full$`XML_android:digits`
analyzeData$autoText <- acc_dataset_full$`XML_android:autoText` + acc_dataset_full$SRC_setAutoText
analyzeData$editable <- acc_dataset_full$`XML_android:editable` + acc_dataset_full$SRC_setEditable
analyzeData$background <- acc_dataset_full$`XML_android:background` + acc_dataset_full$SRC_setBackgroundColor
analyzeData$textColor <- acc_dataset_full$`XML_android:textColor` + acc_dataset_full$SRC_setTextColor
analyzeData$autoSizeTextType <- acc_dataset_full$`XML_android:autoSizeTextType` + acc_dataset_full$SRC_setAutoSizeTextTypeWithDefaults
analyzeData$textSize <- acc_dataset_full$`XML_android:textSize` + acc_dataset_full$SRC_setTextSize
analyzeData$textScaleX <- acc_dataset_full$`XML_android:textScaleX` + acc_dataset_full$SRC_setTextScaleX
analyzeData$autoSizeMaxTextSize <- acc_dataset_full$`XML_android:autoSizeMaxTextSize` + acc_dataset_full$SRC_setAutoSizeTextTypeUniformWithConfiguration
analyzeData$autoSizeMinTextSize <- acc_dataset_full$`XML_android:autoSizeMinTextSize` + acc_dataset_full$SRC_setAutoSizeTextTypeUniformWithConfiguration
analyzeData$autoSizePresetSizes <- acc_dataset_full$`XML_android:autoSizePresetSizes` + acc_dataset_full$SRC_setAutoSizeTextTypeUniformWithPresetSizes
analyzeData$lineSpacingMultiplier <- acc_dataset_full$`XML_android:lineSpacingMultiplier` + acc_dataset_full$SRC_setLineSpacing
analyzeData$lineSpacingExtra <- acc_dataset_full$`XML_android:lineSpacingExtra` + acc_dataset_full$SRC_setLineSpacing
analyzeData$letterSpacing <- acc_dataset_full$`XML_android:letterSpacing` + acc_dataset_full$SRC_setLetterSpacing

# operable
analyzeData$animateLayoutChanges <- acc_dataset_full$`XML_android:animateLayoutChanges` + acc_dataset_full$SRC_setLayoutTransition
analyzeData$nextFocusForward <- acc_dataset_full$`XML_android:nextFocusForward` + acc_dataset_full$SRC_setNextFocusForwardId
analyzeData$nextFocusUp <- acc_dataset_full$`XML_android:nextFocusUp` + acc_dataset_full$SRC_setNextFocusUpId
analyzeData$nextFocusDown <- acc_dataset_full$`XML_android:nextFocusDown` + acc_dataset_full$SRC_setNextFocusDownId
analyzeData$nextFocusLeft <- acc_dataset_full$`XML_android:nextFocusLeft` + acc_dataset_full$SRC_setNextFocusLeftId
analyzeData$nextFocusRight <- acc_dataset_full$`XML_android:nextFocusRight` + acc_dataset_full$SRC_setNextFocusRightId
analyzeData$accessibilityPaneTitle <- acc_dataset_full$`XML_android:accessibilityPaneTitle` + acc_dataset_full$SRC_setAccessibilityPaneTitle
analyzeData$accessibilityTraversalBefore <- acc_dataset_full$`XML_android:accessibilityTraversalBefore` + acc_dataset_full$SRC_setAccessibilityTraversalBefore
analyzeData$accessibilityTraversalAfter <- acc_dataset_full$`XML_android:accessibilityTraversalAfter` + acc_dataset_full$SRC_setAccessibilityTraversalAfter
analyzeData$accessibilityHeading <- acc_dataset_full$`XML_android:accessibilityHeading` + acc_dataset_full$SRC_setAccessibilityHeading
analyzeData$cursorVisible <- acc_dataset_full$`XML_android:cursorVisible` + acc_dataset_full$SRC_setCursorVisible
analyzeData$minWidth <- acc_dataset_full$`XML_androind:minWidth` + acc_dataset_full$SRC_setMinWidth
analyzeData$minHeight <- acc_dataset_full$`XML_androind:minHeight` + acc_dataset_full$SRC_setMinHeight

# understandable
analyzeData$screenReaderFocusable <- acc_dataset_full$`XML_androind:screenReaderFocusable` + acc_dataset_full$SRC_setScreenReaderFocusable
analyzeData$focusable <- acc_dataset_full$`XML_androind:focusable` + acc_dataset_full$SRC_setFocusable
analyzeData$hint <- acc_dataset_full$`XML_android:hint` + acc_dataset_full$SRC_setHint
analyzeData$labelFor <- acc_dataset_full$`XML_android:labelFor` + acc_dataset_full$SRC_setLabelFor

# robust
analyzeData$onInitializeAccessibilityNodeInfo <- acc_dataset_full$SRC_onInitializeAccessibilityNodeInfo
analyzeData$replaceAccessibilityAction <- acc_dataset_full$SRC_replaceAccessibilityAction
analyzeData$accessibilityLiveRegion <- acc_dataset_full$`XML_android:accessibilityLiveRegion` + acc_dataset_full$SRC_setAccessibilityLiveRegion
analyzeData$importantForAccessibility <- acc_dataset_full$`XML_android:importantForAccessibility` + acc_dataset_full$SRC_setImportantForAccessibility
analyzeData$hapticFeedbackEnabled <- acc_dataset_full$`XML_android:hapticFeedbackEnabled` + acc_dataset_full$SRC_setHapticFeedbackEnabled
analyzeData$sendAccessibilityEvent <- acc_dataset_full$SRC_sendAccessibilityEvent
analyzeData$sendAccessibilityEventUnchecked <- acc_dataset_full$SRC_sendAccessibilityEventUnchecked
analyzeData$dispatchPopulateAccessibilityEvent <- acc_dataset_full$SRC_dispatchPopulateAccessibilityEvent
analyzeData$onPopulateAccessibilityEvent <- acc_dataset_full$SRC_onPopulateAccessibilityEvent
analyzeData$onRequestSendAccessibilityEvent <- acc_dataset_full$SRC_onRequestSendAccessibilityEvent
analyzeData$onBindViewHolder <- acc_dataset_full$SRC_onBindViewHolder

# google play data

analyzeData['GP-score'] <- acc_dataset_full$score
analyzeData['GP-installs'] <- acc_dataset_full$installs

# composed metrics
# Sum of DIA code elements
# Sum of IIA code elements
# Sum of DIA and IIA code elements
# Sum of perceivable elements
# Sum of operable elements
# Sum of understandable elements
# Sum of robust elements

###############
#Issues

analyzeData['AL-GetContentDescriptionOverride'] <- acc_dataset_full$`AL-GetContentDescriptionOverride`
analyzeData['AL-ClickableViewAccessibility'] <- acc_dataset_full$`AL-ClickableViewAccessibility`
analyzeData['AL-ContentDescription'] <- acc_dataset_full$`AL-ContentDescription`  
analyzeData['AL-KeyboardInaccessibleWidget'] <- acc_dataset_full$`AL-KeyboardInaccessibleWidget`  
analyzeData['AL-LabelFor'] <- acc_dataset_full$`AL-LabelFor`  
analyzeData['AL-acc_issues'] <- acc_dataset_full$`AL-total_acc_issues`

analyzeData['M-NonTextContent'] <- acc_dataset_full$`M-NonTextContent`
analyzeData['M-IdentifyInputPurpose'] <- acc_dataset_full$`M-IdentifyInputPurpose`
analyzeData['M-ContrastMinimum'] <- acc_dataset_full$`M-ContrastMinimum`
analyzeData['M-TargetSize'] <- acc_dataset_full$`M-TargetSize`
analyzeData['M-DuplicateContentDescription'] <- acc_dataset_full$`M-DuplicateContentDescription`
analyzeData['M-Spacing'] <- acc_dataset_full$`M-Spacing`
analyzeData['M-Orientation'] <- acc_dataset_full$`M-Orientation`
analyzeData['M-PageTitled'] <- acc_dataset_full$`M-PageTitled`
analyzeData['M-acc_issues'] <- acc_dataset_full$`M-total_acc_issues`

# WCAG
analyzeData['W-perceivable_issues'] <- 
analyzeData['W-operable_issues'] <- 
analyzeData['W-understandable_issues'] <- 
analyzeData['W-robust_issues'] <- 

analyzeData$total_of_issues <- analyzeData$`AL-acc_issues` + analyzeData$`M-acc_issues`

write_csv(analyzeData, "./analyzeData-non-normalized.csv")

norm_by_loc <- analyzeData / acc_dataset_full$LINES_SRC
#fix columns that are not normalized
norm_by_loc$app <- analyzeData$app
norm_by_loc$`GP-score` <- analyzeData$`GP-score`
norm_by_loc$`GP-installs` <- analyzeData$`GP-installs`
write_csv(norm_by_loc, "./analyzeData-normalized-by-loc.csv")
