class ContactController < ApplicationController

  def index
    @all_editors = Enum::Role.editor.users
    @all_writers = Enum::Role.writer.users
  end

end
