class SignaturesController < ApplicationController
  def new
    @signature = Signature.new
  end

  def create
    @signature = Signature.new(signature_params)
    if @signature.save
      redirect_to new_user_path, notice: "Signature saved successfully!"
    else
      redirect_to new_user_path, notice: "Signature not saved!"
    end
  end

  private

  def signature_params
    params.require(:signature).permit(:user_id, :signature, :user_name)
  end
end
