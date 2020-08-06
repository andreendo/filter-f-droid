library(readr)

profmapp <- read_csv("./prof-mapp.csv")
colnames(profmapp)[1] <- "app"

gplaydata <- read_csv("./gplaydata.csv")
gplaydata$app <- tolower(gplaydata$app)

lint <- read_csv("./lint.csv")
lint$app <- tolower(lint$app)

####TODO FIX COLUMNS ORDER AND ADD USE 0F COLOR
mate <- read_csv("./mate-max.csv")
colnames(mate)[1] <- "app"
mate$app <- tolower(mate$app)
colnames(mate)[6] <- "M-total_acc_issues"
colnames(mate)[9] <- "M-NonTextContent"
colnames(mate)[10] <- "M-LabelOrInstructions"
colnames(mate)[11] <- "M-IdentifyInputPurpose"
colnames(mate)[12] <- "M-ContrastMinimum"
colnames(mate)[13] <- "M-TargetSize"
colnames(mate)[14] <- "M-DuplicateContentDescription"
colnames(mate)[15] <- "M-Spacing"
colnames(mate)[16] <- "M-UseOfColor"
colnames(mate)[17] <- "M-Orientation"
colnames(mate)[18] <- "M-PageTitled"

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
analyzeData$screenReaderFocusable <- acc_dataset_full$`XML_androind:screenReaderFocusable` + acc_dataset_full$SRC_setScreenReaderFocusable
analyzeData$focusable <- acc_dataset_full$`XML_androind:focusable` + acc_dataset_full$SRC_setFocusable

# understandable
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
analyzeData['CM-SumDIACodeElements'] <- analyzeData$contentDescription + analyzeData$addCaptioningChangeListener + analyzeData$getFontScale + analyzeData$getLocale + analyzeData$screenOrientation + analyzeData$inputType + analyzeData$phoneNumber + analyzeData$password + analyzeData$numeric + analyzeData$digits + analyzeData$autoText + analyzeData$autoSizeTextType + analyzeData$textSize + analyzeData$textScaleX + analyzeData$autoSizeMaxTextSize + analyzeData$autoSizeMinTextSize + analyzeData$autoSizePresetSizes
analyzeData['CM-SumDIACodeElements'] <- analyzeData['CM-SumDIACodeElements'] + analyzeData$lineSpacingMultiplier + analyzeData$lineSpacingExtra + analyzeData$letterSpacing + analyzeData$nextFocusForward + analyzeData$nextFocusUp + analyzeData$nextFocusDown + analyzeData$nextFocusLeft + analyzeData$nextFocusRight + analyzeData$accessibilityPaneTitle + analyzeData$accessibilityTraversalBefore + analyzeData$accessibilityTraversalAfter + analyzeData$accessibilityHeading + analyzeData$cursorVisible + analyzeData$minWidth
analyzeData['CM-SumDIACodeElements'] <- analyzeData['CM-SumDIACodeElements'] + analyzeData$minHeight + analyzeData$screenReaderFocusable + analyzeData$hint + analyzeData$labelFor + analyzeData$onInitializeAccessibilityNodeInfo + analyzeData$replaceAccessibilityAction + analyzeData$accessibilityLiveRegion + analyzeData$importantForAccessibility + analyzeData$hapticFeedbackEnabled + analyzeData$sendAccessibilityEvent + analyzeData$sendAccessibilityEventUnchecked + analyzeData$dispatchPopulateAccessibilityEvent + analyzeData$onPopulateAccessibilityEvent + analyzeData$onRequestSendAccessibilityEvent

