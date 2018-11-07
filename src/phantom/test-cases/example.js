var start = Date.now();
const address = 'http://example.com';

module.exports = function(page) {
    page.open(address, open.bind(page));
};

function open(status) {
    if (status !== 'success') {
        this.error();
        return;
    }

    var end = Date.now() - start;
    
    var title = this.evaluate(function () {
        return document.title;
    });
    
    if(title === "Example Domain") {
        this.log("Verified the page title.");
    } else {
        this.error();
        return;
    }

    this.takeScreenshot();
    this.log('The page took ' + end + ' ms to load.');
}
