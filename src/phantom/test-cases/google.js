var start = Date.now();
const address = 'http://google.com';

module.exports = function(page) {
    page.onLoadFinished = performAction(page);
    page.open(address, open.bind(page));    
};

function performAction(page) {
    var count = 0;
    return function(status) {
        console.log('count', count);        
        switch(count++) {
            case 0: verifyLoad(page); break;
            case 1: verifyQuery(page); break;
        }
    };
}

function verifyLoad(page) {
    page.injectjQuery();
    page.evaluate(function(){
        $("input[name='q']").val("Nicolas Cage");
    });
    page.log("Load Sucessfull.");
    page.evaluate(function(){
        $("input[name='btnK']").click();
    });
}

function verifyQuery(page) {
    page.injectjQuery();
    var nav = page.evaluate(function() {
        return $("#top_nav").length 
    });
    if(nav > 0) {
        page.log("Successfully queried.");    
        page.takeScreenshot();
    } else {
        page.error();
    }
    phantom.exit();
}

function open(status) {
    if (status !== 'success') {
        this.error();
        return;
    }

    var end = Date.now() - start;
    
    var title = this.evaluate(function () {
        return document.title;
    });
    
    if(title === "Google") {
        this.log("Verified the page title.");
    } else {
        this.error();
        return;
    }

    this.takeScreenshot();
    this.log('The page took ' + end + ' ms to load.');
}
