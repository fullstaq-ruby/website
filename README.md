# Fullstaq Ruby website

> For overarching Fullstaq Ruby issues, documents and other resources, or for other Fullstaq Ruby subprojects, please refer to the [fullstaq-ruby-project](https://github.com/fullstaq-labs/fullstaq-ruby-project) repo.

This repository contains [the Fullstaq Ruby website](https://fullstaqruby.org). It is a static site, built with [Middleman](https://middlemanapp.com/).

## Development

Middleman requires Ruby, so install that first.

Before developing, install the gem bundle:

    bundle install

Then spawn the Middleman server:

    bundle exec middleman s

Now the website will be accessible at http://127.0.0.1:4567.

## Publication

To publish the website, run:

    bundle exec rake build upload
