class NotesController < ApplicationController
  before_action :set_note, only: [:destroy]

  def index
    @notes = Note.recent
  end

  def new
    @note = current_user.notes.build
  end

  def create
    @note = current_user.notes.build(note_params)
    if @note.save
      redirect_to notes_url, notice: "日記を作成しました。"
    else
      render :new, notice: "日記を作成できませんでした。"
    end
  end

  def destroy
    @note.destroy!
    redirect_to root_url, notice: "日記を削除しました。"
  end

  private

  def note_params
    params.require(:note).permit(:title, :contents, :image)
  end

  def set_note
    @note = Note.find(params[:id])
  end
end
