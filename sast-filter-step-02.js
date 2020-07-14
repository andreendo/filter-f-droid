/**
 * Step 2 - remove duplicates, retrieve package IDs
 */
const parse = require('csv-parse/lib/sync');
const fs = require('fs');
const { DOMParser } = require('xmldom');
const { contentOfSource, contentOfID, elementsToArray } = require('./lib/xmlfilter');

const document = new DOMParser().parseFromString(fs.readFileSync('res/f-droid.xml', 'utf-8'));
const addedApps = elementsToArray(document.getElementsByTagName('application'));

const findPackage = (ghProjectName) => {
    const xmlElem = addedApps.find(appElem => contentOfSource(appElem).startsWith('https://github.com/' + ghProjectName));
    if (xmlElem) return contentOfID(xmlElem);
    return 'ERROR';
}


const records = parse(fs.readFileSync('./step1-projects.csv', 'utf-8'), {
    columns: false,
    delimiter: ',',
    skip_empty_lines: true
});

const rec = records.map(e => ({ GHProjectName: e[0], packageID: findPackage(e[0]) }));

console.log(rec);
console.log(rec.length);

fs.writeFileSync('./step2-projects.json', JSON.stringify(rec, null, 4));