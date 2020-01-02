# Podium Challenge

---

&nbsp;

### My approach to the problem

Hey, this was a tough one. I knew what scrapping is all about, but I had never done it before. :sweat_smile:

I had no idea of how to classify those "overly positive endorsements", I mean, based in what criteria. So, what I did was read the whole reviews section of DealerRater [support documentation](https://dealerrater.uservoice.com/knowledgebase/topics/28141-reviews), and try to find a few patterns. I even created an account at DealerRater site, in order to play around and try to understand how the rating system works.
But unfortunately it didn't add much.

So, here is what I decided by poking around, A.K.A "my kinda desperate criteria". :smile:

##### My attention points to an "overly excited review":

1. Reviews with (5) five stars on Overall Dealership and Overall Experience. Because I think people(employees) are more about to create fake accounts to raise their own score over lower it.
2. Reviews without image attached. For those I would say they're more likely to be an "overly excited review", because, it is unlikely that they(employees) would be creating fake reviews with images of the customers attached.
3. Inconsistent review ratings. By poking around, I found a few reviews where they rated 5 stars for "Customer Service", 0 stars for "Quality of Work", 5 stars for "Friendliness", 0 stars for "Pricing" and the "Overall Experience" rated as 5 stars. This is kind a good candidate for an "overly excited review".
   And more, I don't know how the DealerRater platform works, but based in what I saw in their platform, you can only rate Customer Service, Quality of Work, Friendliness and Pricing. And I presumed that they calculate the Overall Experience based on these 4. But there are Overall Experience rated with 5 stars, when none of those 4 were rated.

### Requirements

1. [Ruby 2.6.x](https://www.ruby-lang.org).
2. [Watir](https://github.com/watir/watir): I used this one to help me scrape dynamic site. I tried to go with Mechanize, which seems to be easy when navigating HTML nodes, but it do not have support for scraping dynamic sites.
3. [Webdrivers](https://github.com/titusfortner/webdrivers): I used this one, in order to have chromedriver for selenium, which is used by Watir.
4. [Nokogiri](https://github.com/sparklemotion/nokogiri): I used this one to parse reviews content and I believe it's the best we have when it comes to parse XML/HTML.
5. [RSpec](https://github.com/rspec/rspec): I used this one to write tests, just because I prefer it over MiniTest or Test:Unit.
6. [pry-byebug](https://github.com/deivid-rodriguez/pry-byebug): I used this one to let bugs go in peace.

### Setup

Type the following to install gems locally:

    bundle install

If you are running on linux, maybe you will need to give exec permissions to these **_bin/_** files.
From the root directory, you can type the following:

    chmod 755 bin/*

### Usage

Type the following to run the tests:

    bin/test

Type the following to run the script and print the **Overly Excited Reviews** to the console:

    bin/scrape

&nbsp;
And, Like Dave Thomas said:

> Perfection is the enemy of progress.

&nbsp;
&nbsp;
Just for today folks.
