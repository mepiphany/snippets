class KindsController < ApplicationController

  def show
    @kind = Kind.find params[:id]
    @snippets = @kind.snippets
  end
end