analyzeData['CM-IndexDIACodeElements'] <- as.integer(analyzeData$contentDescription > 0) + as.integer(analyzeData$addCaptioningChangeListener > 0) + as.integer(analyzeData$getFontScale > 0) + as.integer(analyzeData$getLocale > 0) + as.integer(analyzeData$screenOrientation > 0) + as.integer(analyzeData$inputType > 0) + as.integer(analyzeData$phoneNumber > 0) + as.integer(analyzeData$password > 0) + as.integer(analyzeData$numeric > 0) + as.integer(analyzeData$digits > 0) + as.integer(analyzeData$autoText > 0) + as.integer(analyzeData$autoSizeTextType > 0) + as.integer(analyzeData$textSize > 0) + as.integer(analyzeData$textScaleX > 0) + as.integer(analyzeData$autoSizeMaxTextSize > 0) + as.integer(analyzeData$autoSizeMinTextSize > 0) + as.integer(analyzeData$autoSizePresetSizes > 0)
analyzeData['CM-IndexDIACodeElements'] <- analyzeData['CM-IndexDIACodeElements'] + as.integer(analyzeData$lineSpacingMultiplier > 0) + as.integer(analyzeData$lineSpacingExtra > 0) + as.integer(analyzeData$letterSpacing > 0) + as.integer(analyzeData$nextFocusForward > 0) + as.integer(analyzeData$nextFocusUp > 0) + as.integer(analyzeData$nextFocusDown > 0) + as.integer(analyzeData$nextFocusLeft > 0) + as.integer(analyzeData$nextFocusRight > 0) + as.integer(analyzeData$accessibilityPaneTitle > 0) + as.integer(analyzeData$accessibilityTraversalBefore > 0) + as.integer(analyzeData$accessibilityTraversalAfter > 0) + as.integer(analyzeData$accessibilityHeading > 0) + as.integer(analyzeData$cursorVisible > 0) + as.integer(analyzeData$minWidth > 0)
analyzeData['CM-IndexDIACodeElements'] <- analyzeData['CM-IndexDIACodeElements'] + as.integer(analyzeData$minHeight > 0) + as.integer(analyzeData$screenReaderFocusable > 0) + as.integer(analyzeData$hint > 0) + as.integer(analyzeData$labelFor > 0) + as.integer(analyzeData$onInitializeAccessibilityNodeInfo > 0) + as.integer(analyzeData$replaceAccessibilityAction > 0) + as.integer(analyzeData$accessibilityLiveRegion > 0) + as.integer(analyzeData$importantForAccessibility > 0) + as.integer(analyzeData$hapticFeedbackEnabled > 0) + as.integer(analyzeData$sendAccessibilityEvent > 0) + as.integer(analyzeData$sendAccessibilityEventUnchecked > 0) + as.integer(analyzeData$dispatchPopulateAccessibilityEvent > 0) + as.integer(analyzeData$onPopulateAccessibilityEvent > 0) + as.integer(analyzeData$onRequestSendAccessibilityEvent > 0)


# Sum of IIA code elements
analyzeData['CM-SumIIACodeElements'] <- + analyzeData$getUserStyle + analyzeData$isEnabled + analyzeData$removeCaptioningChangeListener + analyzeData$inputMethod + analyzeData$editable + analyzeData$background + analyzeData$textColor + analyzeData$animateLayoutChanges + analyzeData$focusable + analyzeData$onBindViewHolder

analyzeData['CM-IndexIIACodeElements'] <- + as.integer(analyzeData$getUserStyle > 0) + as.integer(analyzeData$isEnabled > 0) + as.integer(analyzeData$removeCaptioningChangeListener > 0) + as.integer(analyzeData$inputMethod > 0) + as.integer(analyzeData$editable > 0) + as.integer(analyzeData$background > 0) + as.integer(analyzeData$textColor > 0) + as.integer(analyzeData$animateLayoutChanges > 0) + as.integer(analyzeData$focusable > 0) + as.integer(analyzeData$onBindViewHolder > 0)

# # Sum of DIA and IIA code elements
analyzeData['CM-SumAllCodeElements'] <- analyzeData$`CM-SumDIACodeElements` + analyzeData$`CM-SumIIACodeElements`

analyzeData['CM-IndexAllCodeElements'] <- analyzeData$`CM-IndexDIACodeElements` + analyzeData$`CM-IndexIIACodeElements`

