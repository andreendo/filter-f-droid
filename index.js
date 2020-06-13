const { ensureDirSync, pathExists } = require('fs-extra');
const fsp = require('fs').promises;
const download = require('download');
const { DOMParser } = require('xmldom');

const dowloadFdroidXML = async () => {
    console.log('start downloading f-droid.xml');
    await download('https://f-droid.org/repo/index.xml', 'res');
    await fsp.rename('res/index.xml', 'res/f-droid.xml');
}

const contentOfTag = (xmlNode, tagName) => xmlNode.getElementsByTagName(tagName)[0].textContent;

const getGitHubProject = xmlNode => contentOfTag(xmlNode, 'source').replace('https://github.com/', '');

const elementsToArray = nodes => {
    const arr = [];
    for (let i = 0; i < nodes.length; i++)
        arr.push(nodes[i]);
    return arr;
};

const isValid = app => {
    if (!contentOfTag(app, 'source').includes('github.com'))
        return false;

    //added date >= 2018
    const addedDate = new Date(contentOfTag(app, 'added'));
    if (addedDate.getFullYear() < 2018)
        return false;

    //updated date >= 2019
    const lastUpdatedDate = new Date(contentOfTag(app, 'lastupdated'));
    if (lastUpdatedDate.getFullYear() < 2019)
        return false;

    return true;
}

(async () => {
    ensureDirSync('res');

    if (!await pathExists('res/f-droid.xml'))
        await dowloadFdroidXML();

    const document = new DOMParser().parseFromString(await fsp.readFile('res/f-droid.xml', 'utf-8'));
    const addedApps = elementsToArray(document.getElementsByTagName('application'))
        .filter(isValid)
        .map(getGitHubProject);

    console.log(addedApps.join('\n'));
    console.log(addedApps.length);
})();
