const fs = require('fs');
const page = require('./configurable-page');

var path = './test-cases';

loadTestCases(path);

function loadTestCases(path) {
    if(fs.isDirectory(path)) {
        var list = fs.list(path);
        for(index in list) {
            if(list[index] !== '.' && list[index] !== '..') {
                loadTestCases(path + "/" + list[index]);
            }
        }
    } else if (fs.isFile(path)) {
        // we have a file: load it
        var fileName = path.substring(path.lastIndexOf('/')+1, path.lastIndexOf('.'));
        // console.log(path, fileName);
        require(path)(page.new(fileName));
    }
}