# # Sum of perceivable elements
analyzeData['CM-SumPerceivableCodeElements'] <- analyzeData$contentDescription + analyzeData$addCaptioningChangeListener + analyzeData$getFontScale + analyzeData$getLocale + analyzeData$screenOrientation + analyzeData$inputType + analyzeData$phoneNumber + analyzeData$password + analyzeData$numeric + analyzeData$digits + analyzeData$autoText + analyzeData$autoSizeTextType + analyzeData$textSize + analyzeData$textScaleX + analyzeData$autoSizeMaxTextSize + analyzeData$autoSizeMinTextSize + analyzeData$autoSizePresetSizes
analyzeData['CM-SumPerceivableCodeElements'] <- analyzeData['CM-SumPerceivableCodeElements'] + analyzeData$lineSpacingMultiplier + analyzeData$lineSpacingExtra + analyzeData$letterSpacing + analyzeData$getUserStyle + analyzeData$isEnabled + analyzeData$removeCaptioningChangeListener + analyzeData$inputMethod + analyzeData$editable + analyzeData$background + analyzeData$textColor
# # Sum of operable elements
analyzeData['CM-SumOperableCodeElements'] <- analyzeData$nextFocusForward + analyzeData$nextFocusUp + analyzeData$nextFocusDown + analyzeData$nextFocusLeft + analyzeData$nextFocusRight + analyzeData$accessibilityPaneTitle + analyzeData$accessibilityTraversalBefore + analyzeData$accessibilityTraversalAfter + analyzeData$accessibilityHeading + analyzeData$cursorVisible + analyzeData$minWidth + analyzeData$minHeight   
analyzeData['CM-SumOperableCodeElements'] <- analyzeData['CM-SumOperableCodeElements'] + analyzeData$animateLayoutChanges + analyzeData$screenReaderFocusable + analyzeData$focusable
# # Sum of understandable elements
analyzeData['CM-SumUnderstandableCodeElements'] <- analyzeData$hint + analyzeData$labelFor
# # Sum of robust elements
analyzeData['CM-SumRobustCodeElements'] <- analyzeData$onInitializeAccessibilityNodeInfo + analyzeData$replaceAccessibilityAction + analyzeData$accessibilityLiveRegion + analyzeData$importantForAccessibility + analyzeData$hapticFeedbackEnabled + analyzeData$sendAccessibilityEvent + analyzeData$sendAccessibilityEventUnchecked + analyzeData$dispatchPopulateAccessibilityEvent + analyzeData$onPopulateAccessibilityEvent + analyzeData$onRequestSendAccessibilityEvent + analyzeData$onBindViewHolder

###############
#Issues

analyzeData['AL-GetContentDescriptionOverride'] <- acc_dataset_full$`AL-GetContentDescriptionOverride`
analyzeData['AL-ClickableViewAccessibility'] <- acc_dataset_full$`AL-ClickableViewAccessibility`
analyzeData['AL-ContentDescription'] <- acc_dataset_full$`AL-ContentDescription`  
analyzeData['AL-KeyboardInaccessibleWidget'] <- acc_dataset_full$`AL-KeyboardInaccessibleWidget`  
analyzeData['AL-LabelFor'] <- acc_dataset_full$`AL-LabelFor`  
analyzeData['AL-acc_issues'] <- acc_dataset_full$`AL-total_acc_issues`

analyzeData['M-NonTextContent'] <- acc_dataset_full$`M-NonTextContent`
analyzeData['M-LabelOrInstructions'] <- acc_dataset_full$`M-LabelOrInstructions`
analyzeData['M-IdentifyInputPurpose'] <- acc_dataset_full$`M-IdentifyInputPurpose`
analyzeData['M-ContrastMinimum'] <- acc_dataset_full$`M-ContrastMinimum`
analyzeData['M-TargetSize'] <- acc_dataset_full$`M-TargetSize`
analyzeData['M-DuplicateContentDescription'] <- acc_dataset_full$`M-DuplicateContentDescription`
analyzeData['M-Spacing'] <- acc_dataset_full$`M-Spacing`
analyzeData['M-Orientation'] <- acc_dataset_full$`M-Orientation`
analyzeData['M-PageTitled'] <- acc_dataset_full$`M-PageTitled`
analyzeData['M-acc_issues'] <- acc_dataset_full$`M-total_acc_issues`

# WCAG
analyzeData['W-perceivable_issues'] <- analyzeData$`AL-GetContentDescriptionOverride` + analyzeData$`AL-ContentDescription` + analyzeData$`M-NonTextContent` + analyzeData$`M-IdentifyInputPurpose` + analyzeData$`M-ContrastMinimum` + analyzeData$`M-Orientation` + analyzeData$`M-DuplicateContentDescription`
analyzeData['W-operable_issues'] <- analyzeData$`M-TargetSize` + analyzeData$`M-PageTitled` + analyzeData$`AL-KeyboardInaccessibleWidget` + analyzeData$`M-Spacing`
analyzeData['W-understandable_issues'] <- analyzeData$`AL-LabelFor` + analyzeData$`M-LabelOrInstructions`
analyzeData['W-robust_issues'] <- analyzeData$`AL-ClickableViewAccessibility`

