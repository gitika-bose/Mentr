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
    def path_to(page_name, user = nil)
        page_name = page_name.match(/^(?:the\s)?(?:Mentre\s)?(.*?)\s?(?:page)?$/).captures[0]

        case page_name

        when /^home$/ then root_path
        when /^login$/ then new_user_session_path
        when /^user$/ then user_profile_path
        when /^sign\s(up|in)$/ then new_user_registration_path
        when /^catalog$/ then catalog_path
        when /^edit\sprofile$/ then edit_user_path(current_user)
        when /^become\smentor$/ then new_mentor_path
        when /^(update\smentor|edit\smentor\sprofile)$/ then edit_mentor_path(current_user)
        when /^edit\s(user)?\spassword$/ then edit_mentor_path(current_user)
        when /^delete\s(user|account)$/ then edit_mentor_path(current_user)

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
