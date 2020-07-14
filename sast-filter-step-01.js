/**
 * Step 1 - from f-droid, get projects that are:
 *   - added after 2000
 *   - last updated in 2019
 *   - has a github repo
 */
const fsp = require('fs').promises;
const { DOMParser } = require('xmldom');
const R = require('ramda');

const { isValid, elementsToArray, getGitHubProject } = require('./lib/xmlfilter');
const isOnline = require('./lib/isonline');

const isAddedAfter2000AndUpdatedAfter2019 = isValid(R.__, 2000, 2019);

(async () => {
    const document = new DOMParser().parseFromString(await fsp.readFile('res/f-droid.xml', 'utf-8'));
    const addedApps = elementsToArray(document.getElementsByTagName('application'))
        .filter(isAddedAfter2000AndUpdatedAfter2019)
        .map(getGitHubProject);

    for (const app of addedApps) {
        if (await isOnline('https://github.com/' + app))
            console.log(app);
    }
})();
