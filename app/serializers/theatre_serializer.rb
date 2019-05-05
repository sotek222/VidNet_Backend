class TheatreSerializer < ActiveModel::Serializer
  attributes :id, :host_id, :src, :text_chat, :audio_chat, :video_chat, :is_public, :playing, :elapsed_time, :muted, :chat, :title
end
