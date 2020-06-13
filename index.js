const { ensureDirSync, pathExists } = require('fs-extra');
const fsp = require('fs').promises;
const download = require('download');
const { DOMParser } = require('xmldom');
const R = require('ramda');

const dowloadFdroidXML = async () => {
    console.log('start downloading f-droid.xml');
    await download('https://f-droid.org/repo/index.xml', 'res');
    await fsp.rename('res/index.xml', 'res/f-droid.xml');
}

const contentOfTag = R.curry(
    (xmlNode, tagName) => xmlNode.getElementsByTagName(tagName)[0].textContent
);
const contentOfSource = contentOfTag(R.__, 'source');
const contentOfAdded = contentOfTag(R.__, 'added');
const contentOfUpdated = contentOfTag(R.__, 'lastupdated');
const getGitHubProject = xmlNode => contentOfSource(xmlNode).replace('https://github.com/', '');

const elementsToArray = nodes => {
    const arr = [];
    for (let i = 0; i < nodes.length; i++)
        arr.push(nodes[i]);
    return arr;
};

const isValid = R.curry(
    (app, addedAfterYear, updatedAfterYear) => {
        if (!contentOfSource(app).includes('github.com'))
            return false;

        const addedDate = new Date(contentOfAdded(app));
        if (addedDate.getFullYear() < addedAfterYear)
            return false;

        const lastUpdatedDate = new Date(contentOfUpdated(app));
        if (lastUpdatedDate.getFullYear() < updatedAfterYear)
            return false;

        return true;
    }
);

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
