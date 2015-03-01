# domain-search
A Domain Name Suggester

Domain Search is a collaborative web app that allows visitors to contribute to a list of valuable domain names by providing words/phrases to a query which will suggest domain names based on Google's autocorrect/suggest services. These suggested domain names will then be looked up via Whosis to retrieve registration availibility status. The list is collaboratively grown and can be seen by visitors of the website.

bundle install
bin/rake routes
bin/rake db:migrate
bin/server
