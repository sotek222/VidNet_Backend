class TheatreSerializer < ActiveModel::Serializer
  attributes :id, :host_id, :src, :text_chat, :audio_chat, :video_chat
end
