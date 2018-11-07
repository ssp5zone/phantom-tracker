const webpage = require('webpage');
const fs = require('fs');

var path = '../out/';

const configuration = {
    userAgent: 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36',
    viewportSize: {
        width: 1280,
        height: 720
    }
};

const injectjQuery = function () {
    this.injectJs('./assets/javascript/jquery.min.js');
}

exports.new = function(name) {

    console.log("Creating a new page for:", name);
    

    var page = webpage.create();

    page.name = name;
    page.path = path.concat(name).concat('/');

    page.settings.userAgent = configuration.userAgent;
    page.viewportSize = configuration.viewportSize;

    page.injectjQuery = injectjQuery.bind(page);

    page.onError = page_error.bind(page);
    phantom.onError = page_error.bind(page);

    page.takeScreenshot = screenshot(page);
    page.log = write.bind(page);
    page.error = page_error.bind(page);

    clearFile(page);

    return page;
};

function clearFile(page) {
    fs.write(page.path.concat('output.txt'), '', 'w');
}

function write(msg) {
    fs.write(this.path.concat('output.txt'), msg.concat('\r\n'), 'a');
}

function page_error() {
    this.screenshot('error.png');
    fs.write(this.path.concat('output.txt'), 'ERROR', 'w');
}

function screenshot(page) {
    var screenshots = 0;
    return function(name) {
        page.render(page.path.concat(name || 'screenshot-'.concat(screenshots++)).concat('.png'));
    };
}