analyzeData$total_of_issues <- analyzeData$`AL-acc_issues` + analyzeData$`M-acc_issues`

write_csv(analyzeData, "./analyzeData-non-normalized.csv")

norm_by_loc <- analyzeData / acc_dataset_full$LINES_SRC
#fix columns that are not normalized
norm_by_loc$app <- analyzeData$app
norm_by_loc$`GP-score` <- analyzeData$`GP-score`
norm_by_loc$`GP-installs` <- analyzeData$`GP-installs`
norm_by_loc$`CM-IndexDIACodeElements` <- analyzeData$`CM-IndexDIACodeElements`
norm_by_loc$`CM-IndexIIACodeElements` <- analyzeData$`CM-IndexIIACodeElements`
norm_by_loc$`CM-IndexAllCodeElements` <- analyzeData$`CM-IndexAllCodeElements`
write_csv(norm_by_loc, "./analyzeData-normalized-by-loc.csv")

# plot(norm_by_loc$`CM-IndexDIACodeElements`, norm_by_loc$`M-acc_issues`, log = 'xy')
# cor.test(norm_by_loc$`CM-IndexDIACodeElements`, norm_by_loc$`M-acc_issues`, method = "spearman")
# 
# plot(norm_by_loc$`CM-IndexDIACodeElements`, norm_by_loc$total_of_issues, log = 'xy')
# cor.test(norm_by_loc$`CM-IndexDIACodeElements`, norm_by_loc$total_of_issues, method = "spearman")
# 
# plot(norm_by_loc$`CM-IndexIIACodeElements`, norm_by_loc$total_of_issues, log = 'y')
# cor.test(norm_by_loc$`CM-IndexIIACodeElements`, norm_by_loc$total_of_issues, method = "spearman")
# 
# plot(norm_by_loc$`CM-SumAllCodeElements`, norm_by_loc$total_of_issues, log = 'xy')
# cor.test(norm_by_loc$`CM-SumAllCodeElements`, norm_by_loc$total_of_issues, method = "spearman")

# most significant
plot(norm_by_loc$`CM-IndexAllCodeElements`, norm_by_loc$total_of_issues, log = 'xy')
cor.test(norm_by_loc$`CM-IndexAllCodeElements`, norm_by_loc$total_of_issues, method = "spearman")

plot(analyzeData$`CM-IndexAllCodeElements`, analyzeData$total_of_issues, log = 'xy')
cor.test(analyzeData$`CM-IndexAllCodeElements`, analyzeData$total_of_issues, method = "spearman")

# to add in the paper
summary(analyzeData$`CM-IndexAllCodeElements`)
boxplot(analyzeData$`CM-IndexAllCodeElements`)

sum(analyzeData$`CM-IndexAllCodeElements` > 10)

par(mfrow = c(1, 6))
boxplot(norm_by_loc$total_of_issues, ylim = c(0, 0.04))
#boxplot(norm_by_loc[norm_by_loc$`CM-IndexAllCodeElements` <= 7,]$total_of_issues, ylim = c(0, 0.1))
boxplot(norm_by_loc[norm_by_loc$`CM-IndexAllCodeElements` > 6,]$total_of_issues, ylim = c(0, 0.04))
boxplot(norm_by_loc[norm_by_loc$`CM-IndexAllCodeElements` > 7,]$total_of_issues, ylim = c(0, 0.04))
boxplot(norm_by_loc[norm_by_loc$`CM-IndexAllCodeElements` > 8,]$total_of_issues, ylim = c(0, 0.04))
boxplot(norm_by_loc[norm_by_loc$`CM-IndexAllCodeElements` > 9,]$total_of_issues, ylim = c(0, 0.04))
boxplot(norm_by_loc[norm_by_loc$`CM-IndexAllCodeElements` > 10,]$total_of_issues, ylim = c(0, 0.04))
