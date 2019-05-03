class Question < ApplicationRecord
    belongs_to :user_record, optional: true
    after_update :show_board
    def show_board
        team = self.user_record.before_record
        group = team.before_record
        Pusher.cluster="ap3"
        Pusher.trigger('qa-channel', 'qa-event', {group: group.content, team: team.content, question: self.content})
    end    
end

