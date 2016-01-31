require 'open-uri'
require 'net/http'
class Node
  include Mongoid::Document
  field :base_url, type: String

  attr_accessor :_stats

  def action_url(action)
    "#{self.base_url.sub(/\/+$/, '')}/#{action}"
  end

  def stats
    self._stats ||= JSON.parse(open(self.action_url('stats')).gets) rescue nil
    self._stats
  end

  def shutdown
    raise 'Not allowed' unless shutdown_allowed?
    url = URI.parse(self.action_url('shutdown'))
    resp, data = Net::HTTP.post_form(url, {auth_token: 'df351d97acbd7d3f7e8cabfa884315ebb5dc336f4062496c40dacba8222907f72d3e199f79c989fef040ff9b18a3b456d2d4237b3f30ddd07404f7a28c8b29a9'})
    resp['status']=='200 OK'
  end

  def shutdown_allowed?
    self.stats['uw_cpuused'] > 70
  end

end