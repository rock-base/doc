module Rock
    module Jekyll
        class Breadcrumbs < Liquid::Tag
            def render(context)
                page_url = Pathname.new(context.environments.first['page']['url'])
                target_url = page_url.dirname

                links = []
                while target_url.to_s != "/"
                    relative_url = target_url.relative_path_from(page_url.dirname).to_s
                    links << "<li><a href=\"#{relative_url}/index.html\">#{target_url.basename}</a>"
                    target_url = target_url.dirname
                end
                links.reverse.join("")
            end
        end
    end
end
Liquid::Template.register_tag('breadcrumbs', Rock::Jekyll::Breadcrumbs)

