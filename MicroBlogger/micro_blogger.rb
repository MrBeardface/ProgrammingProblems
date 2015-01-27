require 'jumpstart_auth'
require 'bitly'

Bitly.use_api_version_3

class MicroBlogger
	attr_reader :client

	def initialize
		puts "Initializing MicroBlogger"
		@client = JumpstartAuth.twitter
	end

	def tweet(message)
		if message.length > 140
			puts "Your message is too long"
		else
			@client.update(message)
		end
	end

	def run
		puts "Welcome to the JSL Twitter Client!"
		command = ""
		puts "These are the commands you can run: "
		puts "q - quit, t message - put t then your message, dm user message - direct message"
		puts "spam message - spam your followers, elt - find followers last tweets, s original_url - shorten url, turl - tweet with url"
		while command != "q"
			printf "enter command: "
			input = gets.chomp
			parts = input.split(" ")
			command = parts[0]
			message = parts[1..-1].join(" ")
			case command
			when "q" then puts "Goodbye!"
			when "t" then tweet(message)
			when "dm" then dm(parts[1], parts[2..-1].join(" "))
			when "spam" then spam_my_followers(message)
			when "elt" then last_tweet
			when "s" then shorten(parts[1..-1].join)
			when "turl" then tweet(parts[1..-2].join(" ") + " " + shorten(parts[-1]))
			else
				puts "Sorry, I don't know that #{command}"
			end
		end
	end

	def dm(target, message)
		puts "Trying to send @#{target} this message:"
		puts message
		message = "d @#{target} #{message}"
		screen_names = @client.followers.collect { |follower| @client.user(follower).screen_name }
		if screen_names.include?(target)
			tweet(message)
		else
			puts "Please follow #{target} to send them a tweet."
		end
	end

	def followers_list
		followers = []
		@client.followers.each do |follower|
			followers << @client.user(follower).screen_name
		end
		followers
	end

	def find_friends
		friends = []
		@client.friends.each do |friend|
			friends << @client.user(friend).screen_name
		end
		friends
	end

	def find_all_friends
		friends = []
		@client.friends.each do |friend|
			friends << @client.user(friend)
		end
		friends
	end

	def last_tweet
    friends_tweets = @client.friends
    friends = friends_tweets.sort_by { |friend| @client.user(friend).screen_name.downcase }
    friends.each do |friend|
      timestamp = @client.user(friend).status.created_at
      puts "#{@client.user(friend).screen_name.upcase} (#{timestamp.strftime("%b %d")}): #{@client.user(friend).status.text}"
    end
  end

	def shorten(original_url)
		bitly = Bitly.new('hungryacademy', 'R_430e9f62250186d2612cca76eee2dbc6')
		puts "Shortening this URL: #{original_url}"
		url = bitly.shorten(original_url).short_url
	end

	def spam_my_followers(message)
		if followers_list.length == 0
			puts "No one in there to spam, sorry."
		else
			followers_list
			@client.followers.each do |follower|
				dm(follower, message)
			end
		end
	end
	
	def find_user(follower)
		@client.user(follower)
	end
end

blogger = MicroBlogger.new
blogger.run