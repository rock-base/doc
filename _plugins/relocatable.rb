require 'pathname'
module Rock
    module Jekyll
        class Relocatable < Liquid::Tag
            def initialize(tag_name, text, tokens)
                super
                @text = text.strip
            end

            def render(context)
                page_url   = Pathname.new(context.environments.first['page']['url'])
                target_url = Pathname.new(context[@text] || @text)
                target_url.relative_path_from(page_url.dirname).to_s
            end
        end
    end
end
Liquid::Template.register_tag('relocatable', Rock::Jekyll::Relocatable)
