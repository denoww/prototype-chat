# encoding: UTF-8
class HistoricController < ApplicationController
  protect_from_forgery with: :exception

  def index
    respond_to do |f|
      f.html { render_layout }
    end
  end
end
