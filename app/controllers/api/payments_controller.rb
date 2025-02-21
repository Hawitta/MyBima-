class Api::PaymentsController < ApplicationController
    def create_payment
        amount = params[:amount]
    
        uri = URI.parse('https://4d95-41-90-184-64.ngrok-free.app/create-payment') # Flask API
        request = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
        request.body = { amount: amount }.to_json
    
        response = Net::HTTP.start(uri.hostname, uri.port) { |http| http.request(request) }
        render json: JSON.parse(response.body)
      end
    
      def execute_payment
        payment_id = params[:payment_id]
        payer_id = params[:payer_id]
      
        uri = URI.parse('https://4d95-41-90-184-64.ngrok-free.app/execute-payment')
        request = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
        request.body = { payment_id: payment_id, payer_id: payer_id }.to_json
      
        response = Net::HTTP.start(uri.hostname, uri.port) { |http| http.request(request) }
        render json: JSON.parse(response.body)
    
        if response.is_a?(Net::HTTPSuccess)
            render json: { status: json_response["status"], message: json_response["message"] }, status: :ok
          else
            render json: { status: "error", message: json_response["message"] }, status: :unprocessable_entity
          end
    
        # response to be returned to view
        @payment_status = response_body['status']
        @message = response_body['message']
      end
end
