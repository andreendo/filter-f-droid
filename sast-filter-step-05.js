/**
 * Step 5 - 
 */
const fs = require('fs');

const projects = JSON.parse(fs.readFileSync('./step4-projects.json', 'utf-8'));
projects.forEach(p => {
    console.log(p.GHProjectName);
});
// console.log(projects.length);

// fs.writeFileSync('./step4-projects.json', JSON.stringify(projs, null, 4));
