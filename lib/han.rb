# encoding=utf-8
require "han/version"

require 'thor'
require 'nokogiri'
require 'open-uri'
require 'net/http'

module Han
  class CLI < Thor::Group

    argument :character

    def process
      uri = URI(URI::encode("http://www.zdic.net/sousuo/?q=#{character}"))
      res = Net::HTTP.get_response(uri)

      doc = Nokogiri::HTML(open("http://www.zdic.net#{res['location']}"))

      lines = doc.css('p').to_a
      lines.shift
      char = lines.shift
      trad = traditional(lines)
      
      if trad
        say "#{char.content[2..-1]}#{trad}"
      else
        say "#{char.content[2..-1]}"
      end

      py = lines.shift
      say py.content.split[0]
      say
      lines.each { |l| say l.content[1..-1] if l.content[0] == '　' }
    end

    no_tasks do
      def traditional(lines)
        line = lines.shift
        matches = line.content.match(/^（.*）$/)
        if matches
          return line.content
        end

        lines.unshift(line)
        return nil
      end
    end

  end
end
