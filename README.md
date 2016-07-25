
sebastianzillessen/datenwirken.de:  [![Build Status](https://travis-ci.org/sebastianzillessen/datenwirken.de.svg?branch=master)](https://travis-ci.org/sebastianzillessen/datenwirken.de)
okfde/datenwirken.de:  [![Build Status](https://travis-ci.org/okfde/datenwirken.de.svg?branch=master)](https://travis-ci.org/okfde/datenwirken.de)

This is the Open Data Impact Case Studies website.


## How to make changes:
- open the file you want to make changes on in github
- change it
- commit it
- wait until the TravisCI has done its build
- check that the new website is online and that your changes have been successful.


## Special files:
- `templates/_case-studies.html`: template for case studies.
- `templates/_base.html`: template for general side. Footers, Header, general structure of the overall webpage.
- `data/case-studies.yml`: Definition of the case studies. Here we can add new case studies to the system. The case study has to be located under `templates/case-<name in underscored way>.html`


## Requirements

* Python 2.7
* [pip and virtualenv](http://stackoverflow.com/q/4324558)
* [SASS](http://sass-lang.com/install) (Optional)

## Quick Start

```
virtualenv venv

# On Windows, replace the following line with 'venv\Scripts\activate'.
source venv/bin/activate

pip install -r requirements.txt
```

To develop the site, run `python build.py runserver` and visit
http://localhost:7000/. All static assets will be rebuilt as
you change them. However, if `sass` isn't on your command-line,
your SASS files won't be rebuilt.

The `site` directory will contain the generated website files.

## Deployment

To deploy the site, run `python build.py deploy #{origin}`.
Replace `#{origin}` with your git origin you want to push to.
This will only be done if the current branch is `master`.
