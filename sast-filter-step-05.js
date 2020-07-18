/**
 * Step 5 - 
 */
const fs = require('fs');
const parse = require('csv-parse/lib/sync');

const nativeApps = parse(fs.readFileSync('./lint-partial01.csv', 'utf-8'), {
    columns: true,
    delimiter: ',',
    skip_empty_lines: true
});

const jsonProjects = JSON.parse(fs.readFileSync('./step4-projects.json', 'utf-8'));

console.log('app,score,genre,installs,androidVersion');
nativeApps.forEach(app => {
    let ghProj = jsonProjects.find(el => el.GHProjectName.endsWith('/' + app.app));
    if (!ghProj) {
        ghProj = jsonProjects.find(el => el.altName && el.altName.endsWith(app.app));
    }
    // if (!ghProj.gplayData.scoreText)
    //     console.log(app)
    // genres.add(ghProj.gplayData.score);
    console.log(`${app.app},${ghProj.gplayData.score || 0},${ghProj.gplayData.genre},${ghProj.gplayData.maxInstalls},${ghProj.gplayData.androidVersion}`);
});

// console.log(nativeApps.length);
// console.log(genres);

//      .filter(el => el.gplayData.minInstalls >= 10000);

// projects.forEach(p => {
//     console.log(`${p.GHProjectName};${p.gplayData.minInstalls};${p.gplayData.maxInstalls};${p.gplayData.genre}`);
// });
// console.log(projects.length);

// fs.writeFileSync('./step4-projects.json', JSON.stringify(projs, null, 4));
