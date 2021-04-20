# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
    # Maps a name to a path. Used by the
    #
    #   When /^I go to (.+)$/ do |page_name|
    #
    # step definition in web_steps.rb
    #
    def path_to(page_name)
        case page_name

        when /^(the )?(Mentre )?home\s?(page)?$/ then root_path
        when /^(the )?(Mentre )?login\s?(page)?$/ then new_user_session_path
        when /^(the )?(Mentre )?user\s?(page)?$/ then user_profile_path(User.find_by_username("bob"))
        when /^(the )?(Mentre )?catalog\s?(page)?$/ then '/catalog'
        when /^(the )?(Mentre )?edit\sprofile\s?(page)?$/ then '/users/edit'
        when /^(the )?(Mentre )?become\smentor\s?(page)?$/ then '/mentors/new'
        when /^(the )?(Mentre )?update\smentor\s?(page)?$/ then '/mentors/edit'

        # Add more mappings here.
        # Here is an example that pulls values out of the Regexp:
        #
        #   when /^(.*)'s profile page$/i
        #     user_profile_path(User.find_by_login($1))

        else
          begin
            page_name =~ /^the (.*) page$/
            path_components = $1.split(/\s+/)
            self.send(path_components.push('path').join('_').to_sym)
          rescue NoMethodError, ArgumentError
            raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
              "Now, go and add a mapping in #{__FILE__}"
          end
        end
    end
  end

  World(NavigationHelpers)
