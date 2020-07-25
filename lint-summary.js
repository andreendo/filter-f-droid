const fse = require('fs-extra');
const path = require('path');
const { DOMParser } = require('xmldom');
const { elementsToArray } = require('./lib/xmlfilter');

const BENCHMARK_FOLDER = '/home/sanji/bench-android/accessibility-study/projects';

// categories from http://tools.android.com/tips/lint-checks
// GetContentDescriptionOverride, ClickableViewAccessibility, ContentDescription, KeyboardInaccessibleWidget, LabelFor

console.log('app,AL-TotalOfIssues,AL-TotalOfAccessibilityIssues,AL-GetContentDescriptionOverride,AL-ClickableViewAccessibility,AL-ContentDescription,AL-KeyboardInaccessibleWidget,AL-LabelFor');

fse.readdirSync(BENCHMARK_FOLDER).forEach((projDir) => {
    const lintXMLfile = path.join(BENCHMARK_FOLDER, projDir, 'lint_report/lint-results.xml');
    if (!fse.existsSync(lintXMLfile)) {
        console.log('Error');
        process.exit();
    }
    const res = [];
    res.push(projDir);
    const xmldoc = new DOMParser().parseFromString(fse.readFileSync(lintXMLfile, 'utf-8'));
    const issues = elementsToArray(xmldoc.getElementsByTagName('issue'));
    res.push(issues.length);

    const accIssueTypeMap = new Map();
    accIssueTypeMap.set('GetContentDescriptionOverride', 0);
    accIssueTypeMap.set('ClickableViewAccessibility', 0);
    accIssueTypeMap.set('ContentDescription', 0);
    accIssueTypeMap.set('KeyboardInaccessibleWidget', 0);
    accIssueTypeMap.set('LabelFor', 0);
    let accessibilityIssues = 0;
    
    issues.forEach(i => {
        if (i.getAttribute('category') === 'Accessibility') {
            accessibilityIssues++;
            accIssueTypeMap.set(i.getAttribute('id'), accIssueTypeMap.get(i.getAttribute('id')) + 1);
        }
    });
    res.push(accessibilityIssues);
    res.push(accIssueTypeMap.get('GetContentDescriptionOverride'));
    res.push(accIssueTypeMap.get('ClickableViewAccessibility'));
    res.push(accIssueTypeMap.get('ContentDescription'));
    res.push(accIssueTypeMap.get('KeyboardInaccessibleWidget'));
    res.push(accIssueTypeMap.get('LabelFor'));

    console.log(res.join(','));
});