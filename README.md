# Phantom Tracker

A PhantomJS based Website status tracker.

The program that runs in background emulating a user and tests the functionality of a Website in real time. It takes screenshots of the said test cases and mails them.

The program can be scheduled to run at regular intervals.

![](/docs/demo.png)

## Usage

For every website you wish to test, add a new file in `src/test-cases` folder. Thats it!!

### Build

1. Clone or Download the repo.
2. Download the the lastest version of [Phantom.js](http://phantomjs.org/download.html) as per your OS.
3. Unzip the above and drop main phantomjs file in `src/phantom/` folder.

### Run

1. Add desired recipients in the _To:_ section of mailer files.
2. You can manually run the `main.sh` file or schedule it as cron or autosys job.
3. To run on Windows or OSX you could write your own version of **main.sh**.

## To Do
1. Attach loggers with mail.
