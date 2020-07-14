/**
 * Step 4 - Remove the projects without Google Play data
 */
const fs = require('fs');

const projects = JSON.parse(fs.readFileSync('./step3-projects.json', 'utf-8'));
const projs = projects.filter(el => el.gplayData !== 'ERROR');
console.log(projects.length);
console.log(projs.length);
fs.writeFileSync('./step4-projects.json', JSON.stringify(projs, null, 4));
