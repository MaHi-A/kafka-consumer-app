class WelcomeController < ActionController::Base
	before_action :initialize_kafka

	def show
		messages = []
		@kafka.each_message(topic: 'greetings') { |message| messages.push({ offset: message.offset, key: message.key, value: message.value }) }
		render json: messages
	end

	private

	def initialize_kafka
		@kafka = Kafka.new(['kafka:9092'])
	end	
end
