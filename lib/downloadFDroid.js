const fsp = require('fs').promises;
const download = require('download');

const dowloadFdroidXML = async () => {
    console.log('start downloading f-droid.xml');
    await download('https://f-droid.org/repo/index.xml', 'res');
    await fsp.rename('res/index.xml', 'res/f-droid.xml');
}

module.exports = dowloadFdroidXML;