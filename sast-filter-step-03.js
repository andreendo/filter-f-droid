/**
 * Step 3 - collect Google Play data
 */
const fs = require('fs');
const gplay = require('google-play-scraper');
const { delay } = require('bluebird');

const projects = JSON.parse(fs.readFileSync('./step2-projects.json', 'utf-8'));
// const projects = [
//     projs[0],
//     projs[1],
//     {
//         GHProjectName: 'tkrajina/10000sentences222',
//         packageID: 'info.puzz.a10000sentences222'
//     }
// ];

(async () => {
    console.log('[');
    for (let proj of projects) {
        // console.log(proj);
        let gplayData;
        try {
            gplayData = await gplay.app({ appId: proj.packageID });
        } catch(err) {
            gplayData = 'ERROR';
        }
        await delay(10000);
        proj.gplayData = gplayData;
        console.log(JSON.stringify(proj, null, 4));
        console.log(',');
    }
    console.log(']');
    fs.writeFileSync('./step3-projects.json', JSON.stringify(projects, null, 4));
})();

