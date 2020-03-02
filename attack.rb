#!/usr/bin/env ruby

require 'rest-client'

def log_it(t,i,msg)
	puts "#{t.to_i}: Process ##{i} => #{msg}"
end

repeat = 300

Thread.abort_on_exception = true

repeat.times { |i|
	attack = Thread.new do
		randomizedEmail = "lindsay+#{rand(0..100000)}@hellodriven.com";
		log_it(Time.now,i,"Started")
		response = RestClient.post 'https://company477.hell4.com/join/o025eu', { params: {'first_name' => 'lindsay', 'last_name' => 'lt1', 'email' => randomizedEmail, 'confirm_email' => randomizedEmail, 'password' => '123123', 'password_confirmation' => '123123', 'read_terms' => '1'}}

		log_it(Time.now,i,"Response Code: #{response.code} - with email: #{randomizedEmail}")
		sleep 1
		log_it(Time.now,i,"Done")

	end
}
sleep 10
puts "#{Time.now.to_i} Done"

