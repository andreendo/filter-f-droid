const { ensureDirSync, pathExists } = require('fs-extra');
const fsp = require('fs').promises;
const { DOMParser } = require('xmldom');
const R = require('ramda');

const dowloadFdroidXML = require('./lib/downloadFDroid');
const { isValid, elementsToArray, getGitHubProject } = require('./lib/xmlfilter');

const isAddedAfter2018AndUpdatedAfter2019 = isValid(R.__, 2018, 2019);

// main
(async () => {
    ensureDirSync('res');

    if (!await pathExists('res/f-droid.xml'))
        await dowloadFdroidXML();

    const document = new DOMParser().parseFromString(await fsp.readFile('res/f-droid.xml', 'utf-8'));
    const addedApps = elementsToArray(document.getElementsByTagName('application'))
        .filter(isAddedAfter2018AndUpdatedAfter2019)
        .map(getGitHubProject);

    console.log(addedApps.join('\n'));
})();
