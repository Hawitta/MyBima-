class PaymentMailer < ApplicationMailer
    default from: 'iamhawiana@gmail.com' 

    def payment_confirmation(user, payment)
        @user = user
        
        recent_payment = user.user_payments.order(created_at: :desc).first

        @payment = recent_payment
       
        mail(to: @user.email, subject: 'Payment Confirmation') 
    end

    def test_email
        mail(to: 'hawiadey@gmail.com', subject: 'Test Email', body: 'This is a test email.')
      end
